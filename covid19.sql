select * from covid19.coviddeaths
order by 3,4;

-- select * from covid19.covidvaccinations
-- order by 3,4;

select location, date, total_cases, new_cases, total_deaths, population
from covid19.coviddeaths
order by 1,2;

-- total cases vs total deaths
 
select location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
from covid19.coviddeaths
where location like '%europe%'
order by 1,2 ;

-- Total cases Vs Population 
select location, date, total_cases, population, (total_cases/population)*100 as Percentage_infected
from covid19.coviddeaths
-- where location like '%europe%'
order by 1,2 ;

-- countries with highest infection rate compared to population
select location, population, MAX(total_cases) as Highestinfectioncount, max((total_cases/population))*100 as population_infected 
from covid19.coviddeaths
group by location, population
order by population_infected desc;

-- countries with highest death count per population
select location, max(total_deaths) as totaldeathcount 
from covid19.coviddeaths
where continent is not null
group by location
order by totaldeathcount desc ;

-- select location, max(cast(total_deaths as int)) as totaldeathcount 
-- from covid19.coviddeaths
-- where continent is not null
-- group by location
-- order by totaldeathcount desc ;

-- Total population vs vaccinations _ joining of tables
select dea.continent, dea.location, dea.population, vac.new_vaccinations
from covid19.coviddeaths dea Join covid19.covidvaccinations vac 
on dea.location=vac.location
and dea.date=vac.date
order by 1,2,3 ;






