CREATE TABLE room(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(300), price integer, owned_by integer, booked_by integer, street VARCHAR(60), apt_suite VARCHAR(60), city VARCHAR(60), county VARCHAR(60), postcode VARCHAR(8), booked_date_from date, booked_date_to date);