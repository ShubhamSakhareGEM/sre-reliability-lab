# SRE Reliability Lab

A complete, local reliability engineering lab simulating a production microservice environment. This project demonstrates core Site Reliability Engineering (SRE) practices including container orchestration, observability, auto-scaling, and chaos engineering.

## Architecture

* **Application:** Node.js Express API exposing Prometheus metrics.
* **Cache:** Redis for simulating backend state/caching.
* **Orchestration:** Kubernetes (Local via `kind`), simulating OpenShift environments.
* **Observability Stack:** Prometheus (Metrics), Grafana (Dashboards), Loki (Logs).
* **Automation:** GitHub Actions (CI) and ArgoCD (GitOps CD).

## Setup Instructions (Mac M1/Apple Silicon)

**Prerequisites:** Docker Desktop (or Colima), `kind`, `kubectl`, `helm`.

1. **Provision the Cluster:**
   ```bash
   make cluster