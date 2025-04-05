CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50)
);


CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Reason VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Ultrasound_Results (
    ResultID INT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    Image VARCHAR(100),
    Report TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Machines (
    MachineID INT PRIMARY KEY,
    MachineName VARCHAR(50),
    DepartmentID INT,
    Status VARCHAR(20),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Technicians (
    TechnicianID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Medical_History (
    HistoryID INT PRIMARY KEY,
    PatientID INT,
    Condition VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    PatientID INT,
    Provider VARCHAR(50),
    PolicyNumber VARCHAR(50),
    CoverageAmount DECIMAL(10, 2),
    ExpiryDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    PatientID INT,
    MedicationName VARCHAR(50),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    PatientID INT,
    TreatmentName VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Referrals (
    ReferralID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ReferredTo VARCHAR(50),
    Reason VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Symptoms (
    SymptomID INT PRIMARY KEY,
    PatientID INT,
    SymptomDescription VARCHAR(100),
    OnsetDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Diagnosis (
    DiagnosisID INT PRIMARY KEY,
    PatientID INT,
    Condition VARCHAR(50),
    DiagnosisDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Follow_Up (
    FollowUpID INT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    FollowUpDate DATE,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    PatientID INT,
    AppointmentID INT,
    ReportText TEXT,
    ReportDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Radiologists (
    RadiologistID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Clinics (
    ClinicID INT PRIMARY KEY,
    ClinicName VARCHAR(50),
    Address VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Lab_Tests (
    LabTestID INT PRIMARY KEY,
    PatientID INT,
    TestName VARCHAR(50),
    TestDate DATE,
    Results TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, Address, ContactNumber, Email) VALUES
(1, 'John', 'Doe', '1980-05-15', 'Male', '123 Main St', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1992-07-20', 'Female', '456 Elm St', '987-654-3210', 'jane.smith@example.com'),
(3, 'Michael', 'Brown', '1985-03-10', 'Male', '789 Maple St', '555-555-5555', 'michael.brown@example.com'),
(4, 'Emily', 'Davis', '1990-04-25', 'Female', '321 Oak St', '444-555-6666', 'emily.davis@example.com'),
(5, 'Chris', 'Johnson', '1978-02-14', 'Male', '654 Pine St', '333-444-5555', 'chris.johnson@example.com'),
(6, 'Sarah', 'Wilson', '1987-12-30', 'Female', '987 Cedar St', '222-333-4444', 'sarah.wilson@example.com'),
(7, 'David', 'Martinez', '1982-09-05', 'Male', '543 Birch St', '111-222-3333', 'david.martinez@example.com'),
(8, 'Laura', 'Garcia', '1995-01-18', 'Female', '876 Spruce St', '000-111-2222', 'laura.garcia@example.com'),
(9, 'James', 'Rodriguez', '1984-06-22', 'Male', '234 Walnut St', '777-888-9999', 'james.rodriguez@example.com'),
(10, 'Lisa', 'Lopez', '1991-11-09', 'Female', '678 Poplar St', '666-777-8888', 'lisa.lopez@example.com'),
(11, 'Andrew', 'Scott', '1990-01-22', 'Male', '908 Oak St', '999-888-7777', 'andrew.scott@example.com'),
(12, 'Megan', 'Lee', '1985-03-30', 'Female', '112 Pine St', '888-777-6666', 'megan.lee@example.com'),
(13, 'Joshua', 'Moore', '1978-05-15', 'Male', '309 Maple St', '777-666-5555', 'joshua.moore@example.com'),
(14, 'Rachel', 'Harris', '1995-07-09', 'Female', '605 Elm St', '666-555-4444', 'rachel.harris@example.com'),
(15, 'Benjamin', 'Martinez', '1982-11-25', 'Male', '128 Birch St', '555-444-3333', 'benjamin.martinez@example.com'),
(16, 'Karen', 'Walker', '1991-12-17', 'Female', '226 Spruce St', '444-333-2222', 'karen.walker@example.com'),
(17, 'Nicholas', 'Hall', '1988-04-03', 'Male', '512 Walnut St', '333-222-1111', 'nicholas.hall@example.com'),
(18, 'Laura', 'Clark', '1983-08-19', 'Female', '708 Poplar St', '222-111-0000', 'laura.clark@example.com'),
(19, 'Edward', 'Lewis', '1979-06-13', 'Male', '905 Cedar St', '111-000-9999', 'edward.lewis@example.com'),
(20, 'Jessica', 'Lopez', '1994-10-08', 'Female', '103 Oak St', '000-999-8888', 'jessica.lopez@example.com');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialization, ContactNumber, Email, DepartmentID) VALUES
(1, 'Alice', 'Johnson', 'Radiology', '222-333-4444', 'alice.johnson@example.com', 1),
(2, 'Robert', 'Williams', 'Cardiology', '333-444-5555', 'robert.williams@example.com', 2),
(3, 'Mary', 'Jones', 'Neurology', '444-555-6666', 'mary.jones@example.com', 3),
(4, 'John', 'White', 'Orthopedics', '555-666-7777', 'john.white@example.com', 4),
(5, 'Emma', 'Harris', 'Dermatology', '666-777-8888', 'emma.harris@example.com', 5),
(6, 'Daniel', 'Clark', 'Pediatrics', '777-888-9999', 'daniel.clark@example.com', 6),
(7, 'Sophia', 'Lewis', 'Oncology', '888-999-0000', 'sophia.lewis@example.com', 7),
(8, 'James', 'Walker', 'Gynecology', '999-000-1111', 'james.walker@example.com', 8),
(9, 'Olivia', 'Hall', 'Gastroenterology', '000-111-2222', 'olivia.hall@example.com', 9),
(10, 'Liam', 'Young', 'Ophthalmology', '111-222-3333', 'liam.young@example.com', 10);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Radiology'),
(2, 'Cardiology'),
(3, 'Neurology'),
(4, 'Orthopedics'),
(5, 'Dermatology'),
(6, 'Pediatrics'),
(7, 'Oncology'),
(8, 'Gynecology'),
(9, 'Gastroenterology'),
(10, 'Ophthalmology');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Reason) VALUES
(1, 1, 1, '2025-02-20 09:00:00', 'Routine Check-Up'),
(2, 2, 2, '2025-02-21 10:30:00', 'Heart Consultation'),
(3, 3, 3, '2025-02-22 11:15:00', 'Neurological Examination'),
(4, 4, 4, '2025-02-23 12:00:00', 'Orthopedic Check-Up'),
(5, 5, 5, '2025-02-24 13:45:00', 'Dermatology Consultation'),
(6, 6, 6, '2025-02-25 14:30:00', 'Pediatric Check-Up'),
(7, 7, 7, '2025-02-26 15:15:00', 'Oncology Follow-Up'),
(8, 8, 8, '2025-02-27 16:00:00', 'Gynecological Examination'),
(9, 9, 9, '2025-02-28 16:45:00', 'Gastroenterology Consultation'),
(10, 10, 10, '2025-03-01 17:30:00', 'Ophthalmology Check-Up');

INSERT INTO Ultrasound_Results (ResultID, PatientID, AppointmentID, Image, Report) VALUES
(1, 1, 1, NULL, 'Normal results.'),
(2, 2, 2, NULL, 'No abnormalities detected.'),
(3, 3, 3, NULL, 'Further tests recommended.'),
(4, 4, 4, NULL, 'Fracture detected.'),
(5, 5, 5, NULL, 'Skin lesion observed.'),
(6, 6, 6, NULL, 'Normal growth observed.'),
(7, 7, 7, NULL, 'Tumor detected.'),
(8, 8, 8, NULL, 'Normal results.'),
(9, 9, 9, NULL, 'Inflammation detected.'),
(10, 10, 10, NULL, 'Normal vision.');

INSERT INTO Machines (MachineID, MachineName, DepartmentID, Status) VALUES
(1, 'Ultrasound Machine A', 1, 'Operational'),
(2, 'Ultrasound Machine B', 1, 'Under Maintenance'),
(3, 'CT Scanner', 2, 'Operational'),
(4, 'MRI Machine', 3, 'Operational'),
(5, 'X-Ray Machine', 4, 'Operational'),
(6, 'Dermatoscope', 5, 'Operational'),
(7, 'Pediatric Ultrasound', 6, 'Operational'),
(8, 'Radiation Therapy Machine', 7, 'Operational'),
(9, 'Gynecological Ultrasound', 8, 'Operational'),
(10, 'Endoscopy Machine', 9, 'Operational');

INSERT INTO Technicians (TechnicianID, FirstName, LastName, ContactNumber, Email, DepartmentID) VALUES
(1, 'Emma', 'Wilson', '666-777-8888', 'emma.wilson@example.com', 1),
(2, 'David', 'Taylor', '777-888-9999', 'david.taylor@example.com', 2),
(3, 'Linda', 'Anderson', '888-999-0000', 'linda.anderson@example.com', 3),
(4, 'Susan', 'Martin', '999-000-1111', 'susan.martin@example.com', 4),
(5, 'Steven', 'Lee', '000-111-2222', 'steven.lee@example.com', 5),
(6, 'Karen', 'Hernandez', '111-222-3333', 'karen.hernandez@example.com', 6),
(7, 'Kevin', 'King', '222-333-4444', 'kevin.king@example.com', 7),
(8, 'Barbara', 'Wright', '333-444-5555', 'barbara.wright@example.com', 8),
(9, 'Paul', 'Lopez', '444-555-6666', 'paul.lopez@example.com', 9),
(10, 'Jessica', 'Hill', '555-666-7777', 'jessica.hill@example.com', 10);

INSERT INTO Medical_History (HistoryID, PatientID, Condition, StartDate, EndDate) VALUES
(1, 1, 'Diabetes', '2010-01-01', '2025-01-01'),
(2, 2, 'Hypertension', '2015-05-05', NULL),
(3, 3, 'Asthma', '2020-09-09', NULL),
(4, 4, 'Fracture', '2015-06-01', '2016-01-01'),
(5, 5, 'Eczema', '2018-09-10', NULL),
(6, 6, 'Bronchitis', '2022-02-15', '2022-05-15'),
(7, 7, 'Cancer', '2019-03-05', '2023-01-05'),
(8, 8, 'Polycystic Ovarian Syndrome', '2017-11-20', NULL),
(9, 9, 'Gastritis', '2021-04-25', NULL),
(10, 10, 'Cataract', '2023-07-15', '2023-08-15'),
(11, 1, 'High Cholesterol', '2018-03-01', NULL),
(12, 2, 'Arthritis', '2017-07-15', NULL),
(13, 3, 'Migraine', '2019-05-10', NULL),
(14, 4, 'Osteoporosis', '2020-08-20', NULL),
(15, 5, 'Psoriasis', '2021-02-05', NULL),
(16, 6, 'Allergies', '2020-04-12', NULL),
(17, 7, 'Anemia', '2018-09-25', NULL),
(18, 8, 'Endometriosis', '2019-11-30', NULL),
(19, 9, 'GERD', '2022-01-15', NULL),
(20, 10, 'Glaucoma', '2021-06-10', NULL);

INSERT INTO Billing (BillingID, PatientID, AppointmentID, TotalAmount, PaymentStatus) VALUES
(1, 1, 1, 200.00, 'Paid'),
(2, 2, 2, 150.00, 'Pending'),
(3, 3, 3, 300.00, 'Paid'),
(4, 4, 4, 250.00, 'Pending'),
(5, 5, 5, 180.00, 'Paid'),
(6, 6, 6, 200.00, 'Pending'),
(7, 7, 7, 300.00, 'Paid'),
(8, 8, 8, 220.00, 'Pending'),
(9, 9, 9, 150.00, 'Paid'),
(10, 10, 10, 270.00, 'Pending');

INSERT INTO Insurance (InsuranceID, PatientID, Provider, PolicyNumber, CoverageAmount, ExpiryDate) VALUES
(1, 1, 'Health Insurance Co', 'HIC123456', 10000.00, '2026-01-01'),
(2, 2, 'Insurance Plus', 'IP654321', 5000.00, '2025-12-31'),
(3, 3, 'Secure Health', 'SH789123', 20000.00, '2027-06-30'),
(4, 4, 'Health Plus', 'HP987654', 15000.00, '2025-11-30'),
(5, 5, 'Secure Care', 'SC246810', 10000.00, '2026-03-15'),
(6, 6, 'MediSafe', 'MS135791', 8000.00, '2024-12-31'),
(7, 7, 'HealthNet', 'HN123987', 12000.00, '2025-07-01'),
(8, 8, 'CareFirst', 'CF456123', 6000.00, '2026-02-28'),
(9, 9, 'WellCare', 'WC789456', 5000.00, '2027-01-10'),
(10, 10, 'PrimeHealth', 'PH321654', 18000.00, '2024-11-25');

INSERT INTO Medications (MedicationID, PatientID, MedicationName, Dosage, StartDate, EndDate) VALUES
(1, 1, 'Metformin', '500mg', '2025-01-01', '2025-12-31'),
(2, 2, 'Lisinopril', '10mg', '2025-02-01', '2025-12-31'),
(3, 3, 'Ventolin', '2 puffs', '2025-03-01', '2025-12-31'),
(4, 4, 'Ibuprofen', '200mg', '2025-04-01', '2025-04-10'),
(5, 5, 'Hydrocortisone', '1%', '2025-05-05', '2025-06-05'),
(6, 6, 'Amoxicillin', '500mg', '2025-03-15', '2025-03-25'),
(7, 7, 'Cisplatin', '50mg', '2025-01-20', '2025-12-31'),
(8, 8, 'Metformin', '850mg', '2025-02-28', '2025-12-31'),
(9, 9, 'Omeprazole', '20mg', '2025-03-20', '2025-12-31'),
(10, 10, 'Prednisolone', '5mg', '2025-04-25', '2025-12-31');

INSERT INTO Treatments (TreatmentID, PatientID, TreatmentName, StartDate, EndDate) VALUES
(1, 1, 'Physical Therapy', '2025-01-15', '2025-06-15'),
(2, 2, 'Cardiac Rehabilitation', '2025-02-20', '2025-08-20'),
(3, 3, 'Pulmonary Rehabilitation', '2025-03-25', '2025-09-25'),
(4, 4, 'Surgery', '2025-03-10', '2025-03-20'),
(5, 5, 'Topical Therapy', '2025-04-15', '2025-05-15'),
(6, 6, 'Antibiotic Therapy', '2025-05-25', '2025-06-05'),
(7, 7, 'Chemotherapy', '2025-06-15', '2025-12-15'),
(8, 8, 'Hormone Therapy', '2025-07-20', '2025-12-20'),
(9, 9, 'Acid Suppression', '2025-08-30', '2025-12-30'),
(10, 10, 'Cataract Surgery', '2025-09-25', '2025-10-10');

INSERT INTO Referrals (ReferralID, PatientID, DoctorID, ReferredTo, Reason) VALUES
(1, 1, 1, 'Endocrinologist', 'Diabetes management'),
(2, 2, 2, 'Nephrologist', 'Kidney function assessment'),
(3, 3, 3, 'Pulmonologist', 'Asthma management'),
(4, 4, 4, 'Orthopedic Surgeon', 'Fracture management'),
(5, 5, 5, 'Dermatologist', 'Skin condition assessment'),
(6, 6, 6, 'Pulmonologist', 'Bronchitis treatment'),
(7, 7, 7, 'Oncologist', 'Cancer treatment plan'),
(8, 8, 8, 'Gynecologist', 'PCOS management'),
(9, 9, 9, 'Gastroenterologist', 'Gastritis treatment'),
(10, 10, 10, 'Ophthalmologist', 'Cataract surgery follow-up');

INSERT INTO Symptoms (SymptomID, PatientID, SymptomDescription, OnsetDate) VALUES
(1, 1, 'Fatigue', '2025-01-01'),
(2, 2, 'Chest Pain', '2025-02-15'),
(3, 3, 'Shortness of Breath', '2025-03-10'),
(4, 4, 'Bone Pain', '2025-02-15'),
(5, 5, 'Itching', '2025-03-05'),
(6, 6, 'Cough', '2025-03-25'),
(7, 7, 'Weight Loss', '2025-04-10'),
(8, 8, 'Irregular Periods', '2025-05-05'),
(9, 9, 'Stomach Pain', '2025-06-15'),
(10, 10, 'Blurry Vision', '2025-07-20');

INSERT INTO Diagnosis (DiagnosisID, PatientID, Condition, DiagnosisDate) VALUES
(1, 1, 'Type 2 Diabetes', '2025-01-05'),
(2, 2, 'Hypertension', '2025-02-20'),
(3, 3, 'Asthma', '2025-03-15'),
(4, 4, 'Bone Fracture', '2025-02-20'),
(5, 5, 'Eczema', '2025-03-10'),
(6, 6, 'Bronchitis', '2025-03-30'),
(7, 7, 'Cancer', '2025-04-15'),
(8, 8, 'PCOS', '2025-05-10'),
(9, 9, 'Gastritis', '2025-06-20'),
(10, 10, 'Cataract', '2025-07-25'),
(11, 1, 'High Cholesterol', '2018-03-05'),
(12, 2, 'Arthritis', '2017-07-20'),
(13, 3, 'Migraine', '2019-05-15'),
(14, 4, 'Osteoporosis', '2020-08-25'),
(15, 5, 'Psoriasis', '2021-02-10'),
(16, 6, 'Allergies', '2020-04-15'),
(17, 7, 'Anemia', '2018-09-30'),
(18, 8, 'Endometriosis', '2019-12-05'),
(19, 9, 'GERD', '2022-01-20'),
(20, 10, 'Glaucoma', '2021-06-15');

INSERT INTO Follow_Up (FollowUpID, PatientID, AppointmentID, FollowUpDate, Notes) VALUES
(1, 1, 1, '2025-02-15', 'Monitor blood sugar levels.'),
(2, 2, 2, '2025-03-20', 'Check blood pressure.'),
(3, 3, 3, '2025-04-15', 'Assess asthma symptoms.'),
(4, 4, 4, '2025-03-05', 'Check bone healing progress.'),
(5, 5, 5, '2025-04-20', 'Assess skin condition.'),
(6, 6, 6, '2025-05-10', 'Monitor cough improvement.'),
(7, 7, 7, '2025-06-05', 'Evaluate cancer treatment response.'),
(8, 8, 8, '2025-07-01', 'Assess hormone therapy results.'),
(9, 9, 9, '2025-08-05', 'Check stomach pain improvement.'),
(10, 10, 10, '2025-09-10', 'Monitor vision after surgery.'),
(11, 1, 1, '2025-03-15', 'Monitor cholesterol levels.'),
(12, 2, 2, '2025-04-20', 'Assess arthritis symptoms.'),
(13, 3, 3, '2025-05-25', 'Evaluate migraine frequency.'),
(14, 4, 4, '2025-06-30', 'Check bone density improvement.'),
(15, 5, 5, '2025-07-15', 'Assess psoriasis treatment response.'),
(16, 6, 6, '2025-08-20', 'Monitor allergy symptoms.'),
(17, 7, 7, '2025-09-25', 'Evaluate anemia treatment.'),
(18, 8, 8, '2025-10-30', 'Assess endometriosis symptoms.'),
(19, 9, 9, '2025-11-15', 'Check GERD improvement.'),
(20, 10, 10, '2025-12-20', 'Monitor glaucoma progression.');

INSERT INTO Reports (ReportID, PatientID, AppointmentID, ReportText, ReportDate) VALUES
(1, 1, 1, 'Patient is responding well to treatment.', '2025-02-20'),
(2, 2, 2, 'No significant changes noted.', '2025-03-21'),
(3, 3, 3, 'Further evaluation required.', '2025-04-22'),
(4, 4, 4, 'Bone healing as expected.', '2025-02-25'),
(5, 5, 5, 'Skin condition improving.', '2025-03-15'),
(6, 6, 6, 'Bronchitis symptoms reducing.', '2025-04-05'),
(7, 7, 7, 'Tumor size decreasing.', '2025-05-15'),
(8, 8, 8, 'Hormone therapy effective.', '2025-06-01'),
(9, 9, 9, 'Stomach pain reducing.', '2025-07-10'),
(10, 10, 10, 'Vision clarity restored.', '2025-08-15'),
(11, 1, 1, 'Cholesterol levels are stable.', '2025-03-20'),
(12, 2, 2, 'Arthritis symptoms are improving.', '2025-04-25'),
(13, 3, 3, 'Migraine frequency has reduced.', '2025-05-30'),
(14, 4, 4, 'Bone density is improving with treatment.', '2025-07-05'),
(15, 5, 5, 'Psoriasis is under control.', '2025-08-10'),
(16, 6, 6, 'Allergy symptoms are manageable.', '2025-09-15'),
(17, 7, 7, 'Anemia is improving with supplements.', '2025-10-20'),
(18, 8, 8, 'Endometriosis symptoms are stable.', '2025-11-25'),
(19, 9, 9, 'GERD symptoms are reducing.', '2025-12-30'),
(20, 10, 10, 'Glaucoma progression is slow.', '2026-01-05');

INSERT INTO Radiologists (RadiologistID, FirstName, LastName, ContactNumber, Email, DepartmentID) VALUES
(1, 'Daniel', 'Thomas', '555-666-7777', 'daniel.thomas@example.com', 1),
(2, 'Laura', 'Moore', '666-777-8888', 'laura.moore@example.com', 1),
(3, 'Peter', 'White', '777-888-9999', 'peter.white@example.com', 1),
(4, 'Patricia', 'Carter', '666-777-8888', 'patricia.carter@example.com', 1),
(5, 'Michael', 'Mitchell', '777-888-9999', 'michael.mitchell@example.com', 1),
(6, 'Barbara', 'Perez', '888-999-0000', 'barbara.perez@example.com', 1),
(7, 'William', 'Edwards', '999-000-1111', 'william.edwards@example.com', 1),
(8, 'Elizabeth', 'Collins', '000-111-2222', 'elizabeth.collins@example.com', 1),
(9, 'James', 'Stewart', '111-222-3333', 'james.stewart@example.com', 1),
(10, 'Margaret', 'Morris', '222-333-4444', 'margaret.morris@example.com', 1);

INSERT INTO Clinics (ClinicID, ClinicName, Address, ContactNumber, Email) VALUES
(1, 'Downtown Clinic', '101 First St', '111-222-3333', 'info@downtownclinic.com'),
(2, 'Uptown Clinic', '202 Second St', '222-333-4444', 'info@uptownclinic.com'),
(3, 'Suburban Clinic', '303 Third St', '333-444-5555', 'info@suburbanclinic.com'),
(4, 'Central Clinic', '404 Fourth St', '444-555-6666', 'info@centralclinic.com'),
(5, 'Midtown Clinic', '505 Fifth St', '555-666-7777', 'info@midtownclinic.com'),
(6, 'Eastside Clinic', '606 Sixth St', '666-777-8888', 'info@eastsideclinic.com'),
(7, 'Westside Clinic', '707 Seventh St', '777-888-9999', 'info@westsideclinic.com'),
(8, 'Lakeside Clinic', '808 Eighth St', '888-999-0000', 'info@lakesideclinic.com'),
(9, 'Riverside Clinic', '909 Ninth St', '999-000-1111', 'info@riversideclinic.com'),
(10, 'Highland Clinic', '1010 Tenth St', '000-111-2222', 'info@highlandclinic.com');


INSERT INTO Lab_Tests (LabTestID, PatientID, TestName, TestDate, Results) VALUES
(1, 1, 'Blood Glucose', '2025-02-10', 'Normal'),
(2, 2, 'Cholesterol', '2025-03-15', 'High'),
(3, 3, 'Pulmonary Function', '2025-04-20', 'Normal'),
(4, 4, 'Bone Density', '2025-05-25', 'Osteoporosis detected'),
(5, 5, 'Skin Biopsy', '2025-06-30', 'Eczema confirmed'),
(6, 6, 'Chest X-Ray', '2025-07-15', 'Bronchitis detected'),
(7, 7, 'CT Scan', '2025-08-20', 'Tumor detected'),
(8, 8, 'Hormone Levels', '2025-09-25', 'PCOS confirmed'),
(9, 9, 'Gastric Emptying Study', '2025-10-30', 'Delayed emptying detected'),
(10, 10, 'Eye Exam', '2025-11-15', 'Cataract confirmed');



