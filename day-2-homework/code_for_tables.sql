--Customer's Table
CREATE TABLE customers(
	customers_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	FOREIGN KEY(tickets_id) REFERENCES tickets(tickets_id)
);

--Tickets Table
CREATE TABLE tickets(
	tickets_id SERIAL PRIMARY KEY,
	tickets_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(6,2),
	total_cost NUMERIC(8,2),
	FOREIGN KEY(movies_id) REFERENCES movies(movies_id)
);

--Movies Table
CREATE TABLE movies(
	movies_id SERIAL PRIMARY KEY,
	movies_name VARCHAR(150),
	movies_time NUMERIC(5,2)
);

--Concessions Table
CREATE TABLE concessions(
	concessions_id SERIAL PRIMARY KEY,
	concessions_name VARCHAR(150),
	concessions_cost NUMERIC(8,2),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);