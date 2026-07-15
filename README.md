# DEMOAI Agent

Oracle Autonomous Database 26ai vector-search and agentic AI demonstration.

## Architecture

- Mac for development
- Private Git repository for source control
- OCI Compute for demonstration and agent runtime
- Autonomous AI Database 26ai for SQL and vector search
- OCI Object Storage for ONNX models, PDFs and larger data
- OCI instance principals for service authentication

## Repository layout

- `app/` — Python application and agent
- `sql/admin/` — scripts run as Autonomous Database `ADMIN`
- `sql/demo/` — scripts run as the `DEMO` application schema
- `scripts/` — workstation and server automation
- `data/sample/` — safe demonstration datasets
- `docs/` — architecture and runbooks

## Security

Do not commit:

- passwords
- `.env`
- database wallets
- OCI API keys
- SSH private keys
- ONNX binaries
- confidential datasets
