# Customer Segmentation in the Beauty Industry using K-Means Clustering (SAS)

This project applies the 7-step Marketing Analytics process to perform customer segmentation for a leading online beauty and cosmetics retailer. The analysis leverages SAS Studio to uncover valuable customer insights using K-Means Clustering.

---

## 📊 Project Overview

The beauty and cosmetics industry has experienced significant online growth, making personalized marketing increasingly important. This project segments customers based on their Age, Annual Income, and Spending Score to help the company tailor its marketing strategies more effectively.

---

## 🧠 7-Step Marketing Analytics Process

### 1. Business Problem Understanding:
The Chief Marketing Officer aims to shift from targeting periodic "big spenders" to a more data-driven segmentation strategy to boost engagement and conversion through customized marketing campaigns.

### 2. Data Understanding and Collection:
Data was sourced from the `ClusterData` dataset provided in the `MKTG525`library. It contains basic behavioral and demographic attributes of online shoppers.

### 3. Data Preparation and Feature Selection:
- Outliers were removed using the IQR method on Annual Income.
- Data was standardized using `PROC STDIZE` to bring all features into the same range.
- Final variables used: `Age`, `Annual_Income`, `Spending_Score`.

### 4. Modeling Development:
- K-Means Clustering was performed for values of K from 3 to 7.
- The clustering was repeated using `PROC FASTCLUS`.
- Metrics used for evaluation: R-Squared, Final Seed Standard Deviation, and Pseudo F Statistic.

### 5. Model Evaluation and Interpretation:
- The best number of clusters was determined to be **K = 7**, based on:
  - Highest R-Squared (~0.7575),
  - Lower final seed variance (~0.13),
  - Competitive Pseudo F (~3784).
- Final cluster assignments were appended to the original (cleaned) data.

### 6. Model and Results Communication:
- Summary statistics were calculated for each cluster using `PROC MEANS`.
- Clusters were interpreted based on demographic and behavioral patterns to inform targeted marketing strategies.

### 7. Model Deployment:
- Results can be used to design tailored campaigns for each segment.
- Clustering pipeline can be automated in SAS for regular customer analysis.

---

## 💻 Files Included

- `customer_segmentation.sas`: Complete SAS code including data prep, clustering, and analysis.
- `segmentation_summary.docx`: Word document outlining the 7-step process.
- `readme.md`: Project documentation.
- [Optional] `visualizations/`: Folder for cluster plots and graphs (if exported).

---

## 📌 Tools Used

- SAS Studio
- K-Means Clustering (`PROC FASTCLUS`)
- `PROC UNIVARIATE`, `PROC MEANS`, `PROC CORR`, `PROC SQL`
