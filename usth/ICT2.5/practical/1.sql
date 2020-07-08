CREATE DATABASE Company;
USE Company;

CREATE TABLE employee (
  fname char(255),
  minit char(255),
  lname char(255),
  ssn int(9) PRIMARY KEY,
  bdate date,
  address char(255),
  sex bigint(255),
  salary int(9),
  super_ssn int(9),
  dno int(9),
  FOREIGN KEY (super_ssn) REFERENCES employee(ssn));

CREATE TABLE department (
  dname char(255),
  dnumber int(9) PRIMARY KEY,
  mgr_ssn int(9),
  mgr_start_date date,
  FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn));

ALTER TABLE employee ADD FOREIGN KEY (dno) REFERENCES department(dnumber);

CREATE TABLE dept_locations (
  dnumber int(9),
  dlocation char(255),
  PRIMARY KEY (dnumber, dlocation),
  FOREIGN KEY (dnumber) REFERENCES department(dnumber));

CREATE TABLE project (
  pname char(255),
  pnumber int(9) PRIMARY KEY,
  plocation char(255),
  dnum int(9),
  FOREIGN KEY (dnum) REFERENCES department(dnumber));

CREATE TABLE works_on (
  essn int(9),
  pno int(9),
  hours int(9),
  PRIMARY KEY (essn, pno),
  FOREIGN KEY (essn) REFERENCES employee(ssn),
  FOREIGN KEY (pno) REFERENCES project(pnumber));

CREATE TABLE dependant (
  essn int(9),
  dependant_name char(255),
  sex bigint(255),
  bdate date,
  relationship char(255),
  PRIMARY KEY (essn, dependant_name),
  FOREIGN KEY (essn) REFERENCES employee(ssn));

ALTER TABLE employee ADD partner_ssn int(9);

DROP DATABASE Company;
