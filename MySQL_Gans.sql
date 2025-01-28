/***************************
Setting up the environment
***************************/

-- Drop the database if it already exists
DROP DATABASE IF EXISTS cities_info ;

-- Create the database
CREATE DATABASE cities_info;

-- Use the database
USE cities_info;

/***************************
Creating the first table
***************************/





CREATE TABLE cities (
    city_id INT AUTO_INCREMENT,-- 
    City VARCHAR(255) NOT NULL, -- Name of the city
    Country VARCHAR(255) NOT NULL, -- Name of the country
    Latitude VARCHAR(255) NOT NULL, -- Latitude of the city
    Longitude VARCHAR(255) NOT NULL, -- Longitude of the city
    PRIMARY KEY (city_id) -- Primary key to uniquely identify each info
);
SELECT * FROM cities;

CREATE TABLE population (
    population_id INT AUTO_INCREMENT,
    city_id INT,
    Population INT , -- Population of the city
    Year_Data_Retrieved  DATETIME NOT NULL, -- Date of the measurement
	PRIMARY KEY (population_id), -- Primary key to uniquely identify each info
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect each population to its city
);

SELECT * FROM population;

CREATE TABLE weather_data_5days (
    forecast_id INT AUTO_INCREMENT,-- 
    city_id INT,
    Avg_temperature FLOAT, 
    Max_temperature FLOAT, 
    Min_temperature FLOAT, 
    Weather_prediction VARCHAR(255) NOT NULL,
    Weather_description VARCHAR(255) NOT NULL,
    Forecast_time DATETIME NOT NULL,
    Timestamp_retrieved DATETIME NOT NULL,
    PRIMARY KEY (forecast_id), -- Primary key to uniquely identify each FORECAST
    FOREIGN KEY (city_id) REFERENCES cities(city_id)-- Foreign key to connect each information to its city
);
SELECT * FROM weather_data_5days;


CREATE TABLE airports (
    airport_iata VARCHAR(255) NOT NULL,
    icao VARCHAR(255) NOT NULL, 
    Airport_name VARCHAR(255) NOT NULL, 
    Airport_name_short VARCHAR(255) NOT NULL,
    Country_Code VARCHAR(255) NOT NULL,
    Timezone VARCHAR(255) NOT NULL,
    Municipality VARCHAR(255) NOT NULL,
    PRIMARY KEY (airport_iata) -- Primary key to uniquely identify each airport
);
SELECT * FROM airports;

CREATE TABLE cities_airports (
	airport_iata VARCHAR(255) NOT NULL,
    city_id INT ,
    FOREIGN KEY (airport_iata) REFERENCES airports(airport_iata), -- Foreign key to connect info to the airport
	FOREIGN KEY (city_id) REFERENCES cities(city_id)-- Foreign key to connect each information to its city
);
SELECT * FROM cities_airports;

CREATE TABLE flights (
	flight_id INT AUTO_INCREMENT,
    airport_iata VARCHAR(255) NOT NULL,
    Arrival_time VARCHAR(255), 
    Revised_time VARCHAR(255), 
    Departure_city VARCHAR(255),
    Terminal VARCHAR(255),
    PRIMARY KEY (flight_id),-- Primary key to uniquely identify each flight
    FOREIGN KEY (airport_iata) REFERENCES airports(airport_iata)-- Foreign key to connect each information to its airport
);
SELECT * FROM flights;