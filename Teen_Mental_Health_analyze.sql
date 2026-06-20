create database socialmedia;
use socialmedia;

select*from teen_analyze;

-- What is the total number of students in the dataset?
select count(*)as total_students from teen_analyze;

-- Which social media platform is used the most?
select platform_usage , count(platform_usage) from teen_analyze
group by platform_usage
order by count(platform_usage) desc limit 1;

-- What is the average daily social media usage time?
select round(avg(daily_social_media_hours),2) as Average_usage_time 
from teen_analyze;

-- Which age group spends the most time on social media?
select age , avg(daily_social_media_hours)as Avg_Hours_spent from teen_analyze
group by age 
order by  Avg_Hours_spent desc;

-- What is the average stress level by gender?
select gender , round(avg(stress_level),2) as average_stress_level
from teen_analyze
group by gender;

-- Which age group has the highest average stress level?
select age , round(avg(stress_level),2) as average_stress_level
from teen_analyze
group by age
order by average_stress_level desc ;

-- What is the average sleep duration for students?
select round(avg(sleep_hours),2) as average_sleep_hours
from teen_analyze;

-- Which social media platform users get the least sleep?
select platform_usage , round(avg(sleep_hours),2) as average_sleep_duration
from teen_analyze
group  by platform_usage 
order by average_sleep_duration desc limit 1;

-- Does higher social media usage correspond to higher stress levels?
select
case
    when daily_social_media_hours < 2 Then 'Low Usage'
    when daily_social_media_hours between 2 and 5 then 'Medium Usage'
    else  "High Usage"
End as usage_category,
avg(stress_level) as average_stress
from Teen_analyze
group by usage_category
order by average_stress desc;

-- Does sleep duration affect academic performance?
select 
case
    when sleep_hours < 6 then "Low Sleep"
    when sleep_hours between 6 and 8 then "Normal Sleep"
    else "High sleep"
end as sleep_category,
round(avg(academic_performance),2) as avg_perf
from teen_analyze
group by sleep_category
order by avg_perf desc;
    
-- Does physical activity reduce stress levels?
select physical_activity , avg(stress_level)
from teen_analyze
group by physical_activity
order by avg(stress_level) desc;
