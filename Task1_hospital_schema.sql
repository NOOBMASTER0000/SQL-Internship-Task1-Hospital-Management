-- Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- Table 1: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Table 2: Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 3: Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DOB DATE,
    Address VARCHAR(200),
    Phone VARCHAR(15)
);

-- Table 4: Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Diagnosis VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table 5: Medications
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

-- Table 6: Bills
CREATE TABLE Bills (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    BillDate DATE,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

SHOW TABLES;
