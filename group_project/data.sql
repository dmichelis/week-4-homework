CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_billing_info VARCHAR,
	_address VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO customer(customer_id, first_name,last_name,billing_info,address)
	VALUES(_customer_id, _first_name, _last_name, _billing_info, _address);
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_salesperson(
	_sales_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $ANYTHINGYOUWANT$
BEGIN
	INSERT INTO salesperson(sales_id, first_name, last_name)
	VALUES(_sales_id, _first_name, _last_name);
END;
$ANYTHINGYOUWANT$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_car(
	_dealer_id INTEGER,
	_make VARCHAR(150),
	_model VARCHAR(150),
	_year INTEGER,
	_color VARCHAR(150),
	_price NUMERIC(8,2),
	_status VARCHAR(10)
)
RETURNS void
AS $APPLICABLE$
BEGIN
	INSERT INTO dealer_car(dealer_id, make, model, year_, color, price, status)
	VALUES(_dealer_id, _make, _model, _year, _color, _price, _status);
END;
$APPLICABLE$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_invoice(
	_invoice_id INTEGER,
	_sales_id INTEGER,
	_dealer_id INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO invoice(invoice_id, sales_id, dealer_id, customer_id)
	VALUES(_invoice_id, _sales_id, _dealer_id, _customer_id);
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_customer_service_car(
	_car_id INTEGER,
	_make VARCHAR,
	_model VARCHAR,
	_year INTEGER,
	_color VARCHAR(150),
	_mileage INTEGER,
	_customer_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO c_car(car_id, make, model, year_, color, mileage, customer_id)
	VALUES(_car_id, _make, _model, _year, _color, _mileage, _customer_id);
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_part(
	_parts_id INTEGER,
	_type VARCHAR,
	_cost NUMERIC(6,2)
)
RETURNS void
AS $$
BEGIN
	INSERT INTO parts(parts_id, type_, cost_)
	VALUES(_parts_id, _type, _cost);
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_mechanic(
	_mechanic_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR
)
RETURNS void
AS $$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_service_ticket(
	_service_id INTEGER,
	_service_type VARCHAR,
	_service_cost NUMERIC(6,2),
	_status VARCHAR,
	_car_id INTEGER,
	_mechanic_id INTEGER,
	_parts_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_ticket(service_id, service_type, service_cost, status, car_id, mechanic_id, parts_id)
	VALUES(_service_id, _service_type, _service_cost, _status, _car_id, _mechanic_id, _parts_id);
END;
$$
LANGUAGE plpgsql;


SELECT add_customer(1,'Dimitri','Michelis','1234-4321-2345-5432','231 Cool Street, Towntown USA');
SELECT add_customer(2,'James', 'Spoon', '1111-2222-3333-4444', '456 Main Street, Daptown USA');
SELECT add_customer(3,'Rex', 'Otherspoon', '3333-7777-3333-4444', '897 Yeet Street, Yeettown USA');
SELECT add_customer(4,'Zeke', 'Hammerton', '01010-1010-1010-1010', '000 Zero Street, Phoenix AZ');


SELECT add_salesperson(1,'Peter', 'Griffin');
SELECT add_salesperson(2,'Jonny', 'Bravo');
SELECT add_salesperson(3,'Max', 'Payne');


SELECT add_car(1, 'BMW', 'KoolKar', '2020', 'Sweet Blue', '18', 'NEW');
SELECT add_car(2, 'Audi', 'Sweet', '2017', 'Sheesh Red', '11', 'USED');


SELECT add_invoice(1, 2, 1, 2);
SELECT add_invoice(2, 1, 2, 3);


SELECT add_customer_service_car(1, 'Honda', 'SUV', '1999', 'Yellow', '255532', '6');
SELECT add_customer_service_car(2, 'Dodge', 'Charger', '1977', 'Bronze', '332144', '5');


SELECT add_part(1, 'Headlights', '29.99');
SELECT add_part(2, 'Brakes', '299.99');
SELECT add_part(3, 'Tires', '189.99');


SELECT add_mechanic(1, 'Matt', 'Handyhands')
SELECT add_mechanic(2, 'Jeremy', 'Screwdriver')

SELECT add_service_ticket(1, 'oil check', '300', 'COMPLETED', 1, 1, NULL); 
SELECT add_service_ticket(2, 'flat tires', '1000', 'COMPLETED', 2, 2, 2);
SELECT add_service_ticket(3, 'broken mirrors', '798', 'IN PROGRESS', 1, 2, 1);




SELECT customer.first_name, customer.last_name, invoice.invoice_id, invoice.sales_id AS salesperson_id, dealer_car.make, dealer_car.model
FROM customer
FULL JOIN invoice
ON customer.customer_id = invoice.customer_id
FULL JOIN dealer_car
ON invoice.dealer_id = dealer_car.dealer_id
WHERE customer.last_name = 'Otherspoon';



SELECT customer.first_name AS customer_firstname, customer.last_name AS customer_lastname, c_car.car_id, c_car.model, service_type, service_cost, mechanic.first_name AS mechanic_name
FROM customer 
FULL JOIN c_car
ON customer.customer_id = c_car.customer_id
FULL JOIN service_ticket
ON c_car.car_id = service_ticket.car_id
FULL JOIN mechanic
ON service_ticket.mechanic_id = mechanic.mechanic_id
WHERE customer.customer_id = 1;