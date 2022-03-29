CREATE DATABASE clinic;

CREATE TABLE patients(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    data_of_birth DATE
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    patient_id INT,
    status VARCHAR, 
    FOREIGN KEY(patient_id) references patients(id) 
);

CREATE TABLE invoices(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY(medical_history_id) references medical_histories(id)
);

CREATE TABLE treatments(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY(treatment_id) references treatments(id),
    FOREIGN KEY(invoice_id) references invoices(id)
);

CREATE TABLE treatment_history(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    treatment_id INT,
    medical_history_id INT,
    FOREIGN KEY(treatment_id) references treatments(id),
    FOREIGN KEY(medical_history_id) references medical_histories(id)
);
