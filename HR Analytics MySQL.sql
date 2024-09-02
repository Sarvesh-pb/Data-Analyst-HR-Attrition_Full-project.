use hr_analyst;
select * from hr_2;
select * from hr_1;

-- 1.Average Attrition rate for all Departments

select a.department,format(avg(a.attrition_yes)*100,2) as Attrition_Rate
from  
( select department, attrition,
case when attrition='Yes'
then 1
else 0
end as attrition_yes from hr_1 ) as a
group by a.department;

-- 2.Average Hourly rate of Male Research Scientist

select jobrole, gender, format(avg(hourlyrate),2) as Avg_Hourly_rate
from 
hr_1
where
jobrole = 'research scientist' and gender = 'Male';

-- 3.Attrition rate Vs Monthly income stats by job role

select a.jobrole, format(avg(b.monthlyincome),2) as Avg_monthly_Income, 
format(avg(a.attrition_yes)*100,2) as Attrition_rate
from
(select jobrole, attrition,employeenumber,
case
when attrition = 'yes'
then 1
else 0
end as attrition_yes from hr_1) as a
join
hr_2 as b
on a.employeenumber = b.EmployeeID
group by a.JobRole;

-- 4.Average working years for each Department

select a.department, format(avg(b.TotalWorkingYears),2) as Avg_Woring_years
from
hr_1 as a
join
hr_2 as b
on a.EmployeeNumber = b.EmployeeID
group by a.department;

-- 5.Job Role Vs Work life balance  

select a.jobrole, format(avg(b.worklifebalance),2) as Avg_worklifebalance
from 
hr_1 as a
join
hr_2 as b
on a.EmployeeNumber = b.EmployeeID
group by a.jobrole;

-- 6.Attrition rate Vs Year since last promotion relation

select a.department, format(avg(attrition_yes)*100,2) as Attrition_rate,
format(avg(b.yearssincelastpromotion),2) as Avg_Yearssincelastpromotion
from( select department, attrition,employeenumber,
		case 
        when attrition = 'yes'
        then 1
        else 0
        end as attrition_yes from hr_1) as a
        join
        hr_2 as b
        on a.employeenumber = b.EmployeeID 
        group by a.department;
