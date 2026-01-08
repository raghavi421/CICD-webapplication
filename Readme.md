             **CI/CD Pipeline for Dockerized Web Application**

**Project Overview**

This project demonstrates a complete **end-to-end CI/CD pipeline** for a simple **2-tier web application** using **Docker** and **GitHub Actions**. 
The pipeline automatically:
* Builds Docker images
* Runs basic tests
* Performs container security scanning
* Pushes images to Docker Hub
* Deploys the application to a **staging environment** using Docker Compose

---

 **Architecture**

**Application Architecture**

```
Browser
   |
Frontend (Nginx + Static HTML)
   |
Backend (Flask API)
   |
PostgreSQL Database
```

 **CI/CD Flow**

```
Developer Push → GitHub
        ↓
GitHub Actions CI
        ↓
Build Docker Images
        ↓
Run Tests
        ↓
Security Scan (Trivy)
        ↓
Push Images to Docker Hub
        ↓
Deploy to Staging Server
```

---

 **Project Structure**

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

**Technology Stack**

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




