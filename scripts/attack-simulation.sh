#!/bin/bash
# Simulated SSH brute-force attack for Wazuh SIEM detection testing

TARGET_USER="liya"
TARGET_HOST="192.168.64.4"

for i in $(seq 1 15); do
  sshpass -p "wrongpass$i" ssh -o StrictHostKeyChecking=no "$TARGET_USER@$TARGET_HOST" exit
  sleep 1
done
