-- Ioana A Mititean
-- 22.3: SQL Joins Exercise


-- 1) Join the two tables so that every column and record appears, regardless of if there is not
-- an owner_id.
SELECT *
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id;


-- 2) Count the number of cars for each owner. Display the owners' first_name, last_name and count
-- of vehicles. The first_name should be ordered in ascending order.
SELECT first_name, last_name, COUNT(*) AS num_vehicles
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY first_name ASC;


-- 3) Count the number of cars for each owner and display the average price for each of the cars
-- as integers. Display the owners first_name, last_name, average price and count of vehicles. The
-- first_name should be ordered in descending order. Only display results with more than one
-- vehicle and an average price greater than 10000.
SELECT first_name, last_name, ROUND(AVG(price)) AS avg_price, COUNT(*) AS num_vehicles
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id
HAVING AVG(price) > 10000
AND COUNT(*) > 1
ORDER BY first_name DESC;
