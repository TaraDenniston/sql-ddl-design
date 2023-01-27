-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id INT REFERENCES countries
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id INT REFERENCES airlines,
  from_city INT REFERENCES cities,
  to_city INT REFERENCES cities,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE reservations
(
  id SERIAL PRIMARY KEY,
  cust_id INT REFERENCES customers,
  seat TEXT NOT NULL,
  flight_id INT REFERENCES flights
);


INSERT INTO countries
  (country_name)
VALUES
  ('Brazil'),
  ('Chile'),
  ('China'),
  ('France'),
  ('Japan'),
  ('Mexico'),
  ('Morocco'),
  ('UAE'),
  ('United Kingdom'),
  ('United States');

INSERT INTO cities
  (city_name, country_id)
VALUES
  ('Beijing', 3),
  ('Casablanca', 7),
  ('Cedar Rapids', 10),
  ('Charlotte', 10),
  ('Chicago', 10),
  ('Dubai', 8),
  ('Las Vegas', 10),
  ('London', 9),
  ('Los Angeles', 10),
  ('Mexico City', 6),
  ('New Orleans', 10),
  ('New York', 10),
  ('Paris', 4),
  ('Santiago', 2),
  ('Sao Paolo', 1),
  ('Seattle', 10),
  ('Tokyo ', 5),
  ('Washington DC', 10);

INSERT INTO airlines
  (airline_name)
VALUES
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('United');

INSERT INTO customers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Alvin', 'Leathes'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Cory', 'Squibbes'),
  ('Berkie', 'Wycliff');

INSERT INTO flights
  (airline_id, from_city, to_city, departure, arrival)
VALUES
  (7, 18, 16, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (4, 17, 8, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (5, 9, 7, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (5, 16, 10, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (6, 13, 2, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (1, 6, 1, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (7, 12, 4, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (2, 3, 5, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (2, 4, 11, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (3, 15, 14, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO reservations
  (cust_id, seat, flight_id)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (4, '12F', 3),
  (1, '20A', 4),
  (5, '23D', 5),
  (2, '18C', 6),
  (7, '9E', 7),
  (3, '1A', 8),
  (7, '32B', 9),
  (6, '10D', 10);


-- Just for fun here is a select statement that displays the original table:

-- SELECT f.id, 
--        cu.first_name, 
--        cu.last_name, 
--        r.seat, 
--        f.departure, 
--        f.arrival, 
--        a.airline_name, 
--        ci1.city_name AS from_city, 
--        co1.country_name AS from_country, 
--        ci2.city_name AS to_city, 
--        co2.country_name AS to_country 
-- FROM reservations r 
-- JOIN flights f ON r.flight_id = f.id 
-- JOIN airlines a ON f.airline_id = a.id 
-- JOIN customers cu ON r.cust_id = cu.id 
-- JOIN cities ci1 ON f.from_city = ci1.id 
-- JOIN cities ci2 ON f.to_city = ci2.id 
-- JOIN countries co1 ON ci1.country_id = co1.id 
-- JOIN countries co2 ON ci2.country_id = co2.id;
