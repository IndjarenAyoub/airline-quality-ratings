SELECT *
FROM passenger_info 

SELECT *
FROM flight_experience


-- the average age of passengers
SELECT
    ROUND(AVG(age), 0) AS average_age
FROM passenger_info


-- the gender count distribution
SELECT
    gender,
    COUNT(*)
FROM
    passenger_info
GROUP BY
    gender


-- the number/count of passengers by class
SELECT
    class,
    COUNT(*)
FROM flight_experience
GROUP BY class


-- the Highest Average Satisfaction Rating by class
SELECT
    class,
    COUNT(CASE 
          WHEN satisfaction = 'Satisfied' THEN 1 
          END) AS satisfaction_count
FROM
    flight_experience
GROUP BY
    class
ORDER BY 
    satisfaction_count DESC
LIMIT 1;

-- the satisfaction/dissatisfaction count for each type of flight travel
SELECT
    p.type_of_travel,
    COUNT(CASE 
          WHEN satisfaction = 'Satisfied' THEN 1 
          END) AS satisfaction_count,
    COUNT(CASE 
          WHEN satisfaction = 'Neutral or Dissatisfied' THEN 1 
          END) AS dessatisfaction_count
FROM 
    flight_experience AS f
JOIN 
    passenger_info AS p
ON p.id = f.id
GROUP BY
    p.type_of_travel


-- Number of Passengers in Each Age Group
SELECT
    CASE 
        WHEN age BETWEEN 0 AND 10 THEN '0-10'
        WHEN age BETWEEN 11 AND 20 THEN '11-20'
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age BETWEEN 51 AND 60 THEN '51-60'
        WHEN age BETWEEN 61 AND 70 THEN '61-70'
        ELSE '71+'
    END AS age_group,
    count(*)
FROM passenger_info
GROUP BY age_group


-- Number of Passengers Who Rated Cleanliness as 5/5
SELECT 
    COUNT(id) AS passengers_count
FROM 
    flight_experience
WHERE
    cleanliness = 5


-- the average departure delay associated with each type of travel
SELECT
    type_of_travel,
    AVG(departure_delay) AS average_departure_delay
FROM
    passenger_info AS p
JOIN flight_experience AS f
ON f.id = p.id
GROUP BY
    type_of_travel



-- calculating the percentage of flights where passengers are satisfied with cleanliness, rated as 5.
SELECT
    (COUNT(CASE WHEN satisfaction = 'Satisfied' AND cleanliness = 5 THEN 1 END) * 100 / COUNT(*)) AS percentage
FROM 
    flight_experience



/*calculating the median, lower quartile, and upper quartile satisfaction ratings for passengers 
grouped by age group and gender.*/
SELECT 
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age >= 20 AND age < 30 THEN '20-29'
        WHEN age >= 30 AND age < 40 THEN '30-39'
        WHEN age >= 40 AND age < 50 THEN '40-49'
        WHEN age >= 50 THEN '50+'
    END AS age_group,
    gender,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY satisfaction) AS median_satisfaction,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY satisfaction) AS lower_quartile_satisfaction,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY satisfaction) AS upper_quartile_satisfaction
FROM 
    passenger_info
JOIN 
    flight_experience ON passenger_info.id = flight_experience.id
GROUP BY 
    age_group, gender;



--  identifying the flights with the longest distance for each class
WITH table1 AS (
SELECT 
    id,
    class,
    flight_distance,
    RANK() OVER (PARTITION BY class ORDER BY flight_distance DESC) AS flight_dist_rank
FROM
    flight_experience
)
SELECT 
    id,
    class,
    flight_distance,
    flight_dist_rank
FROM 
    table1
WHERE
    flight_dist_rank = 1



-- retrieving flights that experienced both departure and arrival delays
SELECT 
    id,
    departure_delay,
    arrival_delay
FROM 
    flight_experience
WHERE departure_delay > 0 AND arrival_delay > 0
GROUP BY 
    id,
    departure_delay,
    arrival_delay




-- identifying flights with departure delays greater than the average delay for their respective class.
WITH table2 AS (
SELECT 
    departure_delay,
    class,
    AVG(departure_delay) OVER (PARTITION BY class) AS departure_delay_avg
FROM
    flight_experience
)
SELECT 
    departure_delay,
    class,
    departure_delay_avg
FROM 
    table2
WHERE
    departure_delay > departure_delay_avg



--  the percentage of flights that had a departure delay and resulted in satisfied passengers.
SELECT
    100 * COUNT(*) / (SELECT COUNT(*) FROM flight_experience) AS percentage_of_flights
FROM
    flight_experience
WHERE 
    departure_delay > 0 AND satisfaction = 'Satisfied'



-- the percentage of satisfied passengers for each class
SELECT
    class,
    100 * SUM(CASE 
          WHEN satisfaction = 'Satisfied' THEN 1 END) / COUNT(*) AS satisfaction_percentage
FROM
    flight_experience
GROUP BY
    class
ORDER BY 
    satisfaction_percentage DESC



-- the satisfaction rate for passengers who experienced departure delays vs. those who didn't
SELECT
    CASE 
    WHEN departure_delay > 0 THEN 'departure_delayed' 
    WHEN departure_delay = 0 THEN 'departure_onTime'
    END AS departure_situation,
    100 * SUM(CASE 
          WHEN satisfaction = 'Satisfied' THEN 1 END) / COUNT(*) AS satisfaction_rate
FROM
    flight_experience
GROUP BY
    departure_situation
