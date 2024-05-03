use portfolio;
select * from coviddeaths;
select * from covidvaccinations;

-- selecting basic details

select location,date,total_cases,new_cases,total_deaths,population
from coviddeaths;

-- finding death affected ratio 

select location,date,total_cases,total_deaths,(total_deaths/total_cases)
from coviddeaths;

-- finding death , affected percentage 

select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100
as death_percentage
from coviddeaths
order by death_percentage desc;

-- finding highest number of cases

select location,date,total_cases,total_deaths 
from coviddeaths 
order by total_cases desc;

-- finding total number of deaths according to location

SELECT 
    location,
    SUM(total_cases) AS total_cases,
    SUM(total_deaths) AS total_deaths
FROM 
    coviddeaths
GROUP BY 
    location;
    
 -- finding the total number of cases, total number of deaths , the total population and death percentage location wise

select locAtion , sum(total_cases), sum(total_deaths) as deaths ,POPULATION, (sum(total_deaths)/population) as death_percent
from coviddeaths
group by location,population;

-- finding the place which had highest number of cases and displaying the population and death percentage

select location,population,max(total_cases),max(total_cases/population) as percent
from coviddeaths group by location,population order by max(total_cases) desc

-- finding the death rate 

select location,sum(total_cases),sum(total_deaths), (sum(total_deaths)*100)/sum(total_cases) as death_rate
from coviddeaths
group by location order by sum(total_deaths) desc;
