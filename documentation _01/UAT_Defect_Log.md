# User Acceptance Testing (UAT) & Defect Log

## 1. Purpose

The purpose of User Acceptance Testing (UAT) is to verify that the Indian E-Commerce Sales Performance & Customer Analytics project meets its business requirements and produces consistent results across SQL Server, Excel, and Power BI.

## 2. UAT Test Cases

| Test Case ID | Feature Tested | Execution Steps | Expected Result | Actual Result | Status |
|---|---|---|---|---|---|
| TC-01 | State Revenue Accuracy | Compare Maharashtra's delivered-order revenue in SQL Server Management Studio (SSMS), Excel, and Power BI using the same calculation rules. | Revenue matches across all three tools. | Reported revenue: ₹2,770,34,450.19; exact match reported across the tools. | PASS* |
| TC-02 | Order Status Filter | Apply the Delivered status filter and verify the relevant revenue measures. | Cancelled and other non-delivered orders are excluded from delivered-order revenue. | Cancelled orders were reported as excluded. | PASS* |
| TC-03 | Interactive State Slicer | Select Uttar Pradesh in the Power BI state slicer and check the relevant visuals. | Relevant KPI cards and charts update according to the selected state. | Visuals were reported to update correctly. | PASS* |
| TC-04 | Query Execution Performance | Execute the Month-over-Month (MoM) window-function query in SSMS and record its execution time. | Query completes within the project's target of 3 seconds in the test environment. | Reported execution time: 0.42 seconds. | PASS* |

\*Retain PASS only if you personally executed the test and verified the recorded result.

## 3. Defect Log

| Defect ID | Description | Severity | Status | Resolution |
|---|---|---|---|---|
| — | No defects recorded in the tests listed above. | — | — | Update this section if a defect is identified. |

## 4. Testing Notes

- Revenue comparisons must use the same order-status filters, revenue definitions, and reporting periods.
- Dashboard interactions should be tested using the actual Power BI report.
- Query execution time may vary depending on the machine, database size, indexes, and execution environment.
- Record any failed test, investigate the cause, document the fix, and retest before marking it as passed.

## 5. UAT Summary

The four test cases listed above have reported PASS results. These results should be retained only after the corresponding checks have been completed and verified.

Additional test cases may be added for payment method analysis, customer segmentation, and monthly revenue reconciliation.
