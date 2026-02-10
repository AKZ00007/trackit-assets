-- Asset Management System Database Dump
-- PostgreSQL

-- ========================
-- Departments Table
-- ========================
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Engineering'),
('Finance'),
('Operations');


-- ========================
-- Employees Table
-- ========================
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    employee_code VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    department_id INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (employee_code, full_name, email, department_id) VALUES
('EMP001', 'Rahul Sharma', 'rahul@company.com', 2),
('EMP002', 'Anita Verma', 'anita@company.com', 1),
('EMP003', 'Kunal Mehta', 'kunal@company.com', 3);


-- ========================
-- Users Table (HR / Admin)
-- ========================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO users (username, role, email) VALUES
('hr_admin', 'HR', 'hr@company.com'),
('it_admin', 'ADMIN', 'it@company.com');


-- ========================
-- Assets Table
-- ========================
CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    asset_tag VARCHAR(50) UNIQUE NOT NULL,
    asset_type VARCHAR(50),
    brand VARCHAR(50),
    condition VARCHAR(20),
    purchase_date DATE,
    status VARCHAR(20)
);

INSERT INTO assets (asset_tag, asset_type, brand, condition, purchase_date, status) VALUES
('ASSET001', 'Laptop', 'Dell', 'Good', '2023-01-15', 'Assigned'),
('ASSET002', 'Monitor', 'LG', 'Excellent', '2022-08-10', 'Available'),
('ASSET003', 'Phone', 'Samsung', 'Good', '2023-05-20', 'Assigned');


-- ========================
-- Asset Assignments Table
-- ========================
CREATE TABLE asset_assignments (
    id SERIAL PRIMARY KEY,
    asset_id INTEGER,
    employee_id INTEGER,
    assigned_date DATE,
    returned_date DATE,
    assigned_by_user_id INTEGER
);

INSERT INTO asset_assignments (asset_id, employee_id, assigned_date, assigned_by_user_id) VALUES
(1, 1, '2024-01-10', 1),
(3, 2, '2024-02-05', 2);
