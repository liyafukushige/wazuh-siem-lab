[incident-report.md](https://github.com/user-attachments/files/32805912/incident-report.md)
# Wazuh SIEM Lab — Incident Report
**By Liya | Personal security project**

**Setup:** I built this lab using two VMs, one running Wazuh (the SIEM manager + dashboard), and one as a target machine with the Wazuh agent installed. Manager IP: `192.168.64.2`. Target IP: `192.168.64.4`.

## What I did

I wanted to see if Wazuh could actually catch a brute-force login attempt, so I simulated one myself. First, I tried logging into the target machine over SSH a few times with the wrong password on purpose. Then I wrote a small bash script (see [`scripts/attack-simulation.sh`](scripts/attack-simulation.sh)) to do it faster: 15 wrong-password attempts in a row, one after another, to mimic what an automated attack would look like.

## What Wazuh caught

It worked. Wazuh picked up every failed login and logged it as an alert. In total, it flagged 85 separate authentication failures. The interesting part was watching it escalate: after a handful of failed logins from the same source in a short time, Wazuh automatically bumped the alert severity up (from level 5 to level 10), which is exactly the kind of behavior you'd want from a real SIEM. Not just logging individual failures, but noticing a *pattern*.

Digging into one of the escalated alerts, I could see exactly what data Wazuh captured:
- Source IP of the "attack": `192.168.64.2`
- Target account: `liya`
- Rule that fired: "User missed the password more than one time" (level 10)
- Raw log line showing the repeated PAM authentication failures

Wazuh also auto-tagged the activity with MITRE ATT&CK techniques: Brute Force (T1110), Password Guessing (T1110.001), and Valid Accounts (T1078). This was a good way to see how a SIEM connects raw logs to actual known attack techniques.

## What I'd recommend if this were real

- Set up fail2ban or similar to auto-block an IP after repeated failures
- Switch SSH to key-based auth instead of passwords
- Add MFA for remote logins
- Set up real-time alerting so a level-10 event actually notifies someone right away
- Double-check the targeted account wasn't actually compromised (no successful logins right after the failed ones)

## Tools used
Wazuh SIEM (v4.14.7), Ubuntu Server 26.04 LTS, UTM (virtualization), bash/SSH

Setup steps are documented in [`docs/wazuh-agent-setup.md`](docs/wazuh-agent-setup.md).
