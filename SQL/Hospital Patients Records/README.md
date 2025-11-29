# Hospital Management System (SQL Schema & Queries)

## Overview

This repository contains the SQL script for setting up and querying a foundational **Hospital Management System** database. The script (`hospital_management.sql`) is designed for educational or practice purposes, demonstrating key database design principles, table relationships, and advanced SQL query techniques.

## Project Goals

* **Schema Creation:** Provide a complete set of `CREATE TABLE` statements to quickly instantiate a relational database model.
* **Data Integrity:** Establish clear relationships and constraints using Primary Keys, Auto-Incrementing IDs, and Foreign Keys.
* **SQL Practice:** Offer various example queries covering common database operations for a healthcare context.

## Database Schema

The script creates the `hospital_management` database and includes the following tables:

* **`Patients`**: Stores patient demographic and contact information.
* **`Doctors`**: Stores doctor details, including specialization.
* **`Appointments`**: Manages scheduling, linking patients and doctors.
* **`Treatments`**: Records diagnoses and medicine prescribed per appointment.
* **`Billing`**: Handles financial transactions, including total amount and payment status.

## Key Features (SQL Examples)

The file includes examples of advanced SQL queries, ideal for learning or review:

* **`JOINS`**: Demonstrates inner, left, and right joins across the related tables.
* **`SUBQUERY`**: Includes both single-row (e.g., finding the patient with the maximum bill) and multi-row subqueries (e.g., finding doctors with appointments).
* **`WINDOWS FUNCTIONS`**: Illustrates the use of `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()` for complex ranking and numbering tasks.

## Usage

1.  **Select a Database Engine:** This script is written using standard SQL syntax, typically compatible with MySQL, PostgreSQL, or SQL Server.
2.  **Execute the Script:** Run the entire `hospital_management.sql` file in your preferred SQL client or command line tool.
3.  **Database Setup:** The script will automatically create the `hospital_management` database, all necessary tables, and populate them with sample data.
4.  **Practice:** Execute and modify the provided example queries to practice your SQL skills.

