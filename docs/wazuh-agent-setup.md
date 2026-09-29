# Wazuh Agent Setup

Steps used to install and connect the Wazuh agent on the monitored endpoint.

## 1. Download the agent package

wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.14.7-1_arm64.deb


## 2. Install the agent, pointing it at the manager

sudo WAZUH_MANAGER='192.168.64.2' dpkg -i ./wazuh-agent_4.14.7-1_arm64.deb


## 3. Enable and start the agent service

sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent


## 4. Verify connection
Checked agent status on the manager's dashboard under Agents management > Summary — confirmed the endpoint showed as "Active."
