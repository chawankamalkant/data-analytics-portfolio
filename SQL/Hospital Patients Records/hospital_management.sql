CREATE DATABASE hospital_management;
USE hospital_management;

-- Table 1: Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_number VARCHAR(15),
    address VARCHAR(100)
);
SELECT * FROM Patients;

-- Table 2: Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    contact_number VARCHAR(15)
);
SELECT * FROM Doctors;

-- Table 3: Appointments
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
SELECT * FROM Appointments;

-- Table 4: Treatments
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    diagnosis VARCHAR(100),
    medicine_prescribed VARCHAR(100),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
SELECT * FROM Treatments;

-- Table 5: Billing
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
SELECT * FROM Billing;

-------------------------------------------------------------------------------------------

INSERT INTO Patients (first_name, last_name, gender, age, contact_number, address)
VALUES
('Rohit', 'Sharma', 'Male', 34, '9876543210', 'Mumbai'),
('Sneha', 'Patil', 'Female', 28, '9123456789', 'Pune'),
('Amit', 'Desai', 'Male', 45, '9988776655', 'Nashik'),
('Priya', 'Joshi', 'Female', 32, '9012345678', 'Thane'),
('Karan', 'Verma', 'Male', 40, '9765432109', 'Nagpur'),
('Neha', 'Reddy', 'Female', 26, '9812233445', 'Hyderabad'),
('Raj', 'Singh', 'Male', 50, '9821122334', 'Delhi'),
('Anita', 'Nair', 'Female', 37, '9998877665', 'Kochi'),
('Vikram', 'Kale', 'Male', 29, '9776655443', 'Pune'),
('Meena', 'Iyer', 'Female', 31, '9900112233', 'Chennai');

INSERT INTO Doctors (doctor_name, specialization, contact_number)
VALUES
('Dr. Mehta', 'Cardiologist', '9001112233'),
('Dr. Rao', 'Dermatologist', '9004445566'),
('Dr. Iyer', 'Orthopedic', '9007778899'),
('Dr. Patel', 'Neurologist', '9002223344'),
('Dr. Singh', 'Pediatrician', '9005556677'),
('Dr. Ghosh', 'ENT Specialist', '9008889990'),
('Dr. Bansal', 'General Physician', '9003332211'),
('Dr. Fernandes', 'Gynecologist', '9009998877'),
('Dr. Deshmukh', 'Dentist', '9004443322'),
('Dr. Thomas', 'Oncologist', '9007776655');

alter table Doctors
add years_of_experience int;

UPDATE Doctors SET specialization = 'Dentist' WHERE years_of_experience = 8;

UPDATE Doctors SET years_of_experience = 15 WHERE doctor_name = 'Dr. Mehta';
UPDATE Doctors SET years_of_experience = 10 WHERE doctor_name = 'Dr. Rao';
UPDATE Doctors SET years_of_experience = 8  WHERE doctor_name = 'Dr. Iyer';
UPDATE Doctors SET years_of_experience = 10 WHERE doctor_name = 'Dr. Patel';
UPDATE Doctors SET years_of_experience = 6  WHERE doctor_name = 'Dr. Singh';
UPDATE Doctors SET years_of_experience = 9  WHERE doctor_name = 'Dr. Ghosh';
UPDATE Doctors SET years_of_experience = 7  WHERE doctor_name = 'Dr. Bansal';
UPDATE Doctors SET years_of_experience = 1 WHERE doctor_name = 'Dr. Fernandes';
UPDATE Doctors SET years_of_experience = 15  WHERE doctor_name = 'Dr. Deshmukh';
UPDATE Doctors SET years_of_experience = 14 WHERE doctor_name = 'Dr. Thomas';


INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, '2025-11-01', 'Completed'),
(2, 2, '2025-11-03', 'Completed'),
(3, 3, '2025-11-04', 'Cancelled'),
(4, 4, '2025-11-05', 'Scheduled'),
(5, 5, '2025-11-06', 'Completed'),
(6, 6, '2025-11-07', 'Scheduled'),
(7, 7, '2025-11-08', 'Completed'),
(8, 8, '2025-11-09', 'Completed'),
(9, 9, '2025-11-10', 'Scheduled'),
(10, 10, '2025-11-11', 'Completed');

INSERT INTO Treatments (appointment_id, diagnosis, medicine_prescribed)
VALUES
(1, 'High Blood Pressure', 'Amlodipine'),
(2, 'Skin Allergy', 'Cetirizine'),
(3, 'Fracture', 'Painkillers'),
(4, 'Migraine', 'Sumatriptan'),
(5, 'Fever and Cough', 'Paracetamol'),
(6, 'Ear Infection', 'Antibiotics'),
(7, 'Cold and Fatigue', 'Vitamin C'),
(8, 'Pregnancy Checkup', 'Folic Acid'),
(9, 'Toothache', 'Pain Relievers'),
(10, 'Cancer Checkup', 'Chemotherapy Plan');

INSERT INTO Billing (appointment_id, total_amount, payment_status)
VALUES
(1, 1500.00, 'Paid'),
(2, 900.00, 'Paid'),
(3, 0.00, 'Cancelled'),
(4, 1200.00, 'Pending'),
(5, 700.00, 'Paid'),
(6, 850.00, 'Pending'),
(7, 600.00, 'Paid'),
(8, 2500.00, 'Paid'),
(9, 1100.00, 'Pending'),
(10, 5000.00, 'Paid');

----------------------------------------------------------------------------
-- OPERATORS

-- 1. COMPARISON OPERATORS
-- Q1: Find all patients older than 40.
SELECT * FROM Patients
WHERE age > 40;

-- 2. List all doctors who have exactly 10 years of experience.
SELECT * FROM Doctors
WHERE years_of_experience = 10;

-- 2. LOGICAL OPERATOR:
-- Q1: Find female patients from Pune.
SELECT * FROM Patients
WHERE gender = 'Female' AND address = 'Pune';

-- Q4. Get patients from Mumbai or Delhi
SELECT * FROM Patients
WHERE address = 'Mumbai' OR address = 'Delhi';

-- 3. BETWEEN Operator
-- Q.Find patients whose age is between 30 and 40.
SELECT * FROM Patients
WHERE age BETWEEN 30 AND 40;

-- 4. IN Operator
-- Q. List all patients living in (Pune, Mumbai, Nagpur).
SELECT * FROM Patients
WHERE address IN ('Pune', 'Mumbai', 'Nagpur');

-- 5. NOT IN Operator
-- Q. Show doctors who are not dentists or cardiologists.
SELECT * FROM Doctors
WHERE specialization NOT IN ('Dentist', 'Cardiologist');

-- 6. LIKE Operator
-- Q. Find patients whose name starts with 'A'.
SELECT * FROM Patients
WHERE first_name LIKE 'A%';

-- Q. Find doctors whose specialization ends with 'gist'.
SELECT * FROM Doctors
WHERE specialization LIKE '%gist';

-- 7. IS NULL Operator
-- Q. Find appointments that do not have a status assigned.
SELECT * FROM Appointments
WHERE status IS NULL;

-- 8. DISTINCT Operator
-- Q. Show distinct specializations from Doctors table.
SELECT DISTINCT specialization
FROM Doctors;

-- 8. Aggregate Functions (SUM, AVG, MAX, MIN, COUNT)
-- Q. Find total revenue generated (sum of all bills).
SELECT SUM(total_amount) AS total_revenue
FROM Billing;

-- Q.Find average bill amount.
SELECT AVG(total_amount) AS avg_bill
FROM Billing;

-- 9. Arithmetic Operators (+, -, , /)
-- Q.Increase all pending bills by 10%.
SELECT bill_id, total_amount, total_amount * 1.10 AS updated_amount
FROM Billing
WHERE payment_status = 'Pending';

--------------------------------------------------------------------------------------
-- DDL statements

ALTER TABLE Patients
ADD COLUMN email VARCHAR(100);

ALTER TABLE Patients
MODIFY COLUMN contact_number VARCHAR(20);


-----------------------------------------------------------------------------------------
-- DML statements

SELECT * FROM Patients;

INSERT INTO Patients (first_name, last_name, gender, age, contact_number, address)
VALUES ('Ravi', 'Shinde', 'Male', 42, '9898989898', 'Sambhaji nagar');

-- DELETE FROM Appointments

UPDATE Billing
SET payment_status = 'Cancelled'
WHERE bill_id = 4;

-----------------------------------------------------------------------------------------
-- SELECT + (CLAUSES)

-- 1. SELECT FROM
SELECT first_name, last_name, age
FROM Patients;

-- 2. WHERE
-- Q. Find doctors name for cardiologist section?
SELECT doctor_name, specialization
FROM Doctors
WHERE specialization = 'Cardiologist';

-- 3. ORDER BY
-- Q. Show patients records from highest to lowest age
SELECT patient_id, first_name, age
FROM Patients
ORDER BY age DESC;

-- 4. GROUP BY
-- Q. Show total appointments divided by their status.
SELECT status, COUNT(appointment_id) AS total_appointments
FROM Appointments
GROUP BY status;

-- 5. HAVING
-- Q. Give doctor name having bill amount > 2000
SELECT 
    d.doctor_name,
    SUM(b.total_amount) AS total_earnings
FROM Billing b
LEFT JOIN Appointments a ON b.appointment_id = a.appointment_id
LEFT JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_name
HAVING SUM(b.total_amount) > 2000;

-- 6. DISTINCT
-- Q. Give distinct specialization of doctors
SELECT DISTINCT specialization
FROM Doctors;

-- 7. LIMIT
-- Q. Show top 3 billing records with highest amount first
SELECT * FROM Billing
ORDER BY total_amount DESC
LIMIT 3;

-- 8. OFFSET
-- Q. What was top 2 highest bill amount?
SELECT total_amount AS second_highest_payment FROM Billing
ORDER BY total_amount DESC
LIMIT 1 OFFSET 1;

----------------------------------------------------------------------------------
-- JOINS

-- 1. INNER JOIN
-- Q. Show patients first name and their doctors name 
SELECT p.first_name, d.doctor_name
FROM Patients p
INNER JOIN Doctors d ON p.patient_id = d.doctor_id;

-- 2. LEFT JOIN
-- Q. Write a query to show Appointments of patients whose status in completed?
SELECT p.first_name, p.last_name, a.appointment_date, a.status
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
WHERE status = 'Completed';

-- 3. RIGHT JOIN
-- Q. Show treatment given by doctors to their patients individually.
SELECT d.doctor_name, t.diagnosis
FROM Treatments t
RIGHT JOIN Appointments a ON t.appointment_id = a.appointment_id
RIGHT JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 4. CROSS JOIN
-- Bring up all possible combination of rows from Doctors and Patients table.
SELECT d.doctor_name, p.first_name, p.last_name
FROM Doctors d
CROSS JOIN Patients p;

--------------------------------------------------------------------------------------
-- SUBQUERY

-- 1. SINGLE ROW SUBQUERY:
-- Q. Show the patient who has maximum bill amount.
SELECT appointment_id, total_amount
FROM Billing
WHERE total_amount = (SELECT MAX(total_amount) FROM Billing);
SELECT MAX(total_amount) FROM Billing;

-- 2. MULTI ROW SUBQUERY:
-- Q. Show only those doctors who have at least one appointment.
SELECT doctor_id, doctor_name
FROM Doctors
WHERE doctor_id IN (SELECT DISTINCT doctor_id FROM Appointments);
SELECT DISTINCT doctor_id FROM Appointments;

---------------------------------------------------------------------------------------------------
-- WINDOWS FUNCTION

-- 1. ROW_NUMBER():
-- Q. Assign a serial number to each patient based on their appointment date.
SELECT patient_id, appointment_date,
ROW_NUMBER() OVER (ORDER BY appointment_date) AS serial_no
FROM Appointments;

-- 2. RANK():
-- Q. Rank doctors based on their years of experience. The same experienced Dr gets 1 rank skipped.
SELECT doctor_name, years_of_experience, 
RANK() OVER (ORDER BY years_of_experience DESC) AS experience_rank
FROM Doctors;

-- 3. DENSE_RANK():
-- Q. Rank all doctors based on their years of experience — the doctor with the most experience gets rank 1.
--    if two doctors have the same experience, they should get the same rank.
SELECT doctor_name, specialization, years_of_experience,
DENSE_RANK() OVER (ORDER BY years_of_experience DESC) AS experience_rank
FROM Doctors;

