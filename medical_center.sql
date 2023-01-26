DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    doctor INT REFERENCES doctors(id),
    patient INT REFERENCES patients(id)
);

CREATE TABLE diagnoses
(
    code INT PRIMARY KEY,
    description TEXT
);

CREATE TABLE patients_diagnoses
(
    id SERIAL PRIMARY KEY,
    patient INT REFERENCES patients(id),
    visit INT REFERENCES visits(id),    
    diagnosis INT REFERENCES diagnoses(code)
);