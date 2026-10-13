# Loan Portfolio Risk Analytics | Credit Risk & Lending Intelligence

[![Power BI](https://img.shields.io/badge/Power_BI-PBIP_%26_PBIR-F2C811?logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQL Server](https://img.shields.io/badge/SQL_Server-T--SQL-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![Python](https://img.shields.io/badge/Python-Data_Cleaning_%26_EDA-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Model](https://img.shields.io/badge/Semantic_Model-TMDL-blue)](https://learn.microsoft.com/power-bi/developer/projects/projects-overview)

An end-to-end Financial Business Intelligence and Credit Risk Analytics platform engineered to monitor loan portfolio health, uncover default risk drivers, profile borrower creditworthiness, and deliver actionable data-driven lending intelligence.

Built using **Python, SQL Server (Star Schema), and modern Power BI Developer Mode (`.pbip` with PBIR & TMDL)**.

---

## Preview

<img width="1918" height="900" alt="Loan Portfolio Risk Analytics Dashboard" src="https://github.com/user-attachments/assets/29356fc8-3bf6-4f1e-82a4-846494f8c91d" />

---

## Table of Contents
1. [Business Problem & Objectives](#business-problem--objectives)
2. [Dataset Overview](#dataset-overview)
3. [End-to-End Architecture](#end-to-end-architecture)
4. [Data Modeling & Star Schema](#data-modeling--star-schema)
5. [Power BI Dashboard Pages](#power-bi-dashboard-pages)
   - [Page 1: Executive Overview](#page-1-executive-overview)
   - [Page 2: Credit Risk Analysis](#page-2-credit-risk-analysis)
   - [Page 3: Borrower Analysis](#page-3-borrower-analysis)
   - [Page 4: Geographic Analysis](#page-4-geographic-analysis)
6. [Interactive & Visual Engineering](#interactive--visual-engineering)
7. [SQL Analysis & Business Views](#sql-analysis--business-views)
8. [Key Business Insights](#key-business-insights)
9. [Strategic Recommendations](#strategic-recommendations)
10. [Repository Structure & How to Run](#repository-structure--how-to-run)

---

## Business Problem & Objectives

Lending institutions must constantly balance **portfolio volume growth** with **credit default risk**. Uninformed lending decisions erode capital, elevate provisions, and suppress net interest margins (NIM).

This analytics solution was designed to address core credit risk questions:
- **Portfolio Health:** Is the loan portfolio expanding sustainably or accumulating credit risk?
- **Credit Quality:** How accurately does the loan grading system reflect actual default rates?
- **Borrower Risk Profile:** What thresholds of FICO score, DTI ratio, annual income, and employment length signify high default probability?
- **Purpose Risk:** Which loan purposes generate disproportionate credit losses?
- **Geographic Risk:** Which states and regions demonstrate systemic default concentrations requiring tightened underwriting guidelines?

---

## Dataset Overview

* **Source:** Lending Club Loan Dataset
* **Total Volume Analyzed:** **1,047,707+ loans**
* **Total Funded Capital:** **$15.97 Billion**
* **Time Span:** Multi-year loan origination portfolio
* **Attributes Analyzed:** Loan amount, funded amount, interest rate, installment, grade/sub-grade, employment length, home ownership, annual income, verification status, issue date, loan status, loan outcome (Good vs. Bad), purpose, DTI ratio, state, and FICO score brackets.

---

## End-to-End Architecture

```text
       Raw Lending Club Data (CSV)
                   ↓
      Python (Pandas / NumPy / EDA)
      Data Cleaning, Type Casting & Feature Selection
                   ↓
      SQL Server Data Warehouse (T-SQL)
      Fact & Dimensional Star Schema Modeling + Business Views
                   ↓
      Power BI Developer Mode (.pbip)
      TMDL Semantic Model + 100% Native PBIR Visuals
                   ↓
      Interactive 4-Page Executive Dashboard
      Executive Overview | Credit Risk | Borrower Analysis | Geographic Analysis
```

---

## Data Modeling & Star Schema

The data model follows an optimized Kimball Star Schema in SQL Server and Power BI:

<img width="932" height="715" alt="Star Schema Data Model" src="https://github.com/user-attachments/assets/a3dcf8be-f7c9-492f-9b73-6c10f543ce7d" />

### Fact Table
* **`fact_loans`**: Core transactional table with loan amount, funded amount, interest rate, installment, borrower metrics, and status flags.

### Dimension Tables
* **`dim_date`**: Loan issuance dates, years, quarters, and temporal sort attributes.
* **`dim_grade`**: Credit risk grades (`A` through `G`) and sub-grades with ordinal sort keys.
* **`dim_purpose`**: Standardized loan purposes (Debt Consolidation, Credit Card, Small Business, Home Improvement, etc.) with clean Title Case display columns.
* **`dim_geography`**: U.S. states (`addr_state`), full names (`State Display`), regions (West, Midwest, South, Northeast), and calibrated risk segmentations.
* **`dim_risk_profile`**: Benchmark matrix mapping low-risk vs. high-risk thresholds across FICO, DTI, Income, Employment, and Home Ownership.

### Analytical View
* **`vw_loans`**: High-performance semantic view containing derived flags (e.g., `loan_outcome` as `'Good'` vs `'Bad'`, FICO Score midpoint, DTI brackets, Income ranges, and calibrated risk tiers).

---

## Power BI Dashboard Pages

The dashboard is structured into **4 focused analytical pages**, built with **100% native Power BI visuals** (no static background images):

### Page 1: Executive Overview
* **KPI Metrics:** Total Loans (`1,047,707`), Total Funded Amount (`$15.97bn`), Average Interest Rate (`13.2%`), Average Annual Income (`$75.14K`), Good Loan % (`86.03%`), and Bad Loan % (`13.97%`).
* **Loan Trend by Year:** Dual-axis Combo Chart (Columns: Total Loans, Line: Total Funded Amount) with an interactive **Zoom Slider** for custom temporal analysis.
* **Loan Status Distribution:** Donut Chart illustrating Good Loans (`86.03%` green) vs. Bad Loans (`13.97%` red).
* **Loan Distribution by Grade:** Column chart breaking down volume and exposure across risk tiers A through G.
* **Loan Distribution by Purpose:** Horizontal bar chart highlighting top borrower motivations led by Debt Consolidation and Credit Cards.
* **Slicer Sidebar:** 6 interactive dropdown slicers (Date, Grade, Purpose, Home Ownership, State, Loan Status) with a persistent guidance callout.

### Page 2: Credit Risk Analysis
* **Risk KPIs:** Total Loans, Bad Loans, Overall Portfolio Default Rate (`13.97%`), Total Funded Amount, and High-Risk Grade Volume.
* **Default Rate by Grade:** Combo Chart tracking volume against default rate per grade, revealing exponential risk escalation in Grades E, F, and G.
* **Default Rate by Purpose (Top 8):** Bar chart tracking risk across loan purposes against the portfolio benchmark line.
* **Default Rate by State (Top 10):** Bar chart highlighting top state default concentrations.
* **Outcome by Home Ownership:** Comparative chart contrasting default rates across Mortgage, Own, and Rent categories.
* **High-Risk Benchmark Tables:** Tabular views ranking purposes and states exceeding portfolio default benchmarks with soft conditional formatting heatmaps.

### Page 3: Borrower Analysis
* **Borrower KPIs:** Total Loans, Good Loans, Bad Loans, Average Annual Income (`$74.69K`), Average DTI (`13.33%`), and Average FICO Score (`693`).
* **FICO Score vs. Default Rate:** Dual-axis Combo Chart demonstrating an inverse relationship: default rates decline from `39.6%` (<580 FICO) to `4.3%` (780+ FICO).
* **DTI Ratio vs. Default Rate:** Dual-axis Combo Chart demonstrating risk escalation from `6.2%` (0-5% DTI) to `41.5%` (>25% DTI).
* **Annual Income vs. Default Rate:** Dual-axis Combo Chart tracking income progression against default risk.
* **Employment Length vs. Default Rate:** Dual-axis Combo Chart revealing default rate mitigation as job tenure exceeds 5+ years.
* **Loan Amount vs. Default Rate:** Multi-bracket loan volume and risk correlation.
* **Borrower Profile Summary:** Executive comparison matrix mapping Low-Risk vs. High-Risk criteria.

### Page 4: Geographic Analysis
* **Geographic KPIs:** Total Loans, Total Funded Amount, Overall Default Rate, States Represented (`50`), Top State by Volume (`CA`), and Highest Default Rate State (`AL` / `LA`).
* **Loan Amount by State (Map):** US Choropleth Map colored by Total Funded Amount ($0 to $1.5bn+ gradient).
* **Default Rate by State (Map):** US Choropleth Map colored by Default Rate % (0% to 30%+ gradient).
* **Default Rate by Region:** Dual-axis Combo Chart displaying regional loan distribution and default rates across South, Midwest, West, and Northeast.
* **Top 10 States Benchmark Tables:** Ranked tables for volume and default rate.
* **Risk Segmentation by State:** Donut chart and benchmark summary grouping states into 4 calibrated risk tiers.

---

## Interactive & Visual Engineering

1. **In-Header Navigation System:** Sleek, clickable pill navigation buttons (`Overview`, `Credit Risk`, `Borrower Analysis`, `Geographic Analysis`) in the top banner on all pages with active-state highlighting and hover illumination using native `PageNavigation`.
2. **Rich Multi-Metric Hover Tooltips:** Contextual data cards displaying Volume, Funded Value ($), and Default Rate % on every chart, map, and donut slice.
3. **Interactive Timeline Zooming:** Zoom slider on Page 1 time series chart for dynamic year-level filtering.
4. **Conditional Formatting Risk Heatmaps:** Subtle two-stop color gradient (`#FEF2F2` to `#FCA5A5`) on table default rate columns.
5. **Bidirectional Cross-Filtering:** Enabled across all visual containers (`drillFilterOtherVisuals: true`).
6. **PBIP Developer Mode:** Fully serialized in Microsoft's Power BI Enhanced Report format (`.pbir`) and Tabular Model Definition Language (`.tmdl`), enabling clean Git version control and team CI/CD workflows.

---

## SQL Analysis & Business Views

Key SQL queries engineered in [`SQLQuery1.sql`](SQLQuery1.sql) and documented in [`SQL queries Doc.docx`](SQL%20queries%20Doc.docx):

```sql
-- 1. Portfolio Overall Performance Summary
SELECT 
    COUNT(loan_id) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    AVG(int_rate) AS avg_interest_rate,
    AVG(annual_inc) AS avg_annual_income,
    ROUND(CAST(SUM(CASE WHEN loan_outcome = 'Bad' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS default_rate_pct
FROM vw_loans;

-- 2. Credit Grade Risk Escalation
SELECT 
    grade,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded,
    SUM(CASE WHEN loan_outcome = 'Bad' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(CAST(SUM(CASE WHEN loan_outcome = 'Bad' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS default_rate_pct
FROM vw_loans
GROUP BY grade
ORDER BY grade ASC;

-- 3. Top High-Risk States
SELECT 
    addr_state,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_outcome = 'Bad' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(CAST(SUM(CASE WHEN loan_outcome = 'Bad' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS default_rate_pct
FROM vw_loans
GROUP BY addr_state
HAVING COUNT(*) >= 500
ORDER BY default_rate_pct DESC;
```

---

## Key Business Insights

1. **Grade Segmentation Predicts Risk:** Default rate increases monotonically from **Grade A (~5.9%)** to **Grade G (>35%)**, confirming that credit grading accurately segments loss risk.
2. **DTI and FICO Multiplier Effect:** Borrowers with FICO < 640 paired with DTI > 20% demonstrate a **4x higher default rate** compared to prime borrowers (FICO > 720, DTI < 15%).
3. **Purpose-Driven Disparities:** Small business loans represent the highest risk segment (default rate > 22%), whereas credit card refinancing and car loans represent significantly lower loss severity.
4. **Regional Risk Concentration:** The **Southern region** exhibits the highest aggregate default rate (exceeding 16%), led by AL, MS, AR, and LA, while the **Northeast** and **West** maintain lower default rates despite representing higher funding volumes.

---

## Strategic Recommendations

* **Underwriting Policy:** Establish strict debt-to-income caps (maximum 20%) for borrowers with FICO scores below 660.
* **Risk-Based Pricing:** Increase risk premiums on Grades D through G or institute collateral/co-signer requirements for small business loans.
* **Geographic Limits:** Implement regional exposure limits in states exhibiting default rates > 20% until localized macroeconomic recovery or tighter qualification thresholds are met.
* **Tenure Verification:** Factor employment stability into automated decisioning; borrowers with 5+ years of tenure exhibit significantly lower credit delinquency.

---

## Repository Structure & How to Run

### Structure
```text
├── Finance Dash Board.pbip         # Power BI Developer Project entry file
├── Finance Dash Board.Report/       # PBIR report definitions (pages, visuals, layouts)
│   └── definition/
│       ├── pages/                  # Page 1 (Overview), Page 2 (Risk), Page 3 (Borrower), Page 4 (Geo)
│       └── report.json             # Report metadata & configuration
├── Finance Dash Board.SemanticModel/# TMDL semantic model definitions
│   └── definition/
│       ├── tables/                 # dim_date, dim_grade, dim_purpose, dim_geography, vw_loans, dim_risk_profile
│       └── model.tmdl              # Model relationships & properties
├── Finance Dash Board.pbix         # Compiled Power BI file for direct opening
├── SQLQuery1.sql                   # T-SQL scripts for views, KPIs & analytics
├── SQL queries Doc.docx            # Comprehensive SQL analysis documentation
└── README.md                       # Complete project documentation
```

### How to Run

#### Option A: Power BI Developer Project (`.pbip` — Recommended)
1. Ensure you have **Power BI Desktop** installed (with Developer Mode / PBIR enabled).
2. Clone this repository:
   ```bash
   git clone https://github.com/Surya070805/Loan-Portfolio-Risk-Analytics.git
   ```
3. Double-click **`Finance Dash Board.pbip`** to open the fully serialized project with source-controlled visuals and TMDL model.

#### Option B: Standalone Power BI Report (`.pbix`)
1. Open **`Finance Dash Board.pbix`** directly in Power BI Desktop to interact with the dashboards.

#### Option C: Database Setup (`.sql`)
1. Open SQL Server Management Studio (SSMS).
2. Execute [`SQLQuery1.sql`](SQLQuery1.sql) to create the schema, views, and analytical metrics.
