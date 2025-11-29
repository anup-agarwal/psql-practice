-- Clean up if you re-run
DROP TABLE IF EXISTS prescriptions, appointments, patients, doctors, departments, rooms CASCADE;

-- Departments
CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  location TEXT
);

-- Doctors
CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  department_id INT REFERENCES departments(id),
  specialization TEXT,
  years_experience INT,
  salary NUMERIC(10,2)
);

-- Patients
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  date_of_birth DATE,
  blood_group TEXT,
  city TEXT,
  registered_at DATE NOT NULL
);

-- Rooms
CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  room_number TEXT UNIQUE NOT NULL,
  room_type TEXT,  -- general / private / icu / emergency
  capacity INT,
  is_occupied BOOLEAN DEFAULT false,
  department_id INT REFERENCES departments(id)
);

-- Appointments
CREATE TABLE appointments (
  id SERIAL PRIMARY KEY,
  patient_id INT REFERENCES patients(id),
  doctor_id INT REFERENCES doctors(id),
  room_id INT REFERENCES rooms(id),
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  status TEXT,  -- scheduled / completed / cancelled / no_show
  consultation_fee NUMERIC(10,2)
);

-- Prescriptions
CREATE TABLE prescriptions (
  id SERIAL PRIMARY KEY,
  appointment_id INT REFERENCES appointments(id),
  medication_name TEXT NOT NULL,
  dosage TEXT,
  frequency TEXT,
  duration_days INT,
  prescribed_date DATE NOT NULL
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Departments
INSERT INTO departments (id, name, location) VALUES
  (1, 'Cardiology', 'Floor 2'),
  (2, 'Pediatrics', 'Floor 1'),
  (3, 'Orthopedics', 'Floor 3'),
  (4, 'Emergency', 'Ground Floor'),
  (5, 'Dermatology', 'Floor 1');

-- Doctors
INSERT INTO doctors (id, full_name, email, department_id, specialization, years_experience, salary) VALUES
  (1, 'Dr. Anil Kumar', 'anil@hospital.com', 1, 'Cardiac Surgeon', 15, 2500000),
  (2, 'Dr. Priya Sharma', 'priya@hospital.com', 2, 'Pediatrician', 10, 1800000),
  (3, 'Dr. Rajesh Patel', 'rajesh@hospital.com', 3, 'Orthopedic Surgeon', 12, 2200000),
  (4, 'Dr. Meera Reddy', 'meera@hospital.com', 4, 'Emergency Medicine', 8, 1500000),
  (5, 'Dr. Sunil Nair', 'sunil@hospital.com', 1, 'Cardiologist', 5, 1200000),
  (6, 'Dr. Kavita Iyer', 'kavita@hospital.com', 5, 'Dermatologist', 7, 1400000);

-- Patients
INSERT INTO patients (id, full_name, email, phone, date_of_birth, blood_group, city, registered_at) VALUES
  (1, 'Rahul Verma', 'rahul@example.com', '9876543210', '1985-05-15', 'O+', 'Delhi', '2024-01-10'),
  (2, 'Sneha Gupta', 'sneha@example.com', '9876543211', '1990-08-22', 'A+', 'Mumbai', '2024-01-15'),
  (3, 'Amit Singh', 'amit@example.com', '9876543212', '1978-12-05', 'B+', 'Bangalore', '2024-02-01'),
  (4, 'Priya Mehta', 'priya@example.com', '9876543213', '1995-03-18', 'AB+', 'Chennai', '2024-02-10'),
  (5, 'Vikram Rao', 'vikram@example.com', '9876543214', '1988-07-30', 'O-', 'Delhi', '2024-03-01'),
  (6, 'Anjali Desai', 'anjali@example.com', '9876543215', '2000-11-12', 'A+', 'Pune', '2024-03-05');

-- Rooms
INSERT INTO rooms (id, room_number, room_type, capacity, is_occupied, department_id) VALUES
  (1, 'R201', 'general', 2, true, 1),
  (2, 'R202', 'private', 1, false, 1),
  (3, 'R101', 'general', 3, true, 2),
  (4, 'R301', 'icu', 1, false, 3),
  (5, 'R001', 'emergency', 4, true, 4),
  (6, 'R102', 'general', 2, false, 2),
  (7, 'R103', 'private', 1, false, 5);

-- Appointments
INSERT INTO appointments (id, patient_id, doctor_id, room_id, appointment_date, appointment_time, status, consultation_fee) VALUES
  (1, 1, 1, 1, '2024-03-10', '10:00:00', 'completed', 1500.00),
  (2, 2, 2, 3, '2024-03-10', '11:00:00', 'completed', 1000.00),
  (3, 3, 3, 4, '2024-03-11', '14:00:00', 'scheduled', 2000.00),
  (4, 1, 5, 2, '2024-03-12', '09:00:00', 'scheduled', 1200.00),
  (5, 4, 6, 7, '2024-03-11', '15:00:00', 'completed', 800.00),
  (6, 5, 4, 5, '2024-03-10', '16:00:00', 'cancelled', 1500.00),
  (7, 6, 2, 3, '2024-03-12', '10:30:00', 'scheduled', 1000.00),
  (8, 2, 2, 6, '2024-03-13', '11:00:00', 'no_show', 1000.00);

-- Prescriptions
INSERT INTO prescriptions (id, appointment_id, medication_name, dosage, frequency, duration_days, prescribed_date) VALUES
  (1, 1, 'Aspirin', '75mg', 'Once daily', 30, '2024-03-10'),
  (1, 1, 'Atorvastatin', '20mg', 'Once daily', 90, '2024-03-10'),
  (2, 2, 'Paracetamol', '500mg', 'Every 6 hours', 5, '2024-03-10'),
  (3, 5, 'Antihistamine Cream', 'Apply', 'Twice daily', 7, '2024-03-11'),
  (4, 5, 'Moisturizer', 'Apply', 'As needed', 14, '2024-03-11');

