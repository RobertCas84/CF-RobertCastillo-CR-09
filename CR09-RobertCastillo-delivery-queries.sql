SELECT customer.first_name,customer.last_name
FROM customer
JOIN address
ON
customer.fk_address_id=address.address_id
JOIN delivering_route
ON 
delivering_route.fk_customer_id=customer.customer_id

/*left JOIN*/
SELECT customer.first_name, customer.last_name,customer.fk_address_id
FROM customer
LEFT JOIN address on 'fk_customer' = address_id;
/* Join*/
SELECT employees.first_name, employees.last_name,employees.department
FROM employees
JOIN address 
ON address.fk_employees_id = employees_id;
/* right join*/
SELECT customer.first_name, customer.last_name, customer.fk_address_id
FROM `customer`
RIGHT JOIN mail_station ON mail_station.fk_customer_id = customer_id;