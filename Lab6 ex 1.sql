--Ex 1

--1a
SELECT * FROM dealer JOIN client ON dealer.id = client.dealer_id;

--1b
SELECT dealer, c.name, c.city, c.priority, s.id, s.date, s.amount  FROM dealer LEFT OUTER JOIN client c ON dealer.id = c.dealer_id
    LEFT OUTER JOIN sell s ON c.id = s.client_id WHERE c.name IS NOT NULL AND
                                                       c.city IS NOT NULL AND
                                                       c.priority IS NOT NULL AND
                                                       s.id IS NOT NULL AND
                                                       s.date IS NOT NULL AND
                                                       s.amount IS NOT NULL;

--1c
SELECT * FROM dealer INNER JOIN client ON dealer.location = client.city;

--1d
SELECT sell.id, sell.amount, client.name, client.city FROM sell INNER JOIN client ON sell.client_id = client.id
        WHERE amount >=100 AND amount <= 500;

--1e
SELECT * FROM dealer FULL OUTER JOIN client ON dealer.id = client.dealer_id;

--1f
SELECT * FROM dealer JOIN client ON dealer.id = client.dealer_id;
SELECT client.name, client.city, dealer.name, dealer.charge FROM client INNER JOIN dealer ON dealer.id = client.dealer_id;
--1g
SELECT client.name, client.city, dealer FROM client INNER JOIN dealer ON dealer.id = client.dealer_id WHERE charge > 0.12;

--1h
SELECT c.name, c.city, s.id, s.date, s.amount, d.name , d.charge AS "commission"  FROM client c  JOIN dealer d
    ON c.dealer_id = d.id JOIN sell s ON s.client_id = c.id;

--1i
SELECT c.name, c.priority as "grade", d.name, s.id, s.amount FROM dealer d LEFT JOIN client c ON c.dealer_id = d.id
    LEFT JOIN sell s ON c.id = s.client_id WHERE priority IS NOT NULL;
