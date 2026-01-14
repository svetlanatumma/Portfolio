# 🏪 Power BI Retail Analytics Dashboard

This project is an interactive dashboard for analyzing financial and operational metrics of a pharmacy chain.  
The goal is to monitor key business indicators, identify anomalies, and generate growth hypotheses.



## 📊 Project Goals

- Monitor key **financial KPIs** (Revenue, Profit, Margin)
- Compare **store performance**, identify top and underperforming locations
- Analyze **transaction-level behavior** (receipts, sales channels, items per receipt)
- Evaluate **customer engagement** (loyalty program usage)
- Detect **operational and strategic improvement areas**
- Generate **business hypotheses** based on observed patterns and anomalies



## 🏗️ Dashboard Structure

The dashboard consists of three pages:

| Page | Description | Key Metrics |
|------|-------------|-------------|
| **1. Financial Metrics** | Overall financial performance | Revenue, Profit, Margin, ARV, trends |
| **2. Checkout Analytics** | Transaction-level analysis | Profit per receipt, items per receipt, sales channels |
| **3. Purchase Activity** | Customer behavior and operational load | Loyalty program, assortment size, time-based activity |



## 📸 Dashboard Screenshots

### Page 1: Financial Metrics
[![Financial Metrics](page_1_financial_metrics.png)](https://github.com/svetlanatumma/Portfolio/blob/main/PowerBI-Retail-Analytics/1page_FinancialMetrics.png?raw=true)

### Page 2: Checkout Analytics  
![Checkout Analytics](page_2_checkout_analytics.png)

### Page 3: Purchase Activity
![Purchase Activity](page_3_purchase_activity.png)



## 🛠️ Technologies Used

- **Power BI Desktop** – dashboard development
- **DAX** – calculated measures and KPIs
- **PostgreSQL** – data storage (for educational purposes)
- **Star Schema** – data modeling
- **Business Analytics** – hypothesis generation and insights



## 📈 Key Insights and Recommendations

- 🛒 **Online sales share only ~3%** → develop e-commerce channel
- 🏷️ **Low loyalty program engagement (8%)** → revise mechanics and communication
- 🏪 **Stores 2 and 11 are key profit drivers** → replicate their practices across locations
- 📦 **High assortment variability** → negatively impacts sales; unify assortment strategy
- ⭐ **Store 3 shows anomalously high profit** → investigate pricing policy and local factors
- 🕒 **Customer activity peaks in the first half of the day** → optimize staff scheduling



## 📁 Project Structure

```bash
PowerBI-Retail-Analytics/
├── README.md                           # 📝 Documentation
├── Power BI_Retail Analytics.pbix      # 📊 Power BI Dashboard
├── page_1_financial_metrics.png        # 📈 Financial Metrics
├── page_2_checkout_analytics.png       # 🛒 Checkout Analytics  
├── page_3_purchase_activity.png        # 🕒 Purchase Activity
└── Power Bi Dashboard Analytics_Summary.pdf  # 📋 Analysis Report
```



## 🚀 How to Use

1. Download the `Power BI_Retail Analytics.pbix` file
2. Open it in **Power BI Desktop**
3. Explore the dashboard using filters and slicers



## 📄 License

This project is created for educational purposes. All data is anonymized.




