WITH base AS (
    SELECT card, 
           COUNT(DISTINCT doc_id) AS frequency, --Calculate purchase frequency
           MAX(TO_CHAR(datetime, 'YYYY-MM-DD')) AS last_purchase, --Calculate last purchase date
           '2022-06-09'::DATE - MAX(datetime)::DATE AS recency, --Calculate recency from fixed date
           SUM(summ) AS monetary --Total purchse ammount
    FROM bonuscheques b 
    GROUP BY card
    HAVING card LIKE '2000%' AND COUNT(*) > 1 --Filter-cards starting with 2000 and having more than 1 purchase
),
bins AS ( --Calculate threshold values for R, F, M using percentiles
    SELECT PERCENTILE_CONT(0.30) WITHIN GROUP (ORDER BY base.recency) AS R_30,
           PERCENTILE_CONT(0.60) WITHIN GROUP (ORDER BY base.recency) AS R_60,
           PERCENTILE_CONT(0.3) WITHIN GROUP (ORDER BY base.frequency) AS F_30,
           PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY base.frequency) AS F_80,
           PERCENTILE_CONT(0.4) WITHIN GROUP (ORDER BY base.monetary) AS M_40,
           PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY base.monetary) AS M_80
    FROM base
),
rfm AS ( --Assign R, F, M scores based on threshold values
    SELECT base.card,
           base.recency,
           base.frequency,
           base.monetary,
           CASE WHEN base.recency <= R_30 THEN 3 
                WHEN base.recency <= R_60 THEN 2 
                ELSE 1 
           END AS R, --Recency score: 3 - recently, 2 - an average time ago, 1 - a long time ago
           CASE WHEN base.frequency <= F_30 THEN 1 
                WHEN base.frequency < F_80 THEN 2 
                ELSE 3 
           END AS F, --Frequency score: 3 - frequently, 2 - infrequently, 1 - rarely
           CASE WHEN base.monetary <= M_40 THEN 1 
                WHEN base.monetary <= M_80 THEN 2 
                ELSE 3 
           END AS M --Monetary score: 3 - high spend, 2 - medium spend, 1 - low spend
    FROM base
    CROSS JOIN bins
),
rfm_groups AS ( --Create RFM segments by concatenating score
    SELECT *, CONCAT(R, F, M) AS rfm
    FROM rfm
    ORDER BY card
)
SELECT rfm, --Final aggregation by segments with description and grouping
       COUNT(*) AS "Number of Clients",
       (CASE 
            WHEN rfm = '111' THEN 'a long time ago, rarely, low spend'
            WHEN rfm = '112' THEN 'a long time ago, rarely, medium spend'
            WHEN rfm = '113' THEN 'a long time ago, rarely, high spend'
            WHEN rfm = '121' THEN 'a long time ago, infrequently, low spend'
            WHEN rfm = '122' THEN 'a long time ago, infrequently, medium spend'
            WHEN rfm = '123' THEN 'a long time ago, infrequently, high spend'
            WHEN rfm = '131' THEN 'a long time ago, frequently, low spend'
            WHEN rfm = '132' THEN 'a long time ago, frequently, medium check'
            WHEN rfm = '133' THEN 'a long time ago, frequently, high spend'
            WHEN rfm = '211' THEN 'an average time ago, rarely, low spend'
            WHEN rfm = '212' THEN 'an average time ago, rarely, medium spend'
            WHEN rfm = '213' THEN 'an average time ago, rarely, high spend'
            WHEN rfm = '221' THEN 'an average time ago, infrequently, low spend'
            WHEN rfm = '222' THEN 'an average time ago, infrequently, medium spend'
            WHEN rfm = '223' THEN 'an average time ago, infrequently, high spend'
            WHEN rfm = '231' THEN 'an average time ago, frequently, low spend'
            WHEN rfm = '232' THEN 'an average time ago, frequently, medium spend'
            WHEN rfm = '233' THEN 'an average time ago, frequently, high spend'
            WHEN rfm = '311' THEN 'recently, rarely, low spend'
            WHEN rfm = '312' THEN 'recently, rarely, medium spend'
            WHEN rfm = '313' THEN 'recently, rarely, high spend'
            WHEN rfm = '321' THEN 'recently, infrequently, low spend'
            WHEN rfm = '322' THEN 'recently, infrequently, medium spend'
            WHEN rfm = '323' THEN 'recently, infrequently, high spend'
            WHEN rfm = '331' THEN 'recently, frequently, low spend'
            WHEN rfm = '332' THEN 'recently, frequently, medium spend'
            WHEN rfm = '333' THEN 'recently, frequently, high spend'
        END) AS "Description",
       (CASE WHEN rfm = '333' THEN 'VIP'
             WHEN rfm IN ('323', '332', '233') THEN 'Promising'
             WHEN rfm IN ('222', '223', '232', '322', '212','213') THEN 'Loyal Customers'
             WHEN rfm IN ('133') THEN 'Cant Lose Them'
             WHEN rfm IN ('331', '321','313','231','221','311', '312') THEN 'At Risk Loyal'
             WHEN rfm IN ('123','122', '113','112', '132') THEN 'About to Churn'
             WHEN rfm IN ('211','131', '121', '111') THEN 'Hibernative'
        END) AS "Group" -- Business grouping of segments
FROM rfm_groups
GROUP BY rfm
ORDER BY "Group";


