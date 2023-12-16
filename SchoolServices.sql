USE master;
GO
IF DB_ID(N'SchoolServices')IS NOT NULL
DROP DATABASE SchoolServices;
GO
CREATE DATABASE SchoolServices
ON
(NAME = SchoolServices_dat,
FILENAME= 'C:\BaseDatos\SchoolServices.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =SchoolServices_log,
FILENAME = 'C:\BaseDatos\SchoolServices.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SchoolServices;
GO
--User
CREATE TABLE [User] (
    idUser INT PRIMARY KEY IDENTITY(1,1),
    userName VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT,
    creationDate DATE,
    idUserModify INT,
    modifiedDate DATE
);

-- Student
CREATE TABLE Student (
    idStudent INT PRIMARY KEY IDENTITY(1,1),
    idStudyPlan INT NOT NULL,
    registrationNumber VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    curp VARCHAR(18) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    nss VARCHAR(15) NOT NULL,
    idLifeInsurance INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Employee
CREATE TABLE Employee (
    idEmployee INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dateOfBirth DATE NOT NULL,
    address VARCHAR(100) NOT NULL,
    zipCode VARCHAR(10) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    socialSecurity VARCHAR(15) NOT NULL,
    idEmployeeType INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- EmployeeType
CREATE TABLE EmployeeType (
    idEmployeeType INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    position VARCHAR(50) NOT NULL,
    baseSalary DECIMAL(10, 2) NOT NULL,
    hours INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Career
CREATE TABLE Career (
    idCareer INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- StudyPlan
CREATE TABLE StudyPlan (
    idStudyPlan INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    code VARCHAR(10) NOT NULL,
    duration INT NOT NULL,
    credits INT NOT NULL,
    idCareer INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Course
CREATE TABLE Course (
    idCourse INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    code VARCHAR(20) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Class
CREATE TABLE Class (
    idClass INT PRIMARY KEY IDENTITY(1,1),
    idEmployee INT NOT NULL,
    idCourse INT NOT NULL,
    idPeriod INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Kardex
CREATE TABLE Kardex (
    idKardex INT PRIMARY KEY IDENTITY(1,1),
    idClass INT NOT NULL,
    idOpportunity INT NOT NULL,
    idStudent INT NOT NULL,
    unity VARCHAR(50) NOT NULL,
    note DECIMAL(5, 2) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- CareerService
CREATE TABLE CareerService (
    idCareerService INT PRIMARY KEY IDENTITY(1,1),
    idCareer INT NOT NULL,
    idEmployee INT NOT NULL,
    serviceDate DATE NOT NULL,
    description VARCHAR(100) NOT NULL,
    state VARCHAR(20) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Opportunity
CREATE TABLE Opportunity (
    idOpportunity INT PRIMARY KEY IDENTITY(1,1),
    description VARCHAR(50) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- DocumentRequest
CREATE TABLE DocumentRequest (
    idDocumentRequest INT PRIMARY KEY IDENTITY(1,1),
    idStudent INT NOT NULL,
    idDocumentType INT NOT NULL,
    idEmployee INT NOT NULL,
    RequestDate DATE NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- DocumentType
CREATE TABLE DocumentType (
    idDocumentType INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- InstitutionalScholarship
CREATE TABLE InstitutionalScholarship (
    idInstitutionalScholarship INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL,
    requirements VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- InternalScholarshipDetails
CREATE TABLE InternalScholarshipDetails (
    idInternalScholarshipDetails INT PRIMARY KEY IDENTITY(1,1),
    idInstitutionalScholarship INT NOT NULL,
    idStudent INT NOT NULL,
    semester INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- ExternalScholarshipDetails
CREATE TABLE ExternalScholarshipDetails (
    idExternalScholarshipDetails INT PRIMARY KEY IDENTITY(1,1),
    idStudent INT NOT NULL,
    idExternalScholarship INT NOT NULL,
    institution VARCHAR(50) NOT NULL,
    campus VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    semester INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- ExternalScholarship
CREATE TABLE ExternalScholarship (
    idExternalScholarship INT PRIMARY KEY IDENTITY(1,1),
    scholarshipName VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate DATE NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- FamilyData
CREATE TABLE FamilyData (
    idFamilyData INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    relationship VARCHAR(10) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    idStudent INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Enrollment
CREATE TABLE Enrollment (
    idEnrollment INT PRIMARY KEY IDENTITY(1,1),
    idStudent INT NOT NULL,
    idPeriod INT NOT NULL,
    numericalReference INT NOT NULL,
    totalPayment DECIMAL(10, 2) NOT NULL,
    matriculation VARCHAR(50) NOT NULL,
    dueDate DATE NOT NULL,
    semester INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- LifeInsurance
CREATE TABLE LifeInsurance (
    idLifeInsurance INT PRIMARY KEY IDENTITY(1,1),
    policyNumber VARCHAR(20) NOT NULL,
    insuranceCompany VARCHAR(50) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    beneficiary VARCHAR(50) NOT NULL,
    deathCoverage DECIMAL(10, 2) NOT NULL,
    disabilityCoverage DECIMAL(10, 2) NOT NULL,
    insurancePayment DECIMAL(10, 2) NOT NULL,
    paymentPeriod INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Period
CREATE TABLE Period (
    idPeriod INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    duration INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Education
CREATE TABLE Education (
    idEducation INT PRIMARY KEY IDENTITY(1,1),
    educationLevel VARCHAR(50) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    idStudent INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- StudyCertificate
CREATE TABLE StudyCertificate (
    idStudyCertificate INT PRIMARY KEY IDENTITY(1,1),
    issuanceDate DATE NOT NULL,
    registrationDate DATE NOT NULL,
    information VARCHAR(100) NOT NULL,
    idStudent INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Degree
CREATE TABLE Degree (
    idDegree INT PRIMARY KEY IDENTITY(1,1),
    graduationDate DATE NOT NULL,
    ofbtainedDegree VARCHAR(50) NOT NULL,
    registrationNumber VARCHAR(20) NOT NULL,
	idStudent INT,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Reticule
CREATE TABLE Reticule (
    idReticule INT PRIMARY KEY IDENTITY(1,1),
    description VARCHAR(100) NOT NULL,
    idCourse INT NOT NULL,
    idStudyPlan INT NOT NULL,
    contactInformation VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- GraduateInformation
CREATE TABLE GraduateInformation (
    idGraduateInformation INT PRIMARY KEY IDENTITY(1,1),
    graduationDate DATE NOT NULL,
    currentJob VARCHAR(50) NOT NULL,
    currentPosition VARCHAR(50) NOT NULL,
	idStudent INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- Foreign Keys
--User
ALTER TABLE [User]
ADD CONSTRAINT FK_UserUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE [USER]
ADD CONSTRAINT FK_UserUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeEmployeeType FOREIGN KEY (idEmployeeType) REFERENCES EmployeeType (idEmployeeType);

ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- EmployeeType
ALTER TABLE EmployeeType
ADD CONSTRAINT FK_EmployeeTypeUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE EmployeeType
ADD CONSTRAINT FK_EmployeeTypeUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- StudyPlan
ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (idCareer) REFERENCES Career (idCareer);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Course
ALTER TABLE Course
ADD CONSTRAINT FK_CourseUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Course
ADD CONSTRAINT FK_CourseUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassEmployee FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (idCourse) REFERENCES Course (idCourse);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassPeriod FOREIGN KEY (idPeriod) REFERENCES Period (idPeriod);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (idClass) REFERENCES Class (idClass);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (idOpportunity) REFERENCES Opportunity (idOpportunity);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Opportunity
ALTER TABLE Opportunity
ADD CONSTRAINT FK_OpportunityUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Opportunity
ADD CONSTRAINT FK_OpportunityUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Career
ALTER TABLE Career
ADD CONSTRAINT FK_CareerUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Career
ADD CONSTRAINT FK_CareerUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (idCareer) REFERENCES Career (idCareer);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- DocumentRequest
ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestDocumentType FOREIGN KEY (idDocumentType) REFERENCES DocumentType (idDocumentType);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestEmployee FOREIGN KEY (idEmployee) REFERENCES Employee (idEmployee);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

--DocumentType
ALTER TABLE DocumentType
ADD CONSTRAINT FK_DocumentTypeUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE DocumentType
ADD CONSTRAINT FK_DocumentTypeUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- InstitutionalScholarship
ALTER TABLE InstitutionalScholarship
ADD CONSTRAINT FK_InstitutionalScholarshipUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE InstitutionalScholarship
ADD CONSTRAINT FK_InstitutionalScholarshipUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- InternalScholarshipDetails
ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsInstitutionalScholarship FOREIGN KEY (idInstitutionalScholarship) REFERENCES InstitutionalScholarship (idInstitutionalScholarship);

ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- ExternalScholarshipDetails
ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsExternalScholarship FOREIGN KEY (idExternalScholarship) REFERENCES ExternalScholarship (idExternalScholarship);

ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- ExternalScholarship
ALTER TABLE ExternalScholarship
ADD CONSTRAINT FK_ExternalScholarshipUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE ExternalScholarship
ADD CONSTRAINT FK_ExternalScholarshipUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- FamilyData
ALTER TABLE FamilyData
ADD CONSTRAINT FK_FamilyDataStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE FamilyData
ADD CONSTRAINT FK_FamilyDataUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE FamilyData
ADD CONSTRAINT FK_FamilyDataUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Enrollment
ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentPeriod FOREIGN KEY (idPeriod) REFERENCES Period (idPeriod);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- LifeInsurance
ALTER TABLE LifeInsurance
ADD CONSTRAINT FK_LifeInsuranceUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE LifeInsurance
ADD CONSTRAINT FK_LifeInsuranceUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Period
ALTER TABLE Period
ADD CONSTRAINT FK_PeriodUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Period
ADD CONSTRAINT FK_PeriodUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Education
ALTER TABLE Education
ADD CONSTRAINT FK_EducationStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE Education
ADD CONSTRAINT FK_EducationUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Education
ADD CONSTRAINT FK_EducationUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- StudyCertificate
ALTER TABLE StudyCertificate
ADD CONSTRAINT FK_StudyCertificateStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE StudyCertificate
ADD CONSTRAINT FK_StudyCertificateUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE StudyCertificate
ADD CONSTRAINT FK_StudyCertificateUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Degree
ALTER TABLE Degree
ADD CONSTRAINT FK_DegreeStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE Degree
ADD CONSTRAINT FK_DegreeUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Degree
ADD CONSTRAINT FK_DegreeUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Reticule
ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleStudyPlan FOREIGN KEY (idStudyPlan) REFERENCES StudyPlan (idStudyPlan);

ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleCourse FOREIGN KEY (idCourse) REFERENCES Course (idCourse);

ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- Student
ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyPlan FOREIGN KEY (idStudyPlan) REFERENCES StudyPlan (idStudyPlan);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentLifeInsurance FOREIGN KEY (idLifeInsurance) REFERENCES LifeInsurance (idLifeInsurance);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

-- GraduateInformation
ALTER TABLE GraduateInformation
ADD CONSTRAINT FK_GraduateInformationStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);

ALTER TABLE GraduateInformation
ADD CONSTRAINT FK_GraduateInformationUserCreate FOREIGN KEY (idUserCreate) REFERENCES [User] (idUser);

ALTER TABLE GraduateInformation
ADD CONSTRAINT FK_GraduateInformationUserModify FOREIGN KEY (idUserModify) REFERENCES [User] (idUser);

CREATE INDEX IX_User ON [User] (idUser);
CREATE INDEX IX_Student ON Student (idStudent);
CREATE INDEX IX_Employee ON Employee (idEmployee);
CREATE INDEX IX_EmployeeType ON EmployeeType (idEmployeeType);
CREATE INDEX IX_Career ON Career (idCareer);
CREATE INDEX IX_StudyPlan ON StudyPlan (idStudyPlan);
CREATE INDEX IX_Course ON Course (idCourse);
CREATE INDEX IX_Class ON Class (idClass);
CREATE INDEX IX_Kardex ON Kardex (idKardex);
CREATE INDEX IX_CareerService ON CareerService (idCareerService);
CREATE INDEX IX_Opportunity ON Opportunity (idOpportunity);
CREATE INDEX IX_DocumentRequest ON DocumentRequest (idDocumentRequest);
CREATE INDEX IX_DocumentType ON DocumentType (idDocumentType);
CREATE INDEX IX_InstitutionalScholarship ON InstitutionalScholarship (idInstitutionalScholarship);
CREATE INDEX IX_InternalScholarshipDetails ON InternalScholarshipDetails (idInternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarshipDetails ON ExternalScholarshipDetails (idExternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarship ON ExternalScholarship (idExternalScholarship);
CREATE INDEX IX_FamilyData ON FamilyData (idFamilyData);
CREATE INDEX IX_Enrollment ON Enrollment (idEnrollment);
CREATE INDEX IX_LifeInsurance ON LifeInsurance (idLifeInsurance);
CREATE INDEX IX_Period ON Period (idPeriod);
CREATE INDEX IX_Education ON Education (idEducation);
CREATE INDEX IX_StudyCertificate ON StudyCertificate (idStudyCertificate);
CREATE INDEX IX_Degree ON Degree (idDegree);
CREATE INDEX IX_Reticule ON Reticule (idReticule);
CREATE INDEX IX_GraduateInformation ON GraduateInformation (idGraduateInformation);

INSERT INTO [User] (UserName, name, password, email, idUserCreate, creationDate)
VALUES ('sa', 'Super Admin', 'AdM1nPaSsW', 'superadmin@example.com', null, null);
       
INSERT INTO [User] (UserName, name, password, email, idUserCreate, creationDate)
VALUES ('Yael', 'Yael Reyes', 'Us3rPwd!23', 'yael_r3y@example.com', 1, '2023-12-08');

INSERT INTO EmployeeType (position, baseSalary, hours, idUserCreate, creationDate)
VALUES ('Full-Time', 50000.00, 40, 1, '2023-12-08');

INSERT INTO EmployeeType (position, baseSalary, hours, idUserCreate, creationDate)
VALUES ('Part-Time', 25000.00, 20, 1, '2023-12-08');

INSERT INTO EmployeeType (position, baseSalary, hours, idUserCreate, creationDate)
VALUES ('Contract', 35000.00, 30, 1, '2023-12-08');

INSERT INTO Employee (name, lastName, phoneNumber, email, gender, salary, dateOfBirth, address, zipCode, rfc, socialSecurity, idEmployeeType, idUserCreate, creationDate)
VALUES ('John', 'Doe A', '123-456-7890', 'john.doe@email.com', 'M', 60000.00, '1990-05-15', '123 Main St', '12345', 'ABC123456DEF', '123-45-6789', 1, 1, '2023-12-08');

INSERT INTO Employee (name, lastName, phoneNumber, email, gender, salary, dateOfBirth, address, zipCode, rfc, socialSecurity, idEmployeeType, idUserCreate, creationDate)
VALUES ('Jane', 'Smith B', '987-654-3210', 'jane.smith@email.com', 'F', 40000.00, '1995-09-20', '456 Elm St', '54321', 'XYZ987654ABC', '987-65-4321', 2, 1, '2023-12-08');

INSERT INTO Employee (name, lastName, phoneNumber, email, gender, salary, dateOfBirth, address, zipCode, rfc, socialSecurity, idEmployeeType, idUserCreate, creationDate)
VALUES ('David', 'Williams C', '555-123-9876', 'david.williams@email.com', 'M', 55000.00, '1988-03-10', '789 Oak St', '67890', 'PQR555123XYZ', '555-12-3987', 1, 1, '2023-12-08');

INSERT INTO LifeInsurance (policyNumber, insuranceCompany, startDate, endDate, beneficiary, deathCoverage, disabilityCoverage, insurancePayment, paymentPeriod, idUserCreate, creationDate)
VALUES ('LI-001', 'XYZ Insurance', '2023-01-15', '2028-01-14', 'John Doe', 500000.00, 250000.00, 150.00, 12, 1, '2023-12-08');

INSERT INTO LifeInsurance (policyNumber, insuranceCompany, startDate, endDate, beneficiary, deathCoverage, disabilityCoverage, insurancePayment, paymentPeriod, idUserCreate, creationDate)
VALUES ('LI-002', 'ABC Insurance', '2023-02-20', '2027-02-19', 'Jane Smith', 300000.00, 150000.00, 100.00, 6, 1, '2023-12-08');

INSERT INTO LifeInsurance (policyNumber, insuranceCompany, startDate, endDate, beneficiary, deathCoverage, disabilityCoverage, insurancePayment, paymentPeriod, idUserCreate, creationDate)
VALUES ('LI-003', '123 Insure', '2023-03-10', '2028-03-09', 'David Johnson', 750000.00, 300000.00, 200.00, 12, 1, '2023-12-08');

INSERT INTO Career (name, description, idUserCreate, creationDate)
VALUES ('Computer Science', 'Programs for the computer science field.', 1, '2023-12-08');

INSERT INTO Career (name, description, idUserCreate, creationDate)
VALUES ('Business Administration', 'Programs for business management.', 1, '2023-12-08');

INSERT INTO Career (name, description, idUserCreate, creationDate)
VALUES ('Mechanical Engineering', 'Programs for mechanical engineering.', 1, '2023-12-08');


INSERT INTO StudyPlan (name, code, duration, credits, idCareer, idUserCreate, creationDate)
VALUES ('Computer Science - Bachelor', 'CS-B', 4, 120, 1, 1, '2023-12-08');

INSERT INTO StudyPlan (name, code, duration, credits, idCareer, idUserCreate, creationDate)
VALUES ('Business Administration - Bachelor', 'BA-B', 4, 130, 2, 1, '2023-12-08');

INSERT INTO StudyPlan (name, code, duration, credits, idCareer, idUserCreate, creationDate)
VALUES ('Mechanical Engineering - Bachelor', 'ME-B', 5, 150, 3, 1, '2023-12-08');

INSERT INTO Student (idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate, creationDate)
VALUES (1, 'ST12345', 'John', 'Doe M.', '555-123-4567', 'john.doe@example.com', '123 Main St, City', 'RAOP03', 'rfc12345', 'nss12345', 1, 1, '2023-12-08');

INSERT INTO Student (idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate, creationDate)
VALUES (2, 'ST67890', 'Alice', 'Smith L.', '555-987-6543', 'alice.smith@example.com', '456 Elm St, Town', 'curp', 'rfc67890', 'nss67890', 2, 1, '2023-12-08');

INSERT INTO Student (idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate, creationDate)
VALUES (3, 'ST13579', 'Ella', 'Johnson K.', '555-234-5678', 'ella.johnson@example.com', '789 Oak St, Village', 'curp1F', 'rfc13579', 'nss13579', 3, 1, '2023-12-08');

INSERT INTO Course (name, credits, code, idUserCreate, creationDate)
VALUES ('Introduction to Programming', 3, 'PROG101', 1, '2023-12-08');

INSERT INTO Course (name, credits, code, idUserCreate, creationDate)
VALUES ('Business Ethics', 2, 'ETHICS201', 1, '2023-12-08');

INSERT INTO Course (name, credits, code, idUserCreate, creationDate)
VALUES ('Advanced Calculus', 4, 'MATH301', 1, '2023-12-08');

INSERT INTO CareerService (idCareer, idEmployee, serviceDate, description, state, idUserCreate, creationDate)
VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active', 1, '2023-12-08');

INSERT INTO CareerService (idCareer, idEmployee, serviceDate, description, state, idUserCreate, creationDate)
VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active', 1, '2023-12-08');

INSERT INTO CareerService (idCareer, idEmployee, serviceDate, description, state, idUserCreate, creationDate)
VALUES (3, 3, '2023-06-10', 'Resume review', 'Active', 1, '2023-12-08');

INSERT INTO Opportunity (description, idUserCreate, creationDate)
VALUES ('Internship Opportunity at Company A', 1, '2023-12-08');

INSERT INTO Opportunity (description, idUserCreate, creationDate)
VALUES ('Scholarship Opportunity for STEM Students', 1, '2023-12-08');

INSERT INTO Opportunity (description, idUserCreate, creationDate)
VALUES ('Job Fair - Spring 2023', 1, '2023-12-08');

INSERT INTO DocumentType (name, description, idUserCreate, creationDate)
VALUES ('Transcript', 'Academic transcript document.', 1, '2023-12-08');

INSERT INTO DocumentType (name, description, idUserCreate, creationDate)
VALUES ('Diploma', 'Certificate of completion.', 1, '2023-12-08');

INSERT INTO DocumentType (name, description, idUserCreate, creationDate)
VALUES ('Recommendation Letter', 'Letter of recommendation.', 1, '2023-12-08');

INSERT INTO InstitutionalScholarship (name, percentage, requirements, idUserCreate, creationDate)
VALUES ('Merit Scholarship', 25.00, 'Minimum GPA of 3.5 and active student.', 1, '2023-12-08');

INSERT INTO InstitutionalScholarship (name, percentage, requirements, idUserCreate, creationDate)
VALUES ('Financial Aid Scholarship', 50.00, 'Demonstrated financial need and enrollment in eligible programs.', 1, '2023-12-08');

INSERT INTO InstitutionalScholarship (name, percentage, requirements, idUserCreate, creationDate)
VALUES ('Leadership Scholarship', 20.00, 'Active involvement in extracurricular activities and leadership roles.', 1, '2023-12-08');

INSERT INTO ExternalScholarship (scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES ('Federal Scholarship Program', 1500.00, '2023-04-01', 1, '2023-12-08');

INSERT INTO ExternalScholarship (scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES ('National Student Support Program', 1000.00, '2023-04-15', 1, '2023-12-08');

INSERT INTO ExternalScholarship (scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES ('Educational Excellence Scholarship', 2000.00, '2023-05-01', 1, '2023-12-08');

INSERT INTO FamilyData (name, lastName, relationship, phoneNumber, email, address, idStudent, idUserCreate, creationDate)
VALUES ('John', 'Doe', 'Father', '123-456-7890', 'john@example.com', '123 Main St', 1, 1, '2023-12-08');

INSERT INTO FamilyData (name, lastName, relationship, phoneNumber, email, address, idStudent, idUserCreate, creationDate)
VALUES ('Jane', 'Smith', 'Mother', '987-654-3210', 'jane@example.com', '456 Elm St', 3, 1, '2023-12-08');

INSERT INTO FamilyData (name, lastName, relationship, phoneNumber, email, address, idStudent, idUserCreate, creationDate)
VALUES ('David', 'Doe', 'Brother', '555-123-4567', 'david@example.com', '789 Oak St', 2, 1, '2023-12-08');

INSERT INTO Period (name, startDate, endDate, duration, idUserCreate, creationDate)
VALUES ('Fall 2023', '2023-09-01', '2023-12-15', 106, 1, '2023-12-08');

INSERT INTO Period (name, startDate, endDate, duration, idUserCreate, creationDate)
VALUES ('Spring 2024', '2024-01-15', '2024-05-30', 137, 1, '2023-12-08');

INSERT INTO Period (name, startDate, endDate, duration, idUserCreate, creationDate)
VALUES ('Summer 2024', '2024-06-15', '2024-08-31', 78, 1, '2023-12-08');


INSERT INTO Education (educationLevel, startDate, endDate, idStudent, idUserCreate, creationDate)
VALUES ('High School', '2018-09-01', '2021-06-30', 3, 1, '2023-12-08');

INSERT INTO Education (educationLevel, startDate, endDate, idStudent, idUserCreate, creationDate)
VALUES ('Bachelor Degree', '2021-09-01', '2025-06-30', 1, 1, '2023-12-08');

INSERT INTO Education (educationLevel, startDate, endDate, idStudent, idUserCreate, creationDate)
VALUES ('Masters Degree', '2025-09-01', '2027-06-30', 2, 1, '2023-12-08');

INSERT INTO StudyCertificate (issuanceDate, registrationDate, information, idStudent, idUserCreate, creationDate)
VALUES ('2022-06-15', '2022-06-16', 'Bachelor of Science in Computer Science', 2, 1, '2023-12-08');

INSERT INTO StudyCertificate (issuanceDate, registrationDate, information, idStudent, idUserCreate, creationDate)
VALUES ('2021-05-20', '2021-05-21', 'Master of Business Administration', 3, 1, '2023-12-08');

INSERT INTO StudyCertificate (issuanceDate, registrationDate, information, idStudent, idUserCreate, creationDate)
VALUES ('2019-12-10', '2019-12-11', 'High School Diploma', 1, 1, '2023-12-08');

INSERT INTO Degree (graduationDate, ofbtainedDegree, registrationNumber, idUserCreate, creationDate)
VALUES ('2023-06-30', 'Bachelor of Arts', 'T12345', 1, '2023-12-08');

INSERT INTO Degree (graduationDate, ofbtainedDegree, registrationNumber, idUserCreate, creationDate)
VALUES ('2022-12-15', 'Master of Science', 'M67890', 1, '2023-12-08');

INSERT INTO Degree (graduationDate, ofbtainedDegree, registrationNumber, idUserCreate, creationDate)
VALUES ('2021-05-25', 'Doctor of Philosophy', 'D54321', 1, '2023-12-08');

INSERT INTO Reticule (description, idCourse, contactInformation, idStudyPlan, idUserCreate, creationDate)
VALUES ('Computer Science Reticule', 2, 'Contact: professor@example.com', 1, 1, '2023-12-08');

INSERT INTO Reticule (description, idCourse, contactInformation, idStudyPlan, idUserCreate, creationDate)
VALUES ('Business Administration Reticule', 3, 'Contact: business-dept@example.com', 2, 1, '2023-12-08');

INSERT INTO Reticule (description, idCourse, contactInformation, idStudyPlan, idUserCreate, creationDate)
VALUES ('Physics Reticule', 1, 'Contact: physics-dept@example.com', 3, 1, '2023-12-08');

INSERT INTO GraduateInformation (graduationDate, currentJob, currentPosition, idStudent, idUserCreate, creationDate)
VALUES ('2022-06-15', 'Software Engineer', 'Senior Developer', 1, 1, '2023-12-08');

INSERT INTO GraduateInformation (graduationDate, currentJob, currentPosition, idStudent, idUserCreate, creationDate)
VALUES ('2021-05-20', 'Marketing Manager', 'Digital Marketing Specialist', 2, 1, '2023-12-08');

INSERT INTO GraduateInformation (graduationDate, currentJob, currentPosition, idStudent, idUserCreate, creationDate)
VALUES ('2019-12-10', 'Data Analyst', 'Business Intelligence Analyst', 3, 1, '2023-12-08');

INSERT INTO Class (idEmployee, idCourse, idPeriod, idUserCreate, creationDate)
VALUES (1, 1, 1, 1, '2023-12-08');

INSERT INTO Class (idEmployee, idCourse, idPeriod, idUserCreate, creationDate)
VALUES (2, 2, 2, 1, '2023-12-08');

INSERT INTO Class (idEmployee, idCourse, idPeriod, idUserCreate, creationDate)
VALUES (3, 3, 3, 1, '2023-12-08');

INSERT INTO Kardex (idClass, idOpportunity, idStudent, unity, note, idUserCreate, creationDate)
VALUES (1, 1, 1, 1, 95.5, 1, '2023-12-08');

INSERT INTO Kardex (idClass, idOpportunity, idStudent, unity, note, idUserCreate, creationDate)
VALUES (2, 2, 2, 2, 88.0, 1, '2023-12-08');

INSERT INTO Kardex (idClass, idOpportunity, idStudent, unity, note, idUserCreate, creationDate)
VALUES (3, 3, 3, 1, 76.5, 1, '2023-12-08');

INSERT INTO DocumentRequest (idStudent, idDocumentType, idEmployee, RequestDate, idUserCreate, creationDate)
VALUES (1, 1, 1, '2023-10-15', 1, '2023-12-08');

INSERT INTO DocumentRequest (idStudent, idDocumentType, idEmployee, RequestDate, idUserCreate, creationDate)
VALUES (2, 2, 2, '2023-10-16', 1, '2023-12-08');

INSERT INTO DocumentRequest (idStudent, idDocumentType, idEmployee, RequestDate, idUserCreate, creationDate)
VALUES (3, 3, 3, '2023-10-17', 1, '2023-12-08');

INSERT INTO InternalScholarshipDetails (idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (1, 1, 1, 1, '2023-12-08');

INSERT INTO InternalScholarshipDetails (idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (2, 2, 2, 1, '2023-12-08');

INSERT INTO InternalScholarshipDetails (idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (3, 3, 3, 1, '2023-12-08');

INSERT INTO ExternalScholarshipDetails (idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (1, 1, 'ABC University', 'Main campus', 'Computer Science', 1, 1, '2023-12-08');

INSERT INTO ExternalScholarshipDetails (idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (2, 2, 'XYZ College', 'Downtown campus', 'Engineering', 2, 1, '2023-12-08');

INSERT INTO ExternalScholarshipDetails (idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (3, 3, '123 Institute', 'West campus', 'Business Administration', 3, 1, '2023-12-08');

INSERT INTO Enrollment (idStudent, idPeriod, numericalReference, totalPayment, matriculation, dueDate, semester, idUserCreate, creationDate)
VALUES (1, 1, 20231001, 1500.00, 'MAT20231001', '2023-09-15', 1, 1, '2023-12-08');

INSERT INTO Enrollment (idStudent, idPeriod, numericalReference, totalPayment, matriculation, dueDate, semester, idUserCreate, creationDate)
VALUES (2, 1, 20231002, 1600.00, 'MAT20231002', '2023-09-15', 1, 1, '2023-12-08');

INSERT INTO Enrollment (idStudent, idPeriod, numericalReference, totalPayment, matriculation, dueDate, semester, idUserCreate, creationDate)
VALUES (3, 2, 20231003, 1550.00, 'MAT20231003', '2023-09-15', 1, 1, '2023-12-08');
