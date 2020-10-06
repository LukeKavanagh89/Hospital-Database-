DROP DATABASE IF EXISTS Hospital;

CREATE DATABASE Hospital;

USE Hospital;

CREATE TABLE sister (
  sister_id integer not null,
  sister_fname varchar(120)not null,
  sister_lname varchar(120)not null,
  PRIMARY KEY (sister_id),
  KEY (sister_fname, sister_lname)
);

CREATE TABLE ward (
  ward_id integer not null,
  ward_name varchar(120) not null,
  sister_id integer not null,
  beds integer not null,
  ward_cost integer not null,
  PRIMARY KEY (ward_id),
  foreign key (sister_id) references sister(sister_id)
  );











CREATE TABLE patient (
  patient_id integer not null ,
  patient_fname varchar(120) not null ,
  patient_lname varchar(120) not null,
  patient_adress varchar(120) not null,
  patient_dob date not null,
  sex varchar(120) not null,
  PRIMARY KEY (patient_id),
  KEY  (patient_fname, patient_lname, patient_adress,patient_dob,sex)
);

CREATE TABLE Consultants (
  con_id integer not null, 
  con_name varchar(120) not null ,
  con_cost integer not null,
  PRIMARY KEY (con_id),
  KEY (con_name, con_cost)
);




CREATE TABLE nurses (
  nurse_fname varchar(120)not null,
  nurse_id integer not null,
  ward_id integer not null,
  nurse_lname varchar(120) not null ,
  PRIMARY KEY (nurse_id),
  KEY (nurse_fname, nurse_lname),
  foreign key (ward_id) references ward(ward_id)
);

CREATE TABLE medicine (
  med_name varchar(120) not null,
  med_cost integer not null ,
  PRIMARY KEY (med_name),
  KEY  (med_cost)
);

CREATE TABLE stay (
  stay_id integer not null ,
  emision date not null ,
  discharge date null ,
patient_id integer not null,
  illness varchar(120) not null ,
  bed_no integer not null,
  ward_id integer not null,
  con_id integer not null,
  med_name varchar(120) not null,
  PRIMARY KEY (stay_id),
  KEY (emision, discharge, illness, bed_no),
  foreign key (patient_id) references patient(patient_id),
  foreign key (ward_id) references ward(ward_id),
  foreign key (con_id) references consultants(con_id),
  foreign key (med_name) references medicine(med_name)
);




