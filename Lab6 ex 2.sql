--Ex 2

--1a
CREATE VIEW c1 AS
    SELECT date, COUNT(DISTINCT client_id) as "number", AVG(amount) as "average", SUM(amount) as "total"
        FROM sell group by date;

--1b
CREATE VIEW c2 AS SELECT date, amount FROM sell  ORDER BY amount DESC LIMIT 5;

--1c
CREATE VIEW c3 AS
    SELECT  dealer, COUNT(amount) as "number", AVG(amount) as "average", SUM(amount) as "total"
        FROM sell JOIN dealer ON dealer.id = sell.dealer_id GROUP BY dealer;

--1d
CREATE VIEW c4 AS
    SELECT dealer, SUM(amount * dealer.charge) AS "earned"
        FROM sell JOIN dealer ON dealer.id = sell.dealer_id GROUP BY dealer;
--1e
CREATE VIEW c5 AS
    SELECT location, COUNT(amount) as "number", AVG(amount) as "average", SUM(amount) as "total"
        FROM dealer JOIN sell ON dealer.id = sell.dealer_id GROUP BY location;
--1f
CREATE VIEW c6 AS
    SELECT city, COUNT(amount) as "number", AVG(amount * (dealer.charge + 1)) as "average", SUM(amount * (dealer.charge + 1)) as "total"
        FROM client JOIN dealer ON client.dealer_id = dealer.id JOIN sell ON client.id = sell.client_id GROUP BY city;

--1g
CREATE VIEW c7 AS
    SELECT c.city, SUM(s.amount * (d.charge + 1)) AS cities, SUM(amount) AS locations FROM client c  JOIN sell s ON c.id = s.client_id
         JOIN dealer d ON s.dealer_id = d.id and c.city = d.location GROUP BY city;