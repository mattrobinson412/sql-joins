-- Join the two tables so that every column and record appears, 
-- regardless of if there is not an owner_id --
SELECT * FROM owners JOIN vehicles ON vehicles.owner_id = owners.id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of 
-- vehicles. The first_name should be ordered in ascending order --
SELECT owners.first_name, owners.last_name, COUNT(*) FROM owners
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
ORDER BY owners.first_name, owners.last_name DESC;

-- Count number of cars for each owner and display average price for each of the cars as integers --
SELECT owners.first_name, owners.last_name, ROUND(AVG(vehicles.price)) AS avg_price
FROM owners JOIN vehicles ON owners.id = vehicles.owner_id 
GROUP BY owners.first_name, owners.last_name HAVING COUNT(*) > 1 AND AVG(vehicles.price) > 10000;