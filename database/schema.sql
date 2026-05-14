-- Building Management System Database Schema
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS building_management_db;
USE building_management_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL DEFAULT 'ROLE_USER',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_username (username)
);

-- Buildings Table
CREATE TABLE IF NOT EXISTS buildings (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    country VARCHAR(50) DEFAULT 'USA',
    total_units INT NOT NULL DEFAULT 0,
    occupied_units INT DEFAULT 0,
    description TEXT,
    manager_id BIGINT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (manager_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_city (city),
    INDEX idx_state (state),
    INDEX idx_manager_id (manager_id)
);

-- Units/Properties Table
CREATE TABLE IF NOT EXISTS units (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    building_id BIGINT NOT NULL,
    unit_number VARCHAR(50) NOT NULL,
    unit_type VARCHAR(50) NOT NULL,
    bedrooms INT,
    bathrooms DECIMAL(3,1),
    square_feet INT,
    monthly_rent DECIMAL(10,2),
    deposit DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'VACANT',
    floor INT,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE CASCADE,
    UNIQUE KEY unique_unit_per_building (building_id, unit_number),
    INDEX idx_building_id (building_id),
    INDEX idx_status (status)
);

-- Tenants Table
CREATE TABLE IF NOT EXISTS tenants (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    unit_id BIGINT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    identity_number VARCHAR(50),
    emergency_contact VARCHAR(100),
    emergency_phone VARCHAR(20),
    employment_status VARCHAR(50),
    employer_name VARCHAR(100),
    move_in_date DATE,
    move_out_date DATE,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE CASCADE,
    INDEX idx_unit_id (unit_id),
    INDEX idx_email (email),
    INDEX idx_phone (phone),
    INDEX idx_status (status)
);

-- Leases Table
CREATE TABLE IF NOT EXISTS leases (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    tenant_id BIGINT NOT NULL,
    unit_id BIGINT NOT NULL,
    lease_start_date DATE NOT NULL,
    lease_end_date DATE NOT NULL,
    monthly_rent DECIMAL(10,2) NOT NULL,
    deposit DECIMAL(10,2),
    lease_term_months INT,
    lease_type VARCHAR(50) DEFAULT 'FIXED',
    renewal_notice_days INT DEFAULT 30,
    auto_renewal BOOLEAN DEFAULT FALSE,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    document_url VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE CASCADE,
    INDEX idx_tenant_id (tenant_id),
    INDEX idx_unit_id (unit_id),
    INDEX idx_status (status),
    INDEX idx_lease_start_date (lease_start_date),
    INDEX idx_lease_end_date (lease_end_date)
);

-- Maintenance Requests Table
CREATE TABLE IF NOT EXISTS maintenance_requests (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    unit_id BIGINT NOT NULL,
    building_id BIGINT NOT NULL,
    tenant_id BIGINT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    priority VARCHAR(20) DEFAULT 'MEDIUM',
    status VARCHAR(20) DEFAULT 'OPEN',
    assigned_to BIGINT,
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    scheduled_date DATE,
    completed_date DATE,
    estimated_cost DECIMAL(10,2),
    actual_cost DECIMAL(10,2),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE CASCADE,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE CASCADE,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_building_id (building_id),
    INDEX idx_unit_id (unit_id),
    INDEX idx_tenant_id (tenant_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_assigned_to (assigned_to)
);

-- Payments/Invoices Table
CREATE TABLE IF NOT EXISTS payments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    tenant_id BIGINT NOT NULL,
    unit_id BIGINT NOT NULL,
    building_id BIGINT NOT NULL,
    lease_id BIGINT,
    payment_type VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE,
    due_date DATE NOT NULL,
    payment_method VARCHAR(50),
    status VARCHAR(20) DEFAULT 'PENDING',
    transaction_id VARCHAR(100),
    description VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE CASCADE,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE CASCADE,
    FOREIGN KEY (lease_id) REFERENCES leases(id) ON DELETE SET NULL,
    INDEX idx_tenant_id (tenant_id),
    INDEX idx_building_id (building_id),
    INDEX idx_status (status),
    INDEX idx_due_date (due_date),
    INDEX idx_payment_date (payment_date)
);

-- Expenses Table
CREATE TABLE IF NOT EXISTS expenses (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    building_id BIGINT NOT NULL,
    expense_type VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    paid_by VARCHAR(100),
    vendor_name VARCHAR(100),
    payment_method VARCHAR(50),
    status VARCHAR(20) DEFAULT 'PENDING',
    receipt_url VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE CASCADE,
    INDEX idx_building_id (building_id),
    INDEX idx_expense_date (expense_date),
    INDEX idx_category (category)
);

-- Audit Logs Table
CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT,
    action VARCHAR(100) NOT NULL,
    entity_type VARCHAR(100),
    entity_id BIGINT,
    old_value TEXT,
    new_value TEXT,
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_entity_type (entity_type),
    INDEX idx_created_at (created_at)
);

-- Dashboard Statistics Table
CREATE TABLE IF NOT EXISTS dashboard_stats (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    building_id BIGINT,
    total_buildings INT DEFAULT 0,
    total_units INT DEFAULT 0,
    occupied_units INT DEFAULT 0,
    vacant_units INT DEFAULT 0,
    active_tenants INT DEFAULT 0,
    total_revenue DECIMAL(15,2) DEFAULT 0,
    pending_payments DECIMAL(15,2) DEFAULT 0,
    open_maintenance INT DEFAULT 0,
    completed_maintenance INT DEFAULT 0,
    calculated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE CASCADE,
    INDEX idx_building_id (building_id)
);

-- Create Indexes for Performance
CREATE INDEX idx_units_building_status ON units(building_id, status);
CREATE INDEX idx_tenants_unit_status ON tenants(unit_id, status);
CREATE INDEX idx_payments_status_due_date ON payments(status, due_date);
CREATE INDEX idx_maintenance_status_priority ON maintenance_requests(status, priority);

-- Add Views for Common Queries

-- View: Active Tenants
CREATE VIEW v_active_tenants AS
SELECT 
    t.id,
    t.first_name,
    t.last_name,
    t.email,
    t.phone,
    u.unit_number,
    b.name as building_name,
    l.lease_end_date,
    t.move_in_date
FROM tenants t
JOIN units u ON t.unit_id = u.id
JOIN buildings b ON u.building_id = b.id
JOIN leases l ON t.id = l.tenant_id
WHERE t.status = 'ACTIVE' AND l.status = 'ACTIVE';

-- View: Pending Payments
CREATE VIEW v_pending_payments AS
SELECT 
    p.id,
    t.first_name,
    t.last_name,
    p.amount,
    p.due_date,
    DATEDIFF(CURDATE(), p.due_date) as days_overdue,
    u.unit_number,
    b.name as building_name
FROM payments p
JOIN tenants t ON p.tenant_id = t.id
JOIN units u ON p.unit_id = u.id
JOIN buildings b ON p.building_id = b.id
WHERE p.status = 'PENDING'
ORDER BY p.due_date ASC;

-- View: Open Maintenance Requests
CREATE VIEW v_open_maintenance AS
SELECT 
    mr.id,
    mr.title,
    mr.description,
    mr.priority,
    mr.status,
    u.unit_number,
    b.name as building_name,
    t.first_name,
    t.last_name,
    mr.request_date,
    DATEDIFF(CURDATE(), DATE(mr.request_date)) as days_open
FROM maintenance_requests mr
JOIN units u ON mr.unit_id = u.id
JOIN buildings b ON mr.building_id = b.id
LEFT JOIN tenants t ON mr.tenant_id = t.id
WHERE mr.status IN ('OPEN', 'IN_PROGRESS')
ORDER BY mr.priority DESC, mr.request_date ASC;

-- View: Building Summary
CREATE VIEW v_building_summary AS
SELECT 
    b.id,
    b.name,
    b.address,
    b.city,
    b.state,
    b.zip_code,
    b.total_units,
    COUNT(DISTINCT CASE WHEN u.status = 'OCCUPIED' THEN u.id END) as occupied_units,
    COUNT(DISTINCT CASE WHEN u.status = 'VACANT' THEN u.id END) as vacant_units,
    COUNT(DISTINCT t.id) as active_tenants,
    SUM(CASE WHEN p.status = 'PENDING' THEN p.amount ELSE 0 END) as pending_revenue
FROM buildings b
LEFT JOIN units u ON b.id = u.building_id
LEFT JOIN tenants t ON u.id = t.unit_id AND t.status = 'ACTIVE'
LEFT JOIN payments p ON b.id = p.building_id
GROUP BY b.id, b.name, b.address, b.city, b.state, b.zip_code, b.total_units;