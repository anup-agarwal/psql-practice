-- Clean up if you re-run
DROP TABLE IF EXISTS event_registrations, events, venues, organizers, attendees CASCADE;

-- Organizers
CREATE TABLE organizers (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  company_name TEXT,
  city TEXT
);

-- Venues
CREATE TABLE venues (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT,
  city TEXT NOT NULL,
  capacity INT,
  venue_type TEXT,  -- indoor / outdoor / hybrid
  cost_per_day NUMERIC(10,2)
);

-- Attendees
CREATE TABLE attendees (
  id SERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT,
  city TEXT,
  registration_date DATE NOT NULL
);

-- Events
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  organizer_id INT REFERENCES organizers(id),
  venue_id INT REFERENCES venues(id),
  event_date DATE NOT NULL,
  event_time TIME,
  event_type TEXT,  -- conference / workshop / concert / meetup / exhibition
  ticket_price NUMERIC(10,2),
  max_attendees INT,
  status TEXT DEFAULT 'scheduled'  -- scheduled / ongoing / completed / cancelled
);

-- Event Registrations (many-to-many events <-> attendees)
CREATE TABLE event_registrations (
  id SERIAL PRIMARY KEY,
  event_id INT REFERENCES events(id),
  attendee_id INT REFERENCES attendees(id),
  registration_date DATE NOT NULL,
  payment_status TEXT,  -- paid / unpaid / refunded
  ticket_number TEXT UNIQUE,
  UNIQUE (event_id, attendee_id)
);

--------------------------------------------------
-- Seed Data
--------------------------------------------------

-- Organizers
INSERT INTO organizers (id, full_name, email, phone, company_name, city) VALUES
  (1, 'Rajesh Kumar', 'rajesh@events.com', '9876543210', 'Tech Events India', 'Delhi'),
  (2, 'Priya Sharma', 'priya@events.com', '9876543211', 'Design Conferences', 'Mumbai'),
  (3, 'Amit Patel', 'amit@events.com', '9876543212', 'Music Festivals Co', 'Bangalore'),
  (4, 'Sneha Reddy', 'sneha@events.com', '9876543213', 'Workshop Hub', 'Chennai');

-- Venues
INSERT INTO venues (id, name, address, city, capacity, venue_type, cost_per_day) VALUES
  (1, 'Convention Center', 'Sector 18', 'Delhi', 500, 'indoor', 50000.00),
  (2, 'Beach Resort', 'Marine Drive', 'Mumbai', 300, 'outdoor', 75000.00),
  (3, 'Tech Park Auditorium', 'Whitefield', 'Bangalore', 200, 'indoor', 30000.00),
  (4, 'Exhibition Hall', 'T Nagar', 'Chennai', 400, 'indoor', 40000.00),
  (5, 'Stadium', 'Sports Complex', 'Delhi', 1000, 'outdoor', 100000.00);

-- Attendees
INSERT INTO attendees (id, full_name, email, phone, city, registration_date) VALUES
  (1, 'Vikram Singh', 'vikram@example.com', '9876543214', 'Delhi', '2024-01-05'),
  (2, 'Anjali Mehta', 'anjali@example.com', '9876543215', 'Mumbai', '2024-01-10'),
  (3, 'Rohit Jain', 'rohit@example.com', '9876543216', 'Bangalore', '2024-02-01'),
  (4, 'Kavita Iyer', 'kavita@example.com', '9876543217', 'Chennai', '2024-02-15'),
  (5, 'Sunil Nair', 'sunil@example.com', '9876543218', 'Pune', '2024-03-01'),
  (6, 'Meera Desai', 'meera@example.com', '9876543219', 'Delhi', '2024-03-05');

-- Events
INSERT INTO events (id, title, organizer_id, venue_id, event_date, event_time, event_type, ticket_price, max_attendees, status) VALUES
  (1, 'Tech Summit 2024', 1, 1, '2024-04-15', '09:00:00', 'conference', 2000.00, 500, 'scheduled'),
  (2, 'UI/UX Design Workshop', 2, 3, '2024-04-10', '10:00:00', 'workshop', 1500.00, 200, 'scheduled'),
  (3, 'Summer Music Festival', 3, 2, '2024-05-01', '18:00:00', 'concert', 3000.00, 300, 'scheduled'),
  (4, 'Developer Meetup', 1, 3, '2024-03-20', '19:00:00', 'meetup', 500.00, 200, 'completed'),
  (5, 'Art Exhibition', 4, 4, '2024-04-05', '11:00:00', 'exhibition', 800.00, 400, 'scheduled'),
  (6, 'Data Science Conference', 1, 1, '2024-03-25', '09:00:00', 'conference', 2500.00, 500, 'completed'),
  (7, 'Photography Workshop', 4, 4, '2024-04-20', '14:00:00', 'workshop', 1200.00, 400, 'scheduled');

-- Event Registrations
INSERT INTO event_registrations (id, event_id, attendee_id, registration_date, payment_status, ticket_number) VALUES
  (1, 1, 1, '2024-03-10', 'paid', 'T001'),
  (2, 1, 2, '2024-03-11', 'paid', 'T002'),
  (3, 1, 3, '2024-03-12', 'paid', 'T003'),
  (4, 2, 2, '2024-03-15', 'paid', 'T004'),
  (5, 2, 4, '2024-03-16', 'paid', 'T005'),
  (6, 3, 1, '2024-03-20', 'paid', 'T006'),
  (7, 3, 5, '2024-03-21', 'unpaid', 'T007'),
  (8, 4, 1, '2024-03-15', 'paid', 'T008'),
  (9, 4, 3, '2024-03-16', 'paid', 'T009'),
  (10, 4, 5, '2024-03-17', 'paid', 'T010'),
  (11, 5, 4, '2024-03-25', 'paid', 'T011'),
  (12, 6, 1, '2024-03-20', 'paid', 'T012'),
  (13, 6, 2, '2024-03-21', 'paid', 'T013'),
  (14, 6, 3, '2024-03-22', 'paid', 'T014'),
  (15, 6, 4, '2024-03-23', 'refunded', 'T015'),
  (16, 7, 6, '2024-04-01', 'paid', 'T016');

