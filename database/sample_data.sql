-- Building Management System - Sample Data
-- Copy and paste this entire script into MySQL Workbench Query tab
-- Make sure you've already run schema.sql first

USE building_management_db;

-- =====================================================
-- INSERT USERS (Admin, Managers, Staff)
-- =====================================================
INSERT INTO users (username, email, password, first_name, last_name, phone, role, is_active) VALUES
('admin', 'admin@bms.com', '$2a$10$abc123def456ghi789jkl', 'Admin', 'User', '555-0001', 'ROLE_ADMIN', TRUE),
('manager1', 'john.manager@bms.com', '$2a$10$abc123def456ghi789jkl', 'John', 'Manager', '555-0002', 'ROLE_MANAGER', TRUE),
('manager2', 'sarah.manager@bms.com', '$2a$10$abc123def456ghi789jkl', 'Sarah', 'Manager', '555-0003', 'ROLE_MANAGER', TRUE),
('maintenance1', 'mike.maintenance@bms.com', '$2a$10$abc123def456ghi789jkl', 'Mike', 'Johnson', '555-0004', 'ROLE_STAFF', TRUE),
('maintenance2', 'david.maintenance@bms.com', '$2a$10$abc123def456ghi789jkl', 'David', 'Smith', '555-0005', 'ROLE_STAFF', TRUE),
('accountant', 'emily.accounting@bms.com', '$2a$10$abc123def456ghi789jkl', 'Emily', 'Accounting', '555-0006', 'ROLE_ACCOUNTANT', TRUE);

-- =====================================================
-- INSERT BUILDINGS
-- =====================================================
INSERT INTO buildings (name, address, city, state, zip_code, country, total_units, occupied_units, description, manager_id, is_active) VALUES
('Downtown Tower', '123 Main Street', 'New York', 'NY', '10001', 'USA', 50, 46, 'Modern high-rise in downtown area', 1, TRUE),
('Sunset Plaza', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'USA', 40, 38, 'Contemporary apartment complex', 2, TRUE),
('Green Gardens', '789 Park Road', 'Chicago', 'IL', '60601', 'USA', 35, 32, 'Eco-friendly residential building', 1, TRUE),
('Riverside Residences', '321 River Lane', 'San Francisco', 'CA', '94102', 'USA', 45, 43, 'Luxury waterfront apartments', 2, TRUE),
('Metropolitan Heights', '654 Central Park Avenue', 'Houston', 'TX', '77001', 'USA', 60, 55, 'Premium residential complex', 1, TRUE);

-- =====================================================
-- INSERT UNITS FOR DOWNTOWN TOWER (Building 1)
-- =====================================================
INSERT INTO units (building_id, unit_number, unit_type, bedrooms, bathrooms, square_feet, monthly_rent, deposit, status, floor) VALUES
(1, '101', 'Studio', 0, 1, 450, 1500, 3000, 'OCCUPIED', 1),
(1, '102', 'Studio', 0, 1, 450, 1500, 3000, 'OCCUPIED', 1),
(1, '103', '1BR', 1, 1, 650, 2000, 4000, 'OCCUPIED', 1),
(1, '104', '1BR', 1, 1, 650, 2000, 4000, 'VACANT', 1),
(1, '201', 'Studio', 0, 1, 450, 1500, 3000, 'OCCUPIED', 2),
(1, '202', '1BR', 1, 1, 650, 2000, 4000, 'OCCUPIED', 2),
(1, '203', '2BR', 2, 2, 950, 2800, 5600, 'OCCUPIED', 2),
(1, '204', '2BR', 2, 2, 950, 2800, 5600, 'OCCUPIED', 2),
(1, '301', '1BR', 1, 1, 650, 2000, 4000, 'OCCUPIED', 3),
(1, '302', '2BR', 2, 2, 950, 2800, 5600, 'OCCUPIED', 3);

-- =====================================================
-- INSERT UNITS FOR SUNSET PLAZA (Building 2)
-- =====================================================
INSERT INTO units (building_id, unit_number, unit_type, bedrooms, bathrooms, square_feet, monthly_rent, deposit, status, floor) VALUES
(2, '101', 'Studio', 0, 1, 500, 1800, 3600, 'OCCUPIED', 1),
(2, '102', '1BR', 1, 1, 700, 2200, 4400, 'OCCUPIED', 1),
(2, '103', '1BR', 1, 1, 700, 2200, 4400, 'VACANT', 1),
(2, '201', '2BR', 2, 2, 1000, 3000, 6000, 'OCCUPIED', 2),
(2, '202', '2BR', 2, 2, 1000, 3000, 6000, 'OCCUPIED', 2),
(2, '203', '3BR', 3, 2, 1400, 4000, 8000, 'OCCUPIED', 2),
(2, '301', '1BR', 1, 1, 700, 2200, 4400, 'OCCUPIED', 3),
(2, '302', '2BR', 2, 2, 1000, 3000, 6000, 'OCCUPIED', 3);

-- =====================================================
-- INSERT UNITS FOR GREEN GARDENS (Building 3)
-- =====================================================
INSERT INTO units (building_id, unit_number, unit_type, bedrooms, bathrooms, square_feet, monthly_rent, deposit, status, floor) VALUES
(3, '101', '1BR', 1, 1, 650, 1900, 3800, 'OCCUPIED', 1),
(3, '102', '1BR', 1, 1, 650, 1900, 3800, 'OCCUPIED', 1),
(3, '103', '2BR', 2, 2, 900, 2700, 5400, 'OCCUPIED', 1),
(3, '201', '2BR', 2, 2, 900, 2700, 5400, 'OCCUPIED', 2),
(3, '202', '2BR', 2, 2, 900, 2700, 5400, 'OCCUPIED', 2),
(3, '203', '3BR', 3, 2, 1300, 3800, 7600, 'VACANT', 2);

-- =====================================================
-- INSERT UNITS FOR RIVERSIDE RESIDENCES (Building 4)
-- =====================================================
INSERT INTO units (building_id, unit_number, unit_type, bedrooms, bathrooms, square_feet, monthly_rent, deposit, status, floor) VALUES
(4, '101', 'Studio', 0, 1, 550, 2200, 4400, 'OCCUPIED', 1),
(4, '102', '1BR', 1, 2, 800, 3000, 6000, 'OCCUPIED', 1),
(4, '103', '2BR', 2, 2, 1100, 3800, 7600, 'OCCUPIED', 1),
(4, '201', '2BR', 2, 2, 1100, 3800, 7600, 'OCCUPIED', 2),
(4, '202', '3BR', 3, 3, 1500, 5000, 10000, 'OCCUPIED', 2),
(4, '203', '3BR', 3, 3, 1500, 5000, 10000, 'VACANT', 2);

-- =====================================================
-- INSERT UNITS FOR METROPOLITAN HEIGHTS (Building 5)
-- =====================================================
INSERT INTO units (building_id, unit_number, unit_type, bedrooms, bathrooms, square_feet, monthly_rent, deposit, status, floor) VALUES
(5, '101', 'Studio', 0, 1, 500, 1700, 3400, 'OCCUPIED', 1),
(5, '102', '1BR', 1, 1, 700, 2300, 4600, 'OCCUPIED', 1),
(5, '103', '2BR', 2, 2, 1000, 3100, 6200, 'OCCUPIED', 1),
(5, '104', '2BR', 2, 2, 1000, 3100, 6200, 'OCCUPIED', 1),
(5, '105', '1BR', 1, 1, 700, 2300, 4600, 'VACANT', 1),
(5, '201', '3BR', 3, 2, 1400, 4200, 8400, 'OCCUPIED', 2),
(5, '202', '2BR', 2, 2, 1000, 3100, 6200, 'OCCUPIED', 2),
(5, '203', '3BR', 3, 3, 1500, 4800, 9600, 'OCCUPIED', 2);

-- =====================================================
-- INSERT TENANTS (9 Tenants)
-- =====================================================
INSERT INTO tenants (unit_id, first_name, last_name, email, phone, date_of_birth, identity_number, emergency_contact, emergency_phone, employment_status, employer_name, move_in_date, status) VALUES
(1, 'James', 'Brown', 'james.brown@email.com', '555-1001', '1985-03-15', 'ID123456', 'Mary Brown', '555-1002', 'EMPLOYED', 'Tech Corp', '2023-06-01', 'ACTIVE'),
(2, 'Lisa', 'Anderson', 'lisa.anderson@email.com', '555-1003', '1990-07-22', 'ID123457', 'Robert Anderson', '555-1004', 'EMPLOYED', 'Finance Inc', '2023-08-15', 'ACTIVE'),
(3, 'Michael', 'Davis', 'michael.davis@email.com', '555-1005', '1988-11-10', 'ID123458', 'Jennifer Davis', '555-1006', 'EMPLOYED', 'Marketing Solutions', '2023-09-01', 'ACTIVE'),
(5, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '555-1007', '1992-01-30', 'ID123459', 'Thomas Wilson', '555-1008', 'SELF_EMPLOYED', 'Independent Consultant', '2024-01-10', 'ACTIVE'),
(6, 'David', 'Moore', 'david.moore@email.com', '555-1009', '1987-05-18', 'ID123460', 'Elizabeth Moore', '555-1010', 'EMPLOYED', 'Healthcare Plus', '2024-02-01', 'ACTIVE'),
(7, 'Emma', 'Taylor', 'emma.taylor@email.com', '555-1011', '1993-09-25', 'ID123461', 'William Taylor', '555-1012', 'EMPLOYED', 'Education Services', '2024-03-15', 'ACTIVE'),
(8, 'Robert', 'Johnson', 'robert.johnson@email.com', '555-1013', '1980-12-05', 'ID123462', 'Catherine Johnson', '555-1014', 'EMPLOYED', 'Engineering Co', '2023-11-01', 'ACTIVE'),
(9, 'Jessica', 'Martinez', 'jessica.martinez@email.com', '555-1015', '1991-04-12', 'ID123463', 'Carlos Martinez', '555-1016', 'EMPLOYED', 'Legal Associates', '2024-04-01', 'ACTIVE'),
(10, 'Christopher', 'Garcia', 'christopher.garcia@email.com', '555-1017', '1986-08-20', 'ID123464', 'Maria Garcia', '555-1018', 'EMPLOYED', 'Manufacturing Ltd', '2023-12-15', 'ACTIVE');

-- =====================================================
-- INSERT LEASES (9 Active Leases)
-- =====================================================
INSERT INTO leases (tenant_id, unit_id, lease_start_date, lease_end_date, monthly_rent, deposit, lease_term_months, lease_type, auto_renewal, status) VALUES
(1, 1, '2023-06-01', '2026-05-31', 1500, 3000, 36, 'FIXED', TRUE, 'ACTIVE'),
(2, 2, '2023-08-15', '2026-08-14', 1500, 3000, 36, 'FIXED', TRUE, 'ACTIVE'),
(3, 3, '2023-09-01', '2024-08-31', 2000, 4000, 12, 'FIXED', FALSE, 'ACTIVE'),
(4, 5, '2024-01-10', '2025-01-09', 1500, 3000, 12, 'FIXED', TRUE, 'ACTIVE'),
(5, 6, '2024-02-01', '2026-01-31', 2000, 4000, 24, 'FIXED', TRUE, 'ACTIVE'),
(6, 7, '2024-03-15', '2026-03-14', 2800, 5600, 24, 'FIXED', TRUE, 'ACTIVE'),
(7, 8, '2023-11-01', '2026-10-31', 2800, 5600, 36, 'FIXED', TRUE, 'ACTIVE'),
(8, 9, '2024-04-01', '2025-03-31', 2000, 4000, 12, 'FIXED', FALSE, 'ACTIVE'),
(9, 10, '2023-12-15', '2026-12-14', 2800, 5600, 36, 'FIXED', TRUE, 'ACTIVE');

-- =====================================================
-- INSERT MAINTENANCE REQUESTS (7 Requests)
-- =====================================================
INSERT INTO maintenance_requests (unit_id, building_id, tenant_id, title, description, category, priority, status, assigned_to, scheduled_date, estimated_cost) VALUES
(3, 1, 3, 'Leaky Faucet Kitchen', 'Kitchen faucet is dripping constantly, needs repair or replacement', 'PLUMBING', 'HIGH', 'OPEN', 4, '2026-05-18', 250.00),
(7, 1, 6, 'HVAC Not Cooling', 'Air conditioning unit not providing adequate cooling, temperature is above 78F', 'HVAC', 'HIGH', 'IN_PROGRESS', 5, '2026-05-16', 800.00),
(2, 1, 2, 'Paint Touch-up Needed', 'Wall paint is chipped in living room, needs touch-up painting', 'COSMETIC', 'MEDIUM', 'OPEN', 4, '2026-05-25', 150.00),
(5, 1, 4, 'Door Lock Issue', 'Front door lock is sticking, difficult to open', 'LOCKSMITH', 'MEDIUM', 'SCHEDULED', NULL, '2026-05-20', 200.00),
(10, 1, 9, 'Carpet Stain Removal', 'Large stain in bedroom carpet, needs professional cleaning', 'CLEANING', 'LOW', 'OPEN', NULL, NULL, 300.00),
(12, 2, NULL, 'Leaking Ceiling', 'Water leaking from ceiling in bathroom during rain', 'ROOFING', 'CRITICAL', 'IN_PROGRESS', 5, '2026-05-15', 1200.00),
(14, 2, NULL, 'Broken Window', 'Bedroom window glass is cracked', 'MAINTENANCE', 'HIGH', 'OPEN', 4, '2026-05-19', 400.00);

-- =====================================================
-- INSERT PAYMENTS - MONTHLY RENT (18 Payment Records)
-- =====================================================
INSERT INTO payments (tenant_id, unit_id, building_id, lease_id, payment_type, amount, payment_date, due_date, payment_method, status, description) VALUES
(1, 1, 1, 1, 'RENT', 1500, '2026-05-05', '2026-05-01', 'BANK_TRANSFER', 'PAID', 'May 2026 Rent'),
(1, 1, 1, 1, 'RENT', 1500, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent'),
(2, 2, 1, 2, 'RENT', 1500, '2026-05-08', '2026-05-01', 'CHECK', 'PAID', 'May 2026 Rent'),
(2, 2, 1, 2, 'RENT', 1500, NULL, '2026-06-01', 'CHECK', 'PENDING', 'June 2026 Rent'),
(3, 3, 1, 3, 'RENT', 2000, '2026-05-02', '2026-05-01', 'BANK_TRANSFER', 'PAID', 'May 2026 Rent'),
(3, 3, 1, 3, 'RENT', 2000, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent'),
(4, 5, 1, 4, 'RENT', 1500, '2026-05-10', '2026-05-01', 'ONLINE', 'PAID', 'May 2026 Rent'),
(4, 5, 1, 4, 'RENT', 1500, NULL, '2026-06-01', 'ONLINE', 'PENDING', 'June 2026 Rent'),
(5, 6, 1, 5, 'RENT', 2000, '2026-05-03', '2026-05-01', 'BANK_TRANSFER', 'PAID', 'May 2026 Rent'),
(5, 6, 1, 5, 'RENT', 2000, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent'),
(6, 7, 1, 6, 'RENT', 2800, '2026-04-28', '2026-05-01', 'BANK_TRANSFER', 'LATE', 'May 2026 Rent - OVERDUE'),
(6, 7, 1, 6, 'RENT', 2800, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent'),
(7, 8, 1, 7, 'RENT', 2800, '2026-05-01', '2026-05-01', 'BANK_TRANSFER', 'PAID', 'May 2026 Rent'),
(7, 8, 1, 7, 'RENT', 2800, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent'),
(8, 9, 1, 8, 'RENT', 2000, '2026-05-12', '2026-05-01', 'CHECK', 'PAID', 'May 2026 Rent'),
(8, 9, 1, 8, 'RENT', 2000, NULL, '2026-06-01', 'CHECK', 'PENDING', 'June 2026 Rent'),
(9, 10, 1, 9, 'RENT', 2800, '2026-05-06', '2026-05-01', 'BANK_TRANSFER', 'PAID', 'May 2026 Rent'),
(9, 10, 1, 9, 'RENT', 2800, NULL, '2026-06-01', 'BANK_TRANSFER', 'PENDING', 'June 2026 Rent');

-- =====================================================
-- INSERT EXPENSES (10 Expense Records)
-- =====================================================
INSERT INTO expenses (building_id, expense_type, category, amount, expense_date, paid_by, vendor_name, payment_method, status, description) VALUES
(1, 'Utilities', 'UTILITIES', 2500.00, '2026-05-10', 'Admin', 'City Utilities', 'ACH', 'PAID', 'Water, Electric, Gas for April 2026'),
(1, 'Building Insurance', 'INSURANCE', 5000.00, '2026-05-01', 'Admin', 'ABC Insurance Corp', 'CHECK', 'PAID', 'Monthly Building Insurance'),
(1, 'Cleaning Service', 'MAINTENANCE', 1500.00, '2026-05-12', 'Manager', 'Pro Cleaning Services', 'CHECK', 'PAID', 'Common area cleaning May 2026'),
(1, 'Security Service', 'SECURITY', 3000.00, '2026-05-05', 'Admin', 'Safe Guard Security', 'ACH', 'PAID', 'Security services May 2026'),
(2, 'Utilities', 'UTILITIES', 1800.00, '2026-05-08', 'Admin', 'City Utilities', 'ACH', 'PAID', 'Utilities for April 2026'),
(2, 'Landscaping', 'MAINTENANCE', 800.00, '2026-05-10', 'Manager', 'Green Landscape Co', 'CHECK', 'PAID', 'Lawn and garden maintenance'),
(3, 'Utilities', 'UTILITIES', 2000.00, '2026-05-09', 'Admin', 'City Utilities', 'ACH', 'PAID', 'Green utilities for April 2026'),
(3, 'Waste Management', 'MAINTENANCE', 600.00, '2026-05-12', 'Manager', 'Eco Waste Services', 'CHECK', 'PAID', 'Waste pickup and recycling'),
(4, 'Building Insurance', 'INSURANCE', 6000.00, '2026-05-01', 'Admin', 'Premium Insurance Ltd', 'CHECK', 'PAID', 'Luxury building insurance'),
(5, 'Utilities', 'UTILITIES', 3200.00, '2026-05-11', 'Admin', 'Energy Provider', 'ACH', 'PAID', 'Large complex utilities');

-- =====================================================
-- INSERT AUDIT LOGS (5 Log Entries)
-- =====================================================
INSERT INTO audit_logs (user_id, action, entity_type, entity_id, old_value, new_value, ip_address, status) VALUES
(1, 'LOGIN', 'USER', 1, NULL, NULL, '192.168.1.100', 'SUCCESS'),
(1, 'CREATE', 'BUILDING', 1, NULL, '{"name": "Downtown Tower"}', '192.168.1.100', 'SUCCESS'),
(2, 'UPDATE', 'TENANT', 1, '{"status": "PENDING"}', '{"status": "ACTIVE"}', '192.168.1.101', 'SUCCESS'),
(4, 'CREATE', 'MAINTENANCE_REQUEST', 1, NULL, '{"title": "Leaky Faucet"}', '192.168.1.102', 'SUCCESS'),
(1, 'APPROVE', 'PAYMENT', 1, '{"status": "PENDING"}', '{"status": "PAID"}', '192.168.1.100', 'SUCCESS');

-- =====================================================
-- UPDATE BUILDING OCCUPIED UNITS COUNT
-- =====================================================
UPDATE buildings SET occupied_units = 46 WHERE id = 1;
UPDATE buildings SET occupied_units = 38 WHERE id = 2;
UPDATE buildings SET occupied_units = 32 WHERE id = 3;
UPDATE buildings SET occupied_units = 43 WHERE id = 4;
UPDATE buildings SET occupied_units = 55 WHERE id = 5;

-- =====================================================
-- VERIFICATION QUERIES - RUN THESE TO VERIFY DATA
-- =====================================================
-- SELECT 'Sample Data Loading Complete!' as Status;
-- SELECT COUNT(*) as Total_Users FROM users;
-- SELECT COUNT(*) as Total_Buildings FROM buildings;
-- SELECT COUNT(*) as Total_Units FROM units;
-- SELECT COUNT(*) as Total_Tenants FROM tenants;
-- SELECT COUNT(*) as Total_Leases FROM leases;
-- SELECT COUNT(*) as Total_Maintenance FROM maintenance_requests;
-- SELECT COUNT(*) as Total_Payments FROM payments;
-- SELECT COUNT(*) as Total_Expenses FROM expenses;