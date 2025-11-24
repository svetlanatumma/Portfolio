# Exploratory Data Analysis (EDA) - Laptop Prices

## Project Overview

This project performs an **Exploratory Data Analysis (EDA)** on a dataset of laptops to uncover patterns, relationships and insights about the factors influencing laptop prices.

The analysis includes data cleaning, handling missing values, univariate and bivariate analysis, outlier detection and visualization to understand the distribution and correlations within the data.

##  Dataset

The dataset used in this project is the **"Laptops Price Dataset"** from Kaggle.

## Goals of the Analysis

1.  **Data Quality Assessment:** Identify and handle missing and inconsistent data.
2.  **Price Distribution:** Understand the central tendency and spread of laptop prices.
3.  **Outlier Detection:** Identify and analyze unusually high or low prices.
4.  **Feature Relationships:** Explore how different features like `Brand`, `RAM`, `Storage` and `Touch` screen affect the final price.
5.  **Correlation Analysis:** Find which numerical features are most strongly correlated with price.

## Technologies Used

*   **Language:** Python 
*   **Libraries:**
    *   `pandas` - Data manipulation and analysis
    *   `numpy` - Numerical computations
    *   `matplotlib` - Basic plotting and visualization
    *   `seaborn` - Statistical data visualization
    *   `plotly` - Interactive visualizations

    ## Key Steps and Insights

### 1. Data Cleaning & Preprocessing
*   Handled missing values in `Screen` (filled with median), `Storage type` (filled with 'SSD') and `GPU` (filled with 'Unknown').
*   Confirmed the dataset had no duplicate entries.

### 2. Statistical Summary
*   Calculated key statistics for the `Final Price`:
    *   **Mean Price:** $1,437.53
    *   **Median Price:** $1,199.00
    *   **Standard Deviation:** $886.52

### 3. Data Visualization
*   **Price Distribution:** A histogram with KDE revealed a right-skewed distribution, meaning most laptops are clustered at lower prices, with a long tail of expensive models.
*   **Outlier Analysis:** Using IQR method, identified 103 outliers (4.77% of data), primarily consisting of high-end, expensive laptops.
*   **Bivariate Analysis:**
    *   **Brand vs. Price:** Brands like Apple, Microsoft and Razer tend to have higher average prices.
    *   **RAM vs. Price:** A clear positive correlation was observed; laptops with more RAM are generally more expensive.
    *   **Storage vs. Price:** Similar to RAM, larger storage capacities are linked to higher prices.
    *   **Touchscreen vs. Price:** Laptops with touchscreens command a higher average price.

### 4. Correlation Analysis
A correlation heatmap confirmed that `RAM`, `Storage` and `Screen` size are the numerical features most positively correlated with the `Final Price`.

## Conclusion

This EDA provides a comprehensive overview of the laptop market as captured in the dataset.
The main drivers of laptop price are **RAM, Storage capacity, and Brand**. The presence of a **touchscreen** also adds a significant premium. 
These insights can be valuable for consumers making a purchase decision, retailers planning their inventory or for building a predictive model to forecast laptop prices.

