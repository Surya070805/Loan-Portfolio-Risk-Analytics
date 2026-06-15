--select * from fact_loans

SELECT COUNT(*) as total_loans
FROM fact_loans;

select loan_status,count(*) as loan_count 
from fact_loans 
group by (loan_status)
order by loan_count desc;

select sum(loan_amnt) as Total_loan_amount
from fact_loans;

select avg(loan_amnt) as Avg_loan_amount
from fact_loans;

select avg(int_rate) as Avg_interest_rate
from fact_loans;

select avg(annual_inc) as Avg_income
from fact_loans;

CREATE VIEW vw_loans AS
SELECT *,
       CASE
           WHEN loan_status IN ('Fully Paid','Current')
               THEN 'Good'
           ELSE 'Bad'
       END AS loan_outcome
FROM fact_loans;

SELECT loan_outcome,COUNT(*) AS loan_count
FROM vw_loans
GROUP BY loan_outcome;

select Round(100.0 * sum(case when loan_outcome='Bad' 
then 1 else 0 end)/count(*) ,2) 
as Default_rate
from vw_loans;

select grade,count(*) as loans, 
Round(100.0 * sum(case when loan_outcome='Bad' 
then 1 else 0 end)/count(*) ,2) 
as Default_rate from vw_loans 
group by grade order by grade;

select purpose,count(*) as loans,
Round(100.0 * sum(case when loan_outcome='Bad' 
then 1 else 0 end)/count(*) ,2) 
as Default_rate from vw_loans
group by purpose
order by count(*) desc;

Select home_ownership,count(*) as loans,
Round(100.0 * sum(case when loan_outcome='Bad' 
then 1 else 0 end)/count(*) ,2) 
as Default_rate from vw_loans
group by home_ownership
order by default_rate desc;

Select verification_status,count(*) as loans,
Round(100.0 * sum(case when loan_outcome='Bad' 
then 1 else 0 end)/count(*) ,2) 
as Default_rate from vw_loans
group by verification_status
order by default_rate desc;

select loan_outcome,
avg(fico_range_low) as avg_fico
from vw_loans
group by loan_outcome;

select loan_outcome,
avg(dti) as avg_dti
from vw_loans
group by loan_outcome;

select loan_outcome,
avg(annual_inc) as avg_income
from vw_loans
group by loan_outcome;

select loan_outcome,
avg(int_rate) as avg_interest_rate
from vw_loans
group by loan_outcome;

select Year(issue_d) as loan_year,
count(*) as loans from fact_loans
group by year(issue_d)
order by loan_year;

select year(issue_d) as loan_year,
round(100.0 * sum(case when loan_outcome = 'Bad' then 1 else 0 end)
/count(*) , 2 )as default_rate
from vw_loans
group by year(issue_d)
order by loan_year;

select Top 10 addr_state ,count(*) as loan_count
from fact_loans
group by addr_state
order by loan_count desc;

select Top 10 addr_state ,
round(100.0 * sum(case when loan_outcome = 'Bad' then 1 else 0 end)
/count(*) , 2 )as default_rate
from vw_loans
group by addr_state
having count(*)> 1000
order by default_rate desc;

with purpose_stats as
(select purpose,round(100.0 * 
sum(case when loan_outcome = 'Bad' then 1 else 0 end )
/count(*) ,2) as default_rate
from vw_loans group by purpose)
select *,rank() over(order by default_rate desc) as risk_rank
from purpose_stats;

with state_stats as
(select top 10 addr_state,round(100.0 * 
sum(case when loan_outcome = 'Bad' then 1 else 0 end )
/count(*) ,2) as default_rate
from vw_loans group by addr_state)
select *,dense_rank() over(order by default_rate desc) as risk_rank
from state_stats;

SELECT(CASE WHEN fico_range_low >= 750 THEN 'Low Risk'
WHEN fico_range_low >= 650 THEN 'Medium Risk'
ELSE 'High Risk'END) AS risk_segment,COUNT(*) AS loans,
ROUND(100.0 * SUM(CASE WHEN loan_outcome='Bad' THEN 1 ELSE 0 END)
/ COUNT(*),2) AS default_rate
FROM vw_loans GROUP BY
(CASE WHEN fico_range_low >= 750 THEN 'Low Risk'
WHEN fico_range_low >= 650 THEN 'Medium Risk'
ELSE 'High Risk' END);


SELECT (CASE WHEN annual_inc < 50000 THEN 'Low Income'
WHEN annual_inc < 100000 THEN 'Middle Income'
ELSE 'High Income' END)AS income_band,
COUNT(*) AS loans,ROUND(100.0 *
SUM(CASE WHEN loan_outcome='Bad' THEN 1 ELSE 0 END)
/ COUNT(*),2) AS default_rate
FROM vw_loans GROUP BY
CASE WHEN annual_inc < 50000 THEN 'Low Income'
WHEN annual_inc < 100000 THEN 'Middle Income'
ELSE 'High Income' END;

CREATE VIEW vw_portfolio_kpis AS
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_amount,
    AVG(int_rate) AS avg_interest_rate,
    AVG(annual_inc) AS avg_income
FROM vw_loans;

CREATE VIEW vw_default_by_grade AS
SELECT
    grade,
    ROUND(
        100.0 *
        SUM(CASE WHEN loan_outcome='Bad' THEN 1 ELSE 0 END)
        / COUNT(*)
    ,2) AS default_rate
FROM vw_loans
GROUP BY grade;