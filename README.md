<div align="center">

# 🚀 Capstone Project 1 — DevOps Lifecycle Implementation

![Status](https://img.shields.io/badge/status-completed-brightgreen)
![Terraform](https://img.shields.io/badge/IaC-Terraform-844FBA?logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?logo=ansible&logoColor=white)
![Jenkins](https://img.shields.io/badge/CI%2FCD-Jenkins-D24939?logo=jenkins&logoColor=white)
![Docker](https://img.shields.io/badge/Containers-Docker-2496ED?logo=docker&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS%20EC2-FF9900?logo=amazonaws&logoColor=white)

</div>

---

## 📌 Project Overview

This project demonstrates the implementation of a complete DevOps Lifecycle for a product-based company using modern DevOps tools and practices.

The objective was to automate infrastructure provisioning, configuration management, CI/CD pipelines, containerization, and production deployment.

The application source code was provided by the company and hosted on GitHub.

---

## 🏢 Company Scenario

You have been hired as a **Senior DevOps Engineer** at **Abode Software**.

The company wanted to implement a complete DevOps lifecycle for their application as quickly as possible.

The application source code was provided through:

> 🔗 https://github.com/hshar/website.git

---

## 🏗️ Architecture

```text
Developer
    │
    │ Git Push
    ▼
GitHub Repository
(main / develop branches)
    │
    ▼
Jenkins Master Server
    │
    ├── Job1: Build
    │       Docker Build
    │
    ├── Job2: Test
    │       Container Testing
    │
    └── Job3: Production Deployment
            │
            ▼
    Production Server
            │
            ▼
      Docker Container
            │
            ▼
      Live Application
```

---

## ⚙️ Tools Used

| Tool | Purpose |
|:--|:--|
| 🖥️ **AWS EC2** | Infrastructure Hosting |
| 🏗️ **Terraform** | Infrastructure Provisioning |
| ⚙️ **Ansible** | Configuration Management |
| 🔀 **Git & GitHub** | Version Control |
| 🔄 **Jenkins** | Continuous Integration & Continuous Delivery |
| 🐳 **Docker** | Containerization |
| 🐧 **Linux** | Server Administration |

---

## 🏗️ Infrastructure Provisioning

Infrastructure was provisioned using **Terraform**.

Three EC2 instances were created:

| Server | Purpose |
|:--|:--|
| 🧩 **Jenkins Master** | CI/CD Server |
| 🧪 **Developer Server** | Build and Testing |
| 🌐 **Production Server** | Production Deployment |

Terraform also managed:

- ✅ Security Groups
- ✅ Networking Rules
- ✅ SSH Access
- ✅ EC2 Configuration

---

## 🔧 Configuration Management

**Ansible** was used to configure all servers automatically.

<table>
<tr>
<th>🧩 Jenkins Server</th>
<th>🧪 Developer Server</th>
<th>🌐 Production Server</th>
</tr>
<tr>
<td>

- Jenkins
- Java 21
- Docker
- Git

</td>
<td>

- Docker
- Git

</td>
<td>

- Docker
- Git

</td>
</tr>
</table>

---

## 🌳 Git Workflow

The following Git workflow was implemented:

### 🌿 Develop Branch

```text
Commit → Build → Test
```

> No deployment to production occurs.

### 🌳 Main Branch

```text
Commit → Build → Test → Deploy to Production
```

> Production deployment only occurs after successful testing.

---

## 🐳 Docker Implementation

The application was containerized using Docker.

Docker image build process:

```text
Source Code
    ↓
Docker Build
    ↓
Docker Image
    ↓
Testing Container
    ↓
Production Deployment
```

Dockerfile used:

```dockerfile
FROM hshar/webapp

COPY . /var/www/html/
```

---

## 🔄 Jenkins Pipeline

The Jenkins Pipeline was divided into three jobs:

### 🥇 Job 1 — Build

- Clone repository
- Build Docker image

### 🥈 Job 2 — Test

- Start test container
- Perform application health checks
- Remove temporary container

### 🥉 Job 3 — Production

- Deploy Docker image to production server
- Replace old container
- Start new production container

---

## 📊 CI/CD Workflow

```text
Git Push
   ↓
GitHub Repository
   ↓
Jenkins Trigger
   ↓
Build Stage
   ↓
Test Stage
   ↓
Production Deployment
```

---

## 📸 Project Screenshots

<details>
<summary><strong>🏗️ Infrastructure</strong></summary>

- EC2 Instances
- Terraform Apply Output

</details>

<details>
<summary><strong>🔧 Configuration Management</strong></summary>

- Ansible Playbook Execution
- Jenkins Installation
- Docker Installation

</details>

<details>
<summary><strong>🔄 CI/CD Pipeline</strong></summary>

- Jenkins Dashboard
- Successful Pipeline Execution
- Build Stage
- Test Stage
- Production Stage

</details>

<details>
<summary><strong>🚀 Deployment</strong></summary>

- Running Application
- Production Website

</details>

---

## 📂 Repository Structure

```text
capstone-project-1-devops-lifecycle
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── ansible/
│   ├── inventory
│   ├── install-jenkins.yml
│   └── install-docker.yml
│
├── Dockerfile
├── Jenkinsfile
├── index.html
├── screenshots/
└── README.md
```

---

## ⚠️ Challenges Faced

<table>
<tr>
<td width="50%" valign="top">

### ❌ Jenkins Startup Failure

**Problem:**
```text
Jenkins required Java 21 while Java 17 was installed.
```

**Solution:**
- Upgraded Jenkins server to Java 21.

</td>
<td width="50%" valign="top">

### ❌ GitHub Push Failure

**Problem:**
```text
Terraform provider binaries exceeded GitHub's 100MB limit.
```

**Solution:**
- Removed `.terraform` directory.
- Added `.gitignore`.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### ❌ Production Deployment Failure

**Problem:**
```text
Jenkins was unable to reach the Production Server using public IP.
```

**Solution:**
- Production deployment was switched to private IP communication.

</td>
<td width="50%" valign="top">

### ❌ GitHub Authentication Failure

**Problem:**
```text
Jenkins could not clone the repository using SSH.
```

**Solution:**
- Generated Jenkins SSH key.
- Added public key to GitHub SSH settings.

</td>
</tr>
</table>

---

## ✅ Assignment Requirements Mapping

| Requirement | Status |
|:--|:--:|
| Configuration Management Tool | ✅ |
| Git Workflow | ✅ |
| Build on Develop Branch | ✅ |
| Deploy on Main Branch | ✅ |
| Docker Containerization | ✅ |
| Jenkins Pipeline | ✅ |
| Build Job | ✅ |
| Test Job | ✅ |
| Production Job | ✅ |

---

## 🎯 Final Outcome

Successfully implemented an end-to-end DevOps lifecycle using:

`Terraform` · `Ansible` · `Git` · `GitHub` · `Jenkins` · `Docker` · `AWS EC2`

The project demonstrates Infrastructure as Code, Configuration Management, Continuous Integration, Continuous Testing, and Continuous Deployment using modern DevOps practices.

---

<div align="center">

## 👨‍💻 Author

**Anshu Sharma**
*Cloud & DevOps Engineer*

[![GitHub](https://img.shields.io/badge/GitHub-anshu--sharma--devops-181717?logo=github&logoColor=white)](https://github.com/anshu-sharma-devops)

</div>