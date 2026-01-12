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
---
1. Frontend
   * Static HTML-based web application
   * Acts as the user interface for the system
   * Displays:
           * Application health status
           * Database connection status
           * Total record count
           * Employee data table
 2. backend
    * RESTful API developed using Flask
    * Provides endpoints:
               /health – application health
               /db-status – database status and employee records
    * Uses environment variables for database connection
3. database
   * PostgreSQL container
   * Stores employee records
   * Persistent volume for data durability
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
git clone https://github.com/PavanSPK/cicd-capstone.git
cd cicd-capstone
```
### Step 2: Pull Docker Images
```
docker pull spk487/cicd-backend:latest
docker pull spk487/cicd-frontend:latest
```
### Step 3: Run Application
```
docker-compose up -d
```
### Step 4: Verify Application

- Frontend UI: http://localhost
- Backend API: http://localhost:5000
- Health Endpoint: http://localhost:5000/health

**Docker Implementation**

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

** Environment Configuration**

 **`.env` (Local Development)**

```
DB_HOST=db
DB_NAME=appdb
DB_USER=postgres
DB_PASSWORD=postgres
```

 **`.env.staging`**

```
DB_HOST=db
DB_NAME=appdb
DB_USER=postgres
DB_PASSWORD=postgres
DOCKERHUB_USERNAME=praghavi123
```

---

 **Local Development**

**Start Application Locally**

```bash
docker compose up --build
```

**Access Application**

* Frontend: [http://localhost:8080](http://localhost:8080)
* Backend: [http://localhost:5000](http://localhost:5000)
  output:![backend output](https://github.com/raghavi421/CICD-webapplication/blob/20ed083ed2d7f940675391cd6f31d77214203df6/images/backend%20output.png)
* Health Check: [http://localhost:5000/health](http://localhost:5000/health)

---

**CI/CD Pipeline (GitHub Actions)**

 **Pipeline Stages**

1. Checkout code
2. Build Docker images
3. Run container tests
4. Scan images using Trivy
5. Push images to Docker Hub
6. Deploy to staging environment

 **Required GitHub Secrets**

```
DOCKER_USERNAME
DOCKER_PASSWORD
```

---

 **Staging Deployment**

 **Deploy Manually**

```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

**Verify Deployment**

```bash
chmod +x scripts/verify.sh
./scripts/verify.sh
```

---

 **Troubleshooting**

 **Frontend Not Loading**

* Ensure port `8080:80` is exposed
* Check frontend container status

 **Docker Image Pull Errors**

* Verify DockerHub username
* Run `docker login`

 **Pipeline Fails at Login**

* Ensure GitHub secrets are set correctly

---




