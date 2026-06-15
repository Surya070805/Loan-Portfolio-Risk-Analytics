# Loan Portfolio Risk Analytics | Credit Risk & Lending Intelligence

## Project Overview

This project analyzes over **1 million Lending Club loan records** to identify key drivers of loan performance, borrower risk, and portfolio quality. The objective is to simulate a real-world analytics workflow used by financial institutions to evaluate lending risk, monitor portfolio health, and support data-driven credit decisions.

The project combines **Python, SQL Server, Data Modeling, and Power BI** to build an end-to-end analytics solution from raw data ingestion to executive reporting.

---

## Business Problem

Financial institutions must balance portfolio growth with credit risk. Poor lending decisions can increase defaults, reduce profitability, and negatively impact portfolio performance.

This project aims to answer questions such as:

* Which borrower segments have the highest default risk?
* How does credit quality vary across loan grades?
* What is the relationship between FICO score, DTI ratio, and loan outcomes?
* Which loan purposes carry the highest risk?
* How does portfolio performance vary across states and borrower profiles?

---

## Dataset

**Source:** Lending Club Loan Dataset

* Records: 1,047,707+
* Features: 26 selected analytical attributes
* Domain: Consumer Lending / Credit Risk

---

## Tech Stack

### Data Processing

* Python
* Pandas
* NumPy
* Jupyter Notebook / Google Colab

### Database & Analytics

* SQL Server
* T-SQL
* Views
* CTEs
* Window Functions
* Aggregations

### Business Intelligence

* Power BI
* DAX

---

## Project Architecture

```text
Raw Lending Club Dataset
            ↓
Python Data Cleaning & Profiling
            ↓
SQL Server Data Warehouse
            ↓
Fact & Dimension Modeling
            ↓
SQL Business Analysis
            ↓
Power BI Dashboard
            ↓
Business Recommendations
```

---

## Data Modeling

### Fact Table

**fact_loans**

Contains loan-level transactional and borrower information.

### Dimension Tables

* dim_date
* dim_grade
* dim_purpose
* dim_geography

### Business View

**vw_loans**

Additional analytical layer containing derived business metrics such as loan outcome classification.

### Star Schema

```text
               dim_date
                   |
                   |
dim_grade ---- fact_loans ---- dim_geography
                   |
                   |
             dim_purpose
```

---

## SQL Analysis Performed

### Portfolio Analysis

* Loan volume analysis
* Funding analysis
* Interest rate analysis

### Credit Risk Analysis

* Default rate by grade
* Default rate by purpose
* Default rate by state
* High-risk borrower identification

### Borrower Analysis

* Income segmentation
* DTI analysis
* Credit score analysis
* Employment profile analysis

### Advanced SQL Concepts

* CTEs
* Window Functions
* Ranking Functions
* Business Views
* Aggregations
* Data Modeling

---

## Key Insights

### Credit Quality

* Loan grades showed a strong relationship with loan outcomes.
* Higher-risk grades experienced significantly higher default rates.

### Borrower Risk

* Borrowers with lower FICO scores exhibited higher default tendencies.
* Higher DTI ratios were associated with increased risk.

### Loan Purpose Analysis

* Small business loans showed the highest risk profile.
* Credit card and car loans demonstrated comparatively lower risk.

### Income Analysis

* Higher-income borrowers generally performed better than lower-income segments.

---

## Dashboard Features

### Executive Overview

* Total Loans
* Total Funded Amount
* Average Interest Rate
* Portfolio Default Rate

### Risk Analysis

* Default Rate by Grade
* Default Rate by Purpose
* Default Rate by Geography

### Borrower Analytics

* FICO Score Distribution
* DTI Analysis
* Income Segmentation

### Trend Analysis

* Loan Issuance Trends
* Portfolio Performance Trends

---

## Business Recommendations

* Implement stricter approval criteria for high-risk loan grades.
* Monitor small business lending segments more closely.
* Prioritize borrowers with stronger credit profiles.
* Incorporate DTI and FICO-based risk scoring into underwriting decisions.
* Enhance portfolio monitoring through continuous risk dashboards.

---

## Skills Demonstrated

### Data Analytics

* Exploratory Data Analysis
* Credit Risk Analytics
* KPI Development
* Business Insights Generation

### SQL

* Data Modeling
* Star Schema Design
* Views
* CTEs
* Window Functions
* Ranking Functions
* Aggregations

### Power BI

* Dashboard Development
* Data Modeling
* DAX Measures
* Interactive Reporting

### Business Intelligence

* Risk Assessment
* Portfolio Monitoring
* Decision Support Analytics

---

## Outcome

This project demonstrates the complete lifecycle of a real-world analytics solution, from raw data ingestion and cleaning to dimensional modeling, SQL-based business analysis, executive dashboard development, and actionable business recommendations.
