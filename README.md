# Building Management System

A professional, dynamic, and unique Building Management System built with Java, Spring Boot, HTML, Tailwind CSS, and MySQL.

## Features

- 🏢 **Building Management** - Manage multiple buildings and properties
- 🏠 **Unit/Property Management** - Track units, occupancy status, and details
- 👥 **Tenant Management** - Manage tenant information, lease agreements, and history
- 🔧 **Maintenance Requests** - Track maintenance issues, assignments, and resolutions
- 💰 **Payment/Billing System** - Invoice generation, payment tracking, and reporting
- 📊 **Dashboard** - Real-time statistics, charts, and key metrics
- 🔐 **User Authentication** - Secure login with role-based access control
- 📱 **Responsive UI** - Mobile-friendly interface with Tailwind CSS

## Tech Stack

**Backend:**
- Java 11+
- Spring Boot 2.7.x
- Spring Data JPA
- MySQL 8.0+
- Maven

**Frontend:**
- HTML5
- CSS3 (Tailwind CSS)
- JavaScript (Vanilla)
- Bootstrap Icons

**Database:**
- MySQL 8.0+
- Flyway for migrations

## Prerequisites

- Java 11 or higher
- Maven 3.6+
- MySQL 8.0+
- Git
- Modern web browser

## Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/SRTRADERS24/building-management-system.git
cd building-management-system
```

### 2. Database Setup

**Create MySQL Database:**

```sql
CREATE DATABASE building_management_db;
USE building_management_db;
```

**Run the initialization script:**

```bash
mysql -u root -p building_management_db < database/schema.sql
```

### 3. Configure Application Properties

Update `src/main/resources/application.properties`:

```properties
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/building_management_db
spring.datasource.username=root
spring.datasource.password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA Configuration
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=false
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect

# Server Configuration
server.port=8080
server.servlet.context-path=/api

# Logging
logging.level.root=INFO
logging.level.com.bms=DEBUG
```

### 4. Build the Project

```bash
mvn clean install
```

### 5. Run the Application

```bash
mvn spring-boot:run
```

The application will start at `http://localhost:8080`

## Project Structure

```
src/
├── main/
│   ├── java/com/bms/
│   │   ├── controller/          # REST API Controllers
│   │   ├── service/             # Business Logic
│   │   ├── repository/          # Data Access Layer
│   │   ├── entity/              # JPA Entities
│   │   ├── dto/                 # Data Transfer Objects
│   │   ├── exception/           # Custom Exceptions
│   │   ├── config/              # Spring Configuration
│   │   ├── security/            # Security Configuration
│   │   └── BuildingManagementApp.java  # Main Application Class
│   └── resources/
│       ├── application.properties
│       ├── application-dev.properties
│       ├── application-prod.properties
│       └── db/migration/        # Flyway Migrations
├── test/                         # Unit and Integration Tests
frontend/
├── index.html                    # Home Page
├── dashboard.html                # Dashboard
├── buildings.html                # Building Management
├── units.html                    # Unit Management
├── tenants.html                  # Tenant Management
├── maintenance.html              # Maintenance Requests
├── payments.html                 # Payment Tracking
└── css/
    └── style.css                 # Tailwind CSS Styles
database/
├── schema.sql                    # Database Schema
└── sample-data.sql               # Sample Data
```

## API Endpoints

### Buildings
```
GET    /api/buildings              - Get all buildings
GET    /api/buildings/{id}         - Get building by ID
POST   /api/buildings              - Create new building
PUT    /api/buildings/{id}         - Update building
DELETE /api/buildings/{id}         - Delete building
```

### Units
```
GET    /api/units                  - Get all units
GET    /api/units/{id}             - Get unit by ID
POST   /api/units                  - Create new unit
PUT    /api/units/{id}             - Update unit
DELETE /api/units/{id}             - Delete unit
```

### Tenants
```
GET    /api/tenants                - Get all tenants
GET    /api/tenants/{id}           - Get tenant by ID
POST   /api/tenants                - Create new tenant
PUT    /api/tenants/{id}           - Update tenant
DELETE /api/tenants/{id}           - Delete tenant
```

### Maintenance
```
GET    /api/maintenance            - Get all requests
GET    /api/maintenance/{id}       - Get request by ID
POST   /api/maintenance            - Create new request
PUT    /api/maintenance/{id}       - Update request
DELETE /api/maintenance/{id}       - Delete request
```

### Payments
```
GET    /api/payments               - Get all payments
GET    /api/payments/{id}          - Get payment by ID
POST   /api/payments               - Create new payment
PUT    /api/payments/{id}          - Update payment
```

## Database Schema

The system includes the following main tables:

- **buildings** - Building information
- **units** - Rental units/properties
- **tenants** - Tenant information
- **leases** - Lease agreements
- **maintenance_requests** - Maintenance tickets
- **payments** - Payment records
- **users** - System users
- **audit_logs** - Activity logs

## Authentication

The system uses JWT (JSON Web Tokens) for authentication:

```bash
POST /api/auth/login
{
  "email": "user@example.com",
  "password": "password123"
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": { ... }
}
```

## Usage Examples

### Create a Building

```bash
curl -X POST http://localhost:8080/api/buildings \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Downtown Tower",
    "address": "123 Main St",
    "city": "New York",
    "state": "NY",
    "zipCode": "10001",
    "totalUnits": 50
  }'
```

### Create a Tenant

```bash
curl -X POST http://localhost:8080/api/tenants \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@example.com",
    "phone": "555-1234",
    "unitId": 1
  }'
```

## Configuration Files

### application.properties
Main configuration file for database, server, and logging settings.

### application-dev.properties
Development-specific configurations (debug logging, H2 database option).

### application-prod.properties
Production-specific configurations (security, caching, performance).

## Testing

Run unit tests:

```bash
mvn test
```

Run with coverage:

```bash
mvn clean test jacoco:report
```

## Development

### Running in Development Mode

```bash
mvn spring-boot:run -Dspring-boot.run.arguments="--spring.profiles.active=dev"
```

### Building for Production

```bash
mvn clean package -DskipTests
```

### Running the JAR

```bash
java -jar target/building-management-system-1.0.0.jar
```

## Troubleshooting

### Database Connection Issues
- Ensure MySQL is running
- Check database credentials in `application.properties`
- Verify database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### Port Already in Use
- Change port in `application.properties`: `server.port=8081`

### Build Failures
- Clear Maven cache: `mvn clean`
- Update dependencies: `mvn clean install -U`

## Contributing

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Commit changes: `git commit -am 'Add new feature'`
3. Push to branch: `git push origin feature/your-feature`
4. Submit a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions, please create an issue in the GitHub repository.

## Changelog

### Version 1.0.0 (2026-05-14)
- Initial release
- Core building management features
- Tenant management
- Maintenance request system
- Payment tracking
- Dashboard with statistics
- Responsive UI with Tailwind CSS

---

**Created by:** SRTRADERS24  
**Last Updated:** 2026-05-14