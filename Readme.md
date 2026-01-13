                                 CI/CD Capstone Project
---
### 1.Project Overview

 This project demonstrates a complete **end-to-end CI/CD pipeline** for a simple **2-tier web application** using    **Docker** and **GitHub Actions**. 
The pipeline automatically:
* Builds Docker images
* Runs basic tests
* Performs container security scanning
* Pushes images to Docker Hub
* Deploys the application to a **staging environment** using Docker Compose

---

### 2.Problem statement

Build a complete CI/CD system that automatically tests, builds, and deploys a simple web application through  staging  environment using Docker and Docker compose.

---

### 3.Application Architecture

1. Frontend
   * Static HTML-based web application
   * Acts as the user interface for the system
   * Displays:
     - Application health status
     - Database connection status
     - Total record count
     - Employee data table

 ```
     User Browser
     |
     |  HTTP Request (Port 80)
     v
Frontend Container (Nginx)
     |
     |  Serves static HTML 
     v
index.html
     |
     |  fetch()
     v
Backend API (/health, /db-status)
     |
     v
Render Status & Data in UI

```
 2. backend
    - RESTful API developed using Flask
    - Provides endpoints:
       - /health – application health
      - /db-status – database status and employee records
    - Uses environment variables for database connection
```
Frontend Request
      |
      |  HTTP Request (Port 5000)
      v
Backend Container (Flask)
      |
      |  /health endpoint
      |---------------------> Returns "OK"
      |
      |  /db-status endpoint
      v
Connect to Database
      |
      v
Query Employee Records
      |
      v
JSON Response to Frontend
```
3. database
   * PostgreSQL container
   * Stores employee records
   * Persistent volume for data durability
```
Backend Container
      |
      |  SQL Query
      v
PostgreSQL Container
      |
      |  Authentication
      v
employees Table
      |
      |  Fetch Records
      v
Result Set
      |
      v
Backend Response
```
---

### 4.Project Architecture

- The application follows a 2-tier architecture with CI/CD automation.
- Architecture Flow:
     * Developer pushes code to GitHub
     * Github actions automatically develop CI/CD pipeline
     * CI/CD  pipeline builds, tests, scans, and pushes images
     * CI/CD pipeline deploys application to target environment
     * Frontend communicates with backend
     * Backend interacts with PostgreSQL database
 
 ### The Complete System Architecture
 ![CICD pipeline flow](https://github.com/raghavi421/CICD-webapplication/blob/cc0c559fce3fe398864f749f7d85761f5c6d7fcb/images/CICD%20pipeline%20flow.png)

### Github Actions Pipeline Architecture
 ![CICD pipeline ](https://github.com/raghavi421/CICD-webapplication/blob/5b54b5d86c58853a1570dd7fcc61daa5861e594c/images/CICD%20pipeline.png)
 
 ---

### 5. Project Structure

```
CICD-WEBAPPLICATION
├── .github/workflows/
│   └── ci-cd.yml
├── backend/
│   ├── app.py
│   ├── Dockerfile
│   └── requirements.txt
├── frontend/
│   ├── Dockerfile
│   └── index.html
├── scripts/
│   ├── deploy.sh
│   └── verify.sh
├── .env
├── .env.staging
├── docker-compose.yml
├── docker-compose-staging.yml
└── README.md
```

---

### 6.Technology Stack

| Component     | Technology     |
| ------------- | -------------- |
| Frontend      | HTML + Nginx   |
| Backend       | Python (Flask) |
| Database      | PostgreSQL     |
| Containers    | Docker         |
| Orchestration | Docker Compose |
| CI/CD         | GitHub Actions |
| Security      | Trivy          |
| Registry      | Docker Hub     |

---

### 7.Tools & Technologies Used

  ### 1. Github
   Purpose: Source code management Usage in Project
   - Stores application source code
   - Triggers CI/CD pipeline using GitHub actions
   ### 2. Docker
   Purpose: Containerization platform Usage in Project
   - Containerizes frontend, backend, database, and github actions
   - Ensures consistency across environments
   - Used in Jenkins pipeline for image build, push, and deployment
   ### 3. Docker Compose
   Purpose: Multi-container orchestration Usage in Project
  - Defines frontend, backend, and database services
  - Creates shared networks and persistent volumes
  - Used for local development, testing, and deployment
### 4. Nginx
Purpose: Web server.  Usage in Project:
- Serves static frontend files
- Used with nginx:alpine image for minimal size
- Acts as production-grade frontend server

### 5. PostgreSQL
Purpose: Relational database.  Usage in Project:
- Stores employee records
- Runs as a Docker container
- Connected to backend using environment variables
- Data displayed dynamically on frontend UI

### 6.  Trivy
Purpose: Container security scanning.  Usage in Project:
- Scans Docker images for vulnerabilities
- Integrated into Jenkins pipeline
- Ensures secure images before deployment

### 7. Bash / Shell Scripts
Purpose: Deployment automation.  Usage in Project:
- deploy.sh handles environment-specific deployment
- Automates container restart and health verification
- Used by github actions during CD stages
         
### 8.Pulling and Running the Project on Any Computer

1.Prerequisites
- Docker
- Docker Compose
- Git
- Jenkins
  
  ### Step 1: Clone Repository
```
git clone https://github.com/raghavi421/CICD-webapplication.git
cd CICD-webapplication
```
### Step 2: Pull Docker Images
```
docker pull praghavi123/backend:latest
docker pull praghavi123/frontend:latest
```
### Step 3: Run Application
```
docker-compose up -d
```
### Step 4: Verify Application

- Frontend UI: (http://localhost:8080)
  ![Frontend output](https://github.com/raghavi421/CICD-webapplication/blob/cc0c559fce3fe398864f749f7d85761f5c6d7fcb/images/CICD%20pipeline%20flow.png)
- Backend API: (http://localhost:5000)
  ![backend output](https://github.com/raghavi421/CICD-webapplication/blob/cc0c559fce3fe398864f749f7d85761f5c6d7fcb/images/CICD%20pipeline%20flow.png)
- Health Endpoint: (http://localhost:5000/health)
  ![healthcheck output](https://github.com/raghavi421/CICD-webapplication/blob/cc0c559fce3fe398864f749f7d85761f5c6d7fcb/images/CICD%20pipeline%20flow.png)

### 9. Docker Implementation

 **Backend Dockerfile (Highlights)**

* Multi-stage build
* Lightweight Python base image
* Non-root user for security
* Environment variable support

 **Frontend Dockerfile (Highlights)**

* Multi-stage build
* Nginx-based static serving
* Optimized image size

---

### 10. Docker Compose Configuration
docker-compose.yml includes:

### Services
- backend
- frontend
- db (PostgreSQL)
### Features
- Isolated Docker network
- Named volume for database persistence
- Environment variables for database configuration Docker Compose is used both locally and during deployment to ensure environment consistency.

---
### 11. CI/CD Pipeline Using Github Actions
The complete CI/CD workflow is defined in the Jenkinsfile

### Pipeline Stages:
- Checkout Code
- Build Docker Images
- Container Health Test
- Security Scan (Trivy)
- Push Images to Docker Hub
- Deploy to Development
- Deploy to Staging
- Manual Approval
- Deploy to Production
  ![CICD FLOW](https://github.com/raghavi421/CICD-webapplication/blob/a9ad12b608b355797841d9b2cd5bce44243f8684/images/CICD%20FLOW.png)
---

### 12. Security Scanning with Trivy
Trivy is integrated into the pipeline as a mandatory gate.
- Scans backend image
- Checks for HIGH and CRITICAL vulnerabilities
- Pipeline fails immediately if issues are found This step ensures that insecure images are never deployed.
---
### 13. Docker Hub Image Registry
- Backend and frontend images are pushed separately
- Docker Hub access token is used (no plaintext credentials)
- Images are versioned and reusable across environments
   ![dockerhub image](https://github.com/raghavi421/CICD-webapplication/blob/7ac1e58f91e8bd9e29ac3389c336dc2c6c1f27b4/images/dockerhub%20image.png))
---
### 14. Environment Mapping Explanation
Although the same Docker Compose configuration is reused, logical environments are clearly defined through execution context and process separation.

### Development Environment
- Local machine execution
- Manual docker-compose up
- Used for development and local testing
### Staging Environment
- Jenkins pipeline execution
- Automated build, test, scan, and validation
- Acts as a controlled pre-production gate
---
### 15. Continuous Deployment
- Jenkins pulls latest images
- Stops old containers
- Starts new containers
- Verifies deployment using /health endpoint
- Production deployment requires manual approval
---
### 16. Deployment Script
deploy.sh performs:
- Existing containers are stopped
- Latest images are pulled from Docker Hub
- New containers are started using Docker Compose
- No manual deployment steps are required

  Start deploy.sh
     |
     v
Read Environment Argument
     |
     v
Select Correct .env File
     |
     v
Pull Latest Docker Images
     |
     v
Stop Existing Containers
     |
     v
Start New Containers
     |
     v
Run Health Check
     |
     v
Deployment SUCCESS / FAILURE
```
---

### 17.Troubleshooting Guide
This section lists common issues encountered during local execution or CI/CD pipeline runs, along with quick resolutions.

### Containers not starting:
Symptoms: Containers exit or application is unreachable.
Fix:
```
docker-compose logs
```
### Frontend Loads but Backend Fails
Symptoms: UI loads, API endpoints fail.
Fix:
```
docker-compose logs backend
docker-compose restart backend
```
### Health check failing:
Symptoms: Github actions pipeline fails at /health check.
Fix:
```
curl http://localhost:5000/health
```
Ensure Flask binds to 0.0.0.0 and backend container is running.

### Database Connection Errors
Symptoms: Backend crashes with DB errors.
Fix:
```
docker-compose logs db
docker-compose restart db
```
Verify database environment variables.

### Trivy Scan Fails Pipeline
Symptoms: Pipeline stops at security scan.
Fix: Update base images or dependencies. Failure is expected for HIGH/CRITICAL vulnerabilities.

### Old image still running:
Symptoms: Latest changes not reflected.
Fix:
```
docker-compose down
docker-compose pull
docker-compose up -d
```
-------------------------------------------------------------
### 18.Conclusion
This capstone project demonstrates an end-to-end CI/CD pipeline using github actions and Docker to automate the complete workflow from code commit to deployment for a containerized web application. By integrating GitHub actions, optimized Docker builds, automated security scanning, and reliable service deployment, the project follows real-world DevOps practices and validates a stable frontend–backend–database integration in a production-like environment.
-------------------------------------------------------------------------


