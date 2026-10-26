# Agile User Stories & Acceptance Criteria

## Project: Indian E-Commerce Sales Performance & Customer Analytics

### User Story 1: Regional Revenue Analysis

- **As a:** Regional Sales Manager
- **I want to:** Analyze revenue and Average Order Value (AOV) by state.
- **So that:** I can identify high-performing markets and support regional marketing decisions.

**Acceptance Criteria:**
1. Revenue must be calculated using the project's documented revenue definition.
2. Only delivered orders must be included in delivered-order revenue.
3. The dashboard must display revenue by state.
4. State-level revenue must reconcile with the corresponding SQL results when the same filters and definitions are applied.

### User Story 2: Payment Method Analysis

- **As a:** Finance Manager
- **I want to:** Analyze the distribution of payment methods.
- **So that:** I can understand customer payment preferences and support payment-related business decisions.

**Acceptance Criteria:**
1. The analysis must display the payment methods available in the dataset.
2. The payment-status rules must be documented and applied consistently.
3. The percentage for each payment method must be calculated using a clearly defined denominator.
4. Percentages should total approximately 100% when all categories in the same distribution are included, allowing for rounding differences.

### User Story 3: Monthly Revenue Growth Tracking

- **As an:** Operations Manager
- **I want to:** Analyze monthly revenue and Month-over-Month (MoM) growth.
- **So that:** I can identify revenue trends and support inventory planning.

**Acceptance Criteria:**
1. Revenue must be grouped by month using the order date.
2. The analysis must display current-month and previous-month revenue.
3. MoM growth must be calculated as:

   **MoM Growth (%) = ((Current Month Revenue − Previous Month Revenue) / Previous Month Revenue) × 100**

4. The first month must not display a misleading growth percentage when previous-month revenue is unavailable.
5. Results must match SQL calculations when the same filters and revenue definitions are applied.

### User Story 4: Customer Purchase Segmentation

- **As a:** Marketing Manager
- **I want to:** Segment customers according to their order frequency.
- **So that:** I can identify one-time buyers, repeat buyers, and frequent buyers for customer retention initiatives.

**Acceptance Criteria:**
1. Customers must be classified using the project's defined order-frequency rules.
2. Each customer must belong to one segment.
3. The analysis must display the number and percentage of customers in each segment.
4. Segment counts and percentages must reconcile with the SQL results.

### User Story 5: Interactive Power BI Dashboard

- **As a:** Business Stakeholder
- **I want to:** Explore sales performance through an interactive dashboard.
- **So that:** I can understand important business metrics without manually running SQL queries.

**Acceptance Criteria:**
1. The dashboard must display the agreed sales and customer KPIs.
2. Available filters must update the relevant visuals correctly.
3. Visual titles, labels, and units must be understandable.
4. Key figures must be validated against SQL results using consistent definitions.

## Definition of Done

A user story can be considered complete when:
- The required analysis or visualization has been developed.
- The calculations have been checked against the agreed business rules.
- Relevant acceptance criteria have been tested.
- Any identified defects have been documented.
- The project documentation has been updated.

