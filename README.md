# Wazuh SIEM Lab

Personal security-monitoring lab built to get hands-on SIEM experience for cybersecurity/GRC roles.

## What's in this repo
- [`incident-report.md`](incident-report.md) — full writeup of the simulated attack and what Wazuh detected
- [`scripts/attack-simulation.sh`](scripts/attack-simulation.sh) — the bash script used to simulate a brute-force SSH attack
- [`docs/wazuh-agent-setup.md`](docs/wazuh-agent-setup.md) — steps used to install and connect the Wazuh agent

## Summary
Deployed Wazuh SIEM across two VMs (manager + monitored endpoint), simulated an SSH brute-force attack, and analyzed the resulting alerts. Wazuh detected 85 authentication-failure events, auto-escalated severity as it correlated repeated failures, and mapped the activity to MITRE ATT&CK techniques (Brute Force, Password Guessing, Valid Accounts).
