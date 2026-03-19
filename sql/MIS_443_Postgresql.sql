/*Q2: Tạo Bảng và Import data */

-- 1. Create the schema
CREATE SCHEMA IF NOT EXISTS crm_analysis;

-- 2. Create Dimension Tables with Explicit Constraints

CREATE TABLE crm_analysis.accounts (
    account VARCHAR(255),
    sector VARCHAR(100) NOT NULL,
    year_established INT,
    revenue NUMERIC,
    employees INT,
    office_location VARCHAR(100) NOT NULL,
    
    -- Explicit Constraints for accounts
    CONSTRAINT pk_accounts PRIMARY KEY (account),
    CONSTRAINT chk_year_established CHECK (year_established >= 1800 AND year_established <= 2026),
    CONSTRAINT chk_revenue CHECK (revenue >= 0),
    CONSTRAINT chk_employees CHECK (employees > 0)
);

CREATE TABLE crm_analysis.products (
    product VARCHAR(255),
    series VARCHAR(100) NOT NULL,
    sales_price NUMERIC NOT NULL,
    
    -- Explicit Constraints for products
    CONSTRAINT pk_products PRIMARY KEY (product),
    CONSTRAINT chk_sales_price CHECK (sales_price >= 0)
);

CREATE TABLE crm_analysis.sales_teams (
    sales_agent VARCHAR(255),
    manager VARCHAR(255) NOT NULL,
    regional_office VARCHAR(100) NOT NULL,
    
    -- Explicit Constraint for sales_teams
    CONSTRAINT pk_sales_teams PRIMARY KEY (sales_agent)
);

-- 3. Create the Fact Table with Explicit Constraints

CREATE TABLE crm_analysis.sales_pipeline (
    opportunity_id VARCHAR(50),
    sales_agent VARCHAR(255) NOT NULL,
    product VARCHAR(255) NOT NULL,
    account VARCHAR(255) NOT NULL,
    deal_stage VARCHAR(50) NOT NULL,
    engage_date DATE,
    close_date DATE,
    close_value NUMERIC,
    
    -- Explicit PRIMARY KEY Constraint
    CONSTRAINT pk_sales_pipeline PRIMARY KEY (opportunity_id),
    
    -- Explicit FOREIGN KEY Constraints
    CONSTRAINT fk_pipeline_sales_agent 
        FOREIGN KEY (sales_agent) 
        REFERENCES crm_analysis.sales_teams(sales_agent),
        
    CONSTRAINT fk_pipeline_product 
        FOREIGN KEY (product) 
        REFERENCES crm_analysis.products(product),
        
    CONSTRAINT fk_pipeline_account 
        FOREIGN KEY (account) 
        REFERENCES crm_analysis.accounts(account),
        
    -- Explicit Check Constraints
    CONSTRAINT chk_deal_stage CHECK (deal_stage IN ('Prospecting', 'Engaging', 'Won', 'Lost')),
    CONSTRAINT chk_close_value CHECK (close_value >= 0),
    CONSTRAINT chk_date_order CHECK (close_date >= engage_date)
);

-- 1. Drop the date constraint temporarily
ALTER TABLE crm_analysis.sales_pipeline DROP CONSTRAINT chk_date_order;

-- 2. Change the columns to VARCHAR
ALTER TABLE crm_analysis.sales_pipeline ALTER COLUMN engage_date TYPE VARCHAR(20);
ALTER TABLE crm_analysis.sales_pipeline ALTER COLUMN close_date TYPE VARCHAR(20);

-- 3. Convert the text into proper dates
ALTER TABLE crm_analysis.sales_pipeline 
    ALTER COLUMN engage_date TYPE DATE USING TO_DATE(engage_date, 'DD-MM-YY'),
    ALTER COLUMN close_date TYPE DATE USING TO_DATE(close_date, 'DD-MM-YY');


/* Q3: viết query truy vấn */

-- Adding a new prospective client to the accounts table
INSERT INTO crm_analysis.accounts (account, sector, year_established, revenue, employees, office_location)
VALUES ('TechNova Solutions', 'technolgy', 2021, 15.5, 120, 'United States');

-- A deal progresses from 'Engaging' to 'Won', and the close values/dates are finalized
UPDATE crm_analysis.sales_pipeline
SET deal_stage = 'Won',
    close_date = '2017-12-31',  -- Assuming standard YYYY-MM-DD format is now active
    close_value = 5200
WHERE opportunity_id = '1C1I7A6R';

-- Fetching a clean, readable list of recently won deals
SELECT 
    sp.opportunity_id,
    a.account AS client_name,
    a.sector,
    t.sales_agent,
    p.product,
    sp.close_value
FROM crm_analysis.sales_pipeline sp
JOIN crm_analysis.accounts a ON sp.account = a.account
JOIN crm_analysis.sales_teams t ON sp.sales_agent = t.sales_agent
JOIN crm_analysis.products p ON sp.product = p.product
WHERE sp.deal_stage = 'Won'
ORDER BY sp.close_value DESC
LIMIT 10;

