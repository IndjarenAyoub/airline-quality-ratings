
-- Filling the passenger_info table with data
COPY passenger_info
FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 16\passenger_info.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Filling the flight_experience table with data
COPY flight_experience
FROM 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PostgreSQL 16\flight_experience.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
