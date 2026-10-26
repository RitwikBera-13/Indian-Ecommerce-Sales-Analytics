# Indian E-Commerce Sales Performance & Customer Analytics

## Project Overview

This project analyzes Indian e-commerce sales and customer data to understand regional revenue performance, payment preferences, customer purchasing behaviour, and monthly revenue trends.

The project combines SQL Server, Microsoft Excel, Power BI, and Business Analysis documentation to transform raw business data into meaningful insights.

## Business Problem

E-commerce businesses generate large amounts of data about orders, customers, payments, and sales. Analyzing this information helps stakeholders understand which regions perform well, how customers purchase products, and how revenue changes over time.

This project addresses these questions through structured SQL analysis, Excel-based validation, and interactive Power BI visualizations.

## Project Objectives

- Analyze delivered-order revenue across Indian states.
- Understand customer payment preferences.
- Segment customers by order frequency.
- Track monthly revenue and Month-over-Month growth.
- Validate analytical results across SQL Server, Excel, and Power BI.
- Document business requirements, user stories, acceptance criteria, and UAT test cases.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| SQL Server | Data querying, aggregation, joins, CTEs, and window functions |
| Microsoft Excel | Data validation, reconciliation, and summary analysis |
| Microsoft Power BI | Interactive dashboards and KPI visualization |
| DAX | Measures and customer analysis in Power BI |
| Visual Studio Code | SQL and Markdown documentation |
| GitHub | Project version control and portfolio presentation |

## Key Business Questions

1. Which Indian states generate the highest delivered-order revenue?
2. How do payment preferences vary across states?
3. What proportion of customers are one-time, repeat, and frequent buyers?
4. How does monthly revenue change over time?
5. Do key figures reconcile across SQL Server, Excel, and Power BI?

## Analysis Performed

### 1. Regional Revenue Analysis
- Calculated delivered-order revenue by state.
- Analyzed distinct delivered orders and unique customers.
- Calculated Average Order Value (AOV).

### 2. Payment Method Analysis
- Examined payment method distribution.
- Compared payment-related metrics using the defined status and calculation rules.

### 3. Customer Segmentation
- Classified customers according to order frequency.
- Calculated customer counts and percentages for each segment.

### 4. Monthly Revenue Analysis
- Aggregated delivered-order revenue by month.
- Used SQL window functions to compare current-month and previous-month revenue.
- Calculated Month-over-Month growth where a valid comparison was available.

## Business Analysis Documentation

The `01_documentation` folder contains:

- **Business Requirements Document (BRD):** Business problem, objectives, scope, KPIs, and deliverables.
- **Agile User Stories:** Business needs expressed as user stories with acceptance criteria.
- **UAT & Defect Log:** Test scenarios and recorded testing results.

## Data Validation and Testing

SQL Server, Excel, and Power BI were used to compare key analytical figures.

UAT test cases cover:
- State-wise revenue accuracy.
- Order-status filtering.
- Interactive dashboard filters.
- SQL query execution performance.

Testing results should be interpreted according to the recorded test evidence and the calculation rules used.

## Project Structure

```text
Indian-Ecommerce-Sales-Analytics/
├── README.md
├── 01_documentation/
├── 02_sql_queries/
├── 03_excel_analysis/
├── 04_power_bi_dashboard/
│   └── screenshots/
└── 05_project_report/
```

The structure above is illustrative. The actual repository should contain only files and folders that have been created and verified.

## How to Explore the Project

1. Read the BRD to understand the business problem and objectives.
2. Review the SQL query files to understand the analysis.
3. Open the Excel workbook to examine data validation and reconciliation.
4. Open the Power BI report to explore the dashboard.
5. Review the user stories and UAT documentation to understand the Business Analyst workflow.

## Business Value

The project demonstrates how data analysis can help stakeholders understand regional sales performance, customer purchasing patterns, payment preferences, and revenue trends.

The resulting insights can support marketing decisions, customer retention initiatives, payment strategy, and business planning.

## Limitations

- Findings depend on the quality and completeness of the available dataset.
- Comparisons between tools require consistent filters, calculation rules, and reporting periods.
- Historical trends do not guarantee future performance.
- Recommendations should be based on verified results rather than assumptions.

## Author

**Ritwik Bera**

Aspiring Data Analyst | Business Analyst | Business Intelligence Analyst