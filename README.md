## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](Scripts/blob/main/Images/Cloud_Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible folder may be used to install only certain pieces of it, such as Filebeat.

  - LNKitchell/Scripts/Ansible/install_elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly stable, in addition to restricting access to the network. Use of Load Balancer with appropriate health probes can help protect against DDoS attacks by shutting down overloaded servers while still maintaining good connections so there is no interruption for end users.   

Integrating an ELK server allows user to easily monitor the vulnerable VMs for changes to the data and system logs.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.5   | Linux            |
| web-1    | DVWA     | 10.0.0.6   | Linux            |
| web-2    | DWVA     | 10.0.0.7   | Linux            |
| elk-vm   | Monitor  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the jumpboxprovisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-70.176.78.185

Machines within the network can only be accessed by an ansible container within the jump box with appropriate SSH keys.
-10.0.0.5

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 70.176.78.185        |
| VN       | No                  | 10.0.0.5             |
| elk-vm   | No                  | 70.176.78.185         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous not only to save time but also reduce the amount of human error.

The playbook implements the following tasks:
- Uses sysctl to increase memory
- Installs: docker.io, python3-pip, and docker python pip module
- Download and install the container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](Scripts/blob/main/Images/docker_ps_elk_install_success.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- web-1 @10.0.0.6
- web-2 @10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat is a log management tool. It collects the logs files and sends them to Elasticsearch
- Metricbeat is used for monitoring. It collects metrics from your system and services.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to the Ansible container on the jumpboxprovisioner.
- Update the Ansible hosts file to include a header indicating a grouping of machine called "elk" and insert the IP address under elk
- Run the playbook, and navigate to the elk-vm to check that the installation worked as expected.

- URL to navigate to in order to check that the ELK server is running
   - http://40.65.196.66:5601/app/kibana
