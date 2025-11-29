-- =====================================
-- HOSPITAL DATASET — EXPECTED OUTPUT SUMMARY
-- =====================================

-- Q1. List all patients with their city and blood group.
-- patient_id | full_name    | city      | blood_group
-- ---------- | ------------ | --------- | -----------
-- 1          | Rahul Verma  | Delhi     | O+
-- 2          | Sneha Gupta  | Mumbai    | A+
-- 3          | Amit Singh   | Bangalore | B+
-- 4          | Priya Mehta  | Chennai   | AB+
-- 5          | Vikram Rao   | Delhi     | O-
-- 6          | Anjali Desai | Pune      | A+


-- Q2. List all doctors with their department name and specialization.
-- doctor_id | doctor_name      | department_name | specialization
-- --------- | ---------------- | --------------- | -------------------
-- 1         | Dr. Anil Kumar   | Cardiology      | Cardiac Surgeon
-- 2         | Dr. Priya Sharma | Pediatrics      | Pediatrician
-- 3         | Dr. Rajesh Patel | Orthopedics     | Orthopedic Surgeon
-- 4         | Dr. Meera Reddy  | Emergency       | Emergency Medicine
-- 5         | Dr. Sunil Nair   | Cardiology      | Cardiologist
-- 6         | Dr. Kavita Iyer  | Dermatology     | Dermatologist


-- Q3. List all appointments with patient name, doctor name, and status.
-- appointment_id | patient_name | doctor_name      | status
-- --------------- | ------------ | ---------------- | ---------
-- 1               | Rahul Verma  | Dr. Anil Kumar   | completed
-- 2               | Sneha Gupta  | Dr. Priya Sharma | completed
-- 3               | Amit Singh   | Dr. Rajesh Patel | scheduled
-- 4               | Rahul Verma  | Dr. Sunil Nair   | scheduled
-- 5               | Priya Mehta  | Dr. Kavita Iyer  | completed
-- 6               | Vikram Rao   | Dr. Meera Reddy  | cancelled
-- 7               | Anjali Desai | Dr. Priya Sharma | scheduled
-- 8               | Sneha Gupta  | Dr. Priya Sharma | no_show


-- Q4. For each department, show how many doctors work there.
-- department_id | department_name | doctor_count
-- ------------- | --------------- | ------------
-- 1             | Cardiology      | 2
-- 2             | Pediatrics      | 1
-- 3             | Orthopedics     | 1
-- 4             | Emergency       | 1
-- 5             | Dermatology     | 1


-- Q5. For each doctor, show the total number of appointments they have.
-- doctor_id | doctor_name      | appointment_count
-- --------- | ---------------- | -----------------
-- 1         | Dr. Anil Kumar   | 1
-- 2         | Dr. Priya Sharma | 3
-- 3         | Dr. Rajesh Patel | 1
-- 4         | Dr. Meera Reddy  | 1
-- 5         | Dr. Sunil Nair   | 1
-- 6         | Dr. Kavita Iyer  | 1


-- Q6. List all rooms that are currently occupied.
-- room_id | room_number | room_type
-- -------- | ----------- | ----------
-- 1        | R201        | general
-- 3        | R101        | general
-- 5        | R001        | emergency


-- Q7. List all patients who have NEVER had an appointment.
-- patient_id | full_name
-- ---------- | ----------
-- (None - all patients have appointments)


-- Q8. List all appointments that have NO prescriptions.
-- appointment_id | patient_name | status
-- --------------- | ------------ | ---------
-- 2               | Sneha Gupta  | completed
-- 3               | Amit Singh   | scheduled
-- 4               | Rahul Verma  | scheduled
-- 6               | Vikram Rao   | cancelled
-- 7               | Anjali Desai | scheduled
-- 8               | Sneha Gupta  | no_show


-- Q9. For each patient, show total consultation fees paid (completed appointments only).
-- patient_id | patient_name | total_fees
-- ---------- | ------------ | -----------
-- 1          | Rahul Verma  | 1500.00
-- 2          | Sneha Gupta  | 1000.00
-- 4          | Priya Mehta  | 800.00


-- Q10. Show the TOP 3 doctors by years of experience.
-- doctor_id | doctor_name      | years_experience
-- --------- | ---------------- | ----------------
-- 1         | Dr. Anil Kumar   | 15
-- 3         | Dr. Rajesh Patel | 12
-- 2         | Dr. Priya Sharma | 10


-- Q11. List all appointments scheduled for 2024-03-12.
-- appointment_id | patient_name | doctor_name      | appointment_time
-- --------------- | ------------ | ---------------- | ----------------
-- 4               | Rahul Verma  | Dr. Sunil Nair   | 09:00:00
-- 7               | Anjali Desai | Dr. Priya Sharma | 10:30:00


-- Q12. List all prescriptions with patient name and medication name.
-- prescription_id | patient_name | medication_name
-- --------------- | ------------ | -----------------
-- 1               | Rahul Verma  | Aspirin
-- 1               | Rahul Verma  | Atorvastatin
-- 2               | Sneha Gupta  | Paracetamol
-- 3               | Priya Mehta  | Antihistamine Cream
-- 4               | Priya Mehta  | Moisturizer


-- Q13. List all doctors who have NO appointments scheduled.
-- doctor_id | doctor_name
-- --------- | ------------
-- (None - all doctors have appointments)


-- Q14. For each room type, show how many rooms exist.
-- room_type | room_count
-- --------- | -----------
-- general   | 3
-- private   | 2
-- icu       | 1
-- emergency | 1


-- Q15. List all patients who have appointments with status 'cancelled' or 'no_show'.
-- patient_id | patient_name | status
-- ---------- | ------------ | ---------
-- 5          | Vikram Rao   | cancelled
-- 2          | Sneha Gupta  | no_show


-- Q16. Show all departments with average salary of doctors.
-- department_id | department_name | avg_salary
-- ------------- | --------------- | -----------
-- 1             | Cardiology      | 1850000.00
-- 2             | Pediatrics      | 1800000.00
-- 3             | Orthopedics     | 2200000.00
-- 4             | Emergency       | 1500000.00
-- 5             | Dermatology     | 1400000.00


-- Q17. List all appointments that have prescriptions but status is NOT 'completed'.
-- appointment_id | patient_name | status
-- --------------- | ------------ | ---------
-- (None - all appointments with prescriptions are completed)


-- Q18. For each doctor, show total consultation fees collected (completed appointments).
-- doctor_id | doctor_name      | total_fees_collected
-- --------- | ---------------- | --------------------
-- 1         | Dr. Anil Kumar   | 1500.00
-- 2         | Dr. Priya Sharma | 1000.00
-- 6         | Dr. Kavita Iyer  | 800.00


-- Q19. List all patients who have appointments with Cardiology department doctors.
-- patient_id | patient_name
-- ---------- | ------------
-- 1          | Rahul Verma


-- Q20. Patients with more than 1 prescription (using CTE).
-- patient_id | patient_name | prescription_count
-- ---------- | ------------ | -------------------
-- 1          | Rahul Verma  | 2
-- 4          | Priya Mehta  | 2


-- Q21. List all rooms that belong to departments with more than 1 doctor.
-- room_id | room_number | department_name
-- -------- | ----------- | ---------------
-- 1        | R201        | Cardiology
-- 2        | R202        | Cardiology


-- Q22. Show the department with the highest average doctor salary.
-- department_id | department_name | avg_salary
-- ------------- | --------------- | -----------
-- 3             | Orthopedics     | 2200000.00


-- Q23. List all doctors who have appointments but have NEVER prescribed any medication.
-- doctor_id | doctor_name
-- --------- | ------------
-- 2         | Dr. Priya Sharma
-- 3         | Dr. Rajesh Patel
-- 4         | Dr. Meera Reddy
-- 5         | Dr. Sunil Nair


-- Q24. For each appointment status, show how many appointments.
-- status    | appointment_count
-- --------- | -----------------
-- completed | 3
-- scheduled | 3
-- cancelled | 1
-- no_show   | 1


-- Q25. List all patients who have appointments with multiple different doctors.
-- patient_id | patient_name | doctor_count
-- ---------- | ------------ | ------------
-- 1          | Rahul Verma  | 2
-- 2          | Sneha Gupta  | 1

