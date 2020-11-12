SELECT customer.first_name,customer.last_name
FROM customer
JOIN address
ON
customer.fk_address_id=address.address_id
JOIN delivering_route
ON 
delivering_route.fk_customer_id=customer.customer_id