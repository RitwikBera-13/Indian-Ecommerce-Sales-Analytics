# Business Requirements Document

## Document Purpose

This document describes the questions, measures, and reporting expectations for an Indian e-commerce sales analytics portfolio project. It is intended to explain the analysis to a reviewer and to keep the SQL, Excel, and Power BI outputs consistent. It is not based on a client engagement, stakeholder interviews, or formal business approval.

## 1. Background and Business Problem

The project uses the `IndianEcommerceDB` dataset, which includes order, customer, order-item, and payment records. The analysis focuses on a practical reporting question: can the available records be used to give a consistent view of delivered revenue by customer state, customer order frequency, payment mix in selected states, and monthly revenue?

The challenge in this case study is to define the measures clearly and apply the same filters when results are checked across tools. The analysis describes the supplied data. It does not establish why customers behave a certain way or represent a confirmed problem reported by a real business.

## 2. Objectives

- Compare delivered revenue and average order value across customer states.
- Show how orders are distributed across their recorded statuses.
- Describe successful payment value by payment method in Maharashtra, Uttar Pradesh, and Gujarat.
- Group customers by recorded order count to show one-time, repeat, and higher-frequency buyers.
- Report delivered revenue by month and show its change over time.
- Check that key measures agree between the SQL analysis, Excel workbook, and Power BI report when the same population and filters are used.

## 3. Stakeholders and Responsibilities

This is a portfolio case study, so the roles below describe the intended users of the work. They are not evidence of actual stakeholder participation.

| Role | Responsibility in this case study |
|---|---|
| Portfolio analyst | Defines the measures, prepares the SQL analysis, builds or maintains the Excel and Power BI outputs, and records limitations. |
| Report reviewer | Reviews whether the questions, definitions, and displayed results are understandable and supported by the data. |
| Business or data owner (proposed) | Would confirm business definitions, data meaning, and reporting priorities if this work were adapted for a real organization. No owner has been identified for this portfolio project. |

## 4. Scope

### In Scope

- Descriptive analysis of orders, customers, and payments in `IndianEcommerceDB`.
- State-level delivered revenue and AOV.
- Order counts by recorded order status.
- Successful payment value and payment-method share for delivered orders in the three states specified in BR-03.
- Customer order-frequency segments.
- Monthly delivered revenue and month-over-month comparison.
- Presentation and reconciliation of these measures in SQL, Excel, and Power BI.

### Out of Scope

- Building or changing an online store or transaction-processing system.
- Live data feeds, real-time monitoring, or changes to the source database.
- Revenue or customer-behavior forecasting.
- Conclusions about causes, profitability, marketing effectiveness, or customer lifetime value; the available project analysis does not establish these.
- Generalizing the three-state payment comparison to all Indian states.

## 5. Business Requirements

| ID | Requirement | How the result can be checked |
|---|---|---|
| BR-01 | The analysis shall report delivered revenue by customer state, using the order subtotal plus shipping fee for orders recorded as `Delivered`. | State totals can be reproduced from the same delivered orders and summed using the stated formula. |
| BR-02 | The analysis shall report the number of orders in each recorded order-status category. | The status counts use distinct order IDs and reconcile to the count of in-scope orders, subject to missing or unrecognized status values being identified. |
| BR-03 | The analysis shall show the distribution of successful payment value by payment method for delivered orders in Maharashtra, Uttar Pradesh, and Gujarat. | Within each state, payment-method values use successful payments only and their shares total approximately 100%, allowing for rounding. |
| BR-04 | The analysis shall group customers by their number of recorded orders: one order, 2–4 orders, and 5 or more orders. | Segment counts reconcile to the distinct customers included in the customer-order analysis; segment percentages total approximately 100%. |
| BR-05 | The analysis shall report delivered revenue by order month and calculate percentage change against the immediately preceding calendar month. | Monthly revenue uses delivered orders. Growth is unavailable when the preceding calendar month's revenue is missing or zero. |
| BR-06 | The SQL, Excel, and Power BI outputs shall use consistent measure definitions and filters for results being compared. | For matching populations and filters, reported monetary values agree to the cent before display rounding, and counts agree exactly. |

## 6. Reporting Requirements

| ID | Requirement |
|---|---|
| FR-01 | The report shall make the analysis period and selected filters clear wherever they affect the displayed result. |
| FR-02 | Monetary values shall be identified as INR. Percentages shall be shown as percentages, with rounding applied consistently. |
| FR-03 | The report shall present state revenue, order status, selected-state payment mix, customer segments, and monthly revenue as separate views or clearly distinguishable sections. |
| FR-04 | A missing or undefined month-over-month growth value shall not be displayed as zero growth. |

## 7. Measures and Business Rules

| Measure or rule | Definition used in this project |
|---|---|
| Delivered revenue | `subtotal + shipping_fee` summed for orders with status `Delivered`; reported in INR. |
| Delivered orders | Distinct order IDs with status `Delivered`. |
| Average order value (AOV) | Delivered revenue divided by distinct delivered orders. |
| Payment-method share | Successful payment amount for a method divided by successful payment amount for all methods within the same state. Payment records are limited to delivered orders in Maharashtra, Uttar Pradesh, and Gujarat. This is a share of payment value, not a count of transactions. |
| Customer order count | Number of recorded orders per customer. The existing SQL counts orders without filtering by order status. |
| Customer segment | One-time buyer: 1 recorded order; repeat buyer: 2–4 recorded orders; higher-frequency buyer: 5 or more recorded orders. |
| Customer segment share | Customers in a segment divided by all customers returned by the customer-order analysis. |
| Monthly delivered revenue | `subtotal + shipping_fee` summed for delivered orders grouped by `order_date` calendar month. |
| Month-over-month growth | `(current month revenue - immediately prior calendar month revenue) / immediately prior calendar month revenue * 100`. Do not calculate when the prior month is unavailable or zero. |

These definitions follow the SQL analysis where it exists. One implementation difference remains: the current monthly SQL uses `LAG` over months that have delivered revenue, so a month with no delivered orders may be skipped. That does not always equal comparison with the immediately preceding calendar month as required by BR-05; see Dependencies and Risks.

## 8. Assumptions and Constraints

### Assumptions

- The order, customer, and payment identifiers and relationships in the supplied database are usable for the joins in the analysis.
- The recorded order and payment statuses are the source of truth for the filters in this case study.
- The values in `subtotal` and `shipping_fee` are suitable inputs to the project's delivered-revenue calculation.
- Customer order-frequency segments include orders of every status, matching the existing customer segmentation query.

### Constraints

- Findings are limited to the records and date coverage available in `IndianEcommerceDB`.
- The payment-method comparison currently covers only Maharashtra, Uttar Pradesh, and Gujarat.
- This is a descriptive portfolio analysis; there is no confirmed business sponsor, approved requirement baseline, or access to live operational data.
- The project artifacts currently available include SQL query files, an Excel workbook, a Power BI file, and this BRD. The existence of a file alone does not confirm that its contents have been fully validated.

## 9. Dependencies and Risks

| Item | Impact and response |
|---|---|
| Data completeness and status quality | Missing IDs, dates, or status values can affect counts and totals. Review data quality before interpreting results and disclose unresolved gaps. |
| Consistent definitions across tools | Different filters or formulas can produce conflicting totals. Use the business rules in this document when reconciling outputs. |
| Months with no delivered revenue | The current monthly SQL can compare against the previous month present in the results rather than the immediately preceding calendar month. Update the analysis or clarify the intended comparison before treating it as calendar month-over-month growth. |
| Order status analysis | The SQL files reviewed include an overall order count and null checks, but no status breakdown query was identified. Add and validate that analysis before claiming BR-02 is implemented. |
| Business interpretation | No business or data owner has confirmed that the selected definitions match an organization's reporting policy. Treat them as portfolio assumptions until confirmed. |

## 10. Success Criteria

The portfolio analysis will meet its stated purpose when:

1. Each in-scope measure has a written definition and uses the same filters in SQL, Excel, and Power BI.
2. State-level delivered revenue and AOV can be recalculated from the order records.
3. Order-status counts reconcile to the in-scope order population, with missing or unrecognized statuses disclosed.
4. Payment shares are based only on successful payment value for delivered orders in the three named states and total approximately 100% per state.
5. Customer segment counts and percentages reconcile to the customers included in the segmentation query.
6. Monthly revenue is grouped by order date, and growth is either calculated against the immediately previous calendar month or clearly labeled to reflect the actual comparison used.
7. Matching SQL, Excel, and Power BI totals agree to the cent for currency and exactly for counts before display rounding.

These criteria assess the quality and consistency of the portfolio outputs. They do not measure business impact for a real company.

## 11. Current Deliverables and Approval

The workspace contains SQL query files, an Excel workbook, a Power BI file, and this BRD. User stories, UAT cases, a defect log, and a final report are not listed as completed deliverables because they were not found in the project materials reviewed.

**Document status:** Portfolio draft; no formal business approval has been obtained. If used for a real project, the business or data owner should confirm the definitions, scope, and success criteria before implementation.