USE test
-- Create the Person table
CREATE TABLE Person (
  person_id INT PRIMARY KEY,
  surname VARCHAR(50),
  first_name_1 VARCHAR(50),
  first_name_2 VARCHAR(50),
  passport_number VARCHAR(50)
);

-- Create the Address table
CREATE TABLE Address (
  address_id INT PRIMARY KEY,
  person_id INT,
  street VARCHAR(100),
  street_number VARCHAR(10),
  zip_code VARCHAR(10),
  city VARCHAR(100),
  country VARCHAR(100),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Create the Contact table
CREATE TABLE Contact (
  contact_id INT PRIMARY KEY,
  person_id INT,
  email VARCHAR(100),
  telephone VARCHAR(20),
  FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
