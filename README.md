# Wazuh SIEM Lab — Incident Detection Project

Personal security-monitoring lab built to gain hands-on SIEM experience for cybersecurity/GRC roles.

## What I Built
- Deployed a Wazuh SIEM (manager + dashboard) on one virtual machine
- Connected a second VM as a monitored endpoint running the Wazuh agent
- Simulated an SSH brute-force attack against the endpoint (manual attempts + a scripted rapid-fire attempt loop)
- Investigated the resulting alerts in the Wazuh dashboard, analyzing rule severity, source IPs, and MITRE ATT&CK mappings
- Documented findings and remediation recommendations in a formal incident report

## Tools Used
- Wazuh SIEM (v4.14.7)
- Ubuntu Server 26.04 LTS
- UTM (virtualization)
- SSH / bash scripting

## Results
- 85 authentication-failure alerts generated and correctly classified
- Wazuh automatically escalated alert severity (level 5 → 10) upon detecting repeated failed logins from the same source
- Mapped activity to MITRE ATT&CK techniques: Brute Force (T1110), Password Guessing (T1110.001), Valid Accounts (T1078)

## Full Report
See `Wazuh_SIEM_Incident_Report.pdf` in this repo for the complete write-up, including log evidence and remediation recommendations.
