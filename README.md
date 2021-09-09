# ASU_File_13
These files have been used to deploy an ELK stack on Azure.
Automated ELK Stack Deployment - [Bill Sienko]
The files in this repository were used to configure the network depicted below.
https://drive.google.com/file/d/1fSATzEnOWbi1Owj5XgWcOvtERKUqBIN3/view?usp=sharing <Network_Diagram_Project_1>

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

#ELK Stack playbook file: install-elk.yml
---
- name:  Configure Elk VM with Docker
  hosts:  elk
  remote_user:  azdmin
  become:  true
  tasks:

    # Use apt module
    - name:  Install docker.io
      apt:
        update_cache:  yes
        force_apt_get:  yes
        name:  docker.io
        state:  present

    # Use apt module
    - name:  Install python3-pip
      apt:
       force_apt_get:  yes
       name:  python3-pip
       state:  present

    # Use pip module (It will default to pip3)
    - name:  Install Docker module
      pip:
       name:  docker
       state:  present

    #  Use sysctl module
    - name: Use more memory
      sysctl:
        name:  vm.max_map_count
        value:  "262144"
        state:  present
        reload:  yes

    # Use docker_container module
    - name:  download and launch a docker elk container
      docker_container:
        name:  elk
        image:  sebp/elk:761
        state:  started
        restart_policy:  always
        # Please list the ports that ELK runs on
        published_ports:
         -  5601:5601
         -  9200:9200
         -  5044:5044

    # Use systemd module
    - name:  Enable service docker on boot
      systemd:
        name:  docker
        enabled:  yes

#This document contains the following details:
Description of the Topology
Access Policies
ELK Configuration
Beats in Use
Machines Being Monitored
How to Use the Ansible Build

#Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load Balancers offer the ability to help prevent Directed Denial of Service Attacks by shifting attack traffic to a public cloud provider instead of the corporate server. (www.computerweekly.com/blog/Quocirca-Insights/Load-Balancing-for-security)
A Jump Box provides the network an advantage by serving as a designated entry point to a network within a security zone on the perimeter of the network being protected. (en.Wikipedia.org/wiki/Jump_server).
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file and system .
  Filebeat: Filebeat monitors the log files, collects log events, and forwards them to Elasticsearch for indexing.  Filebeat is also known as a lightweight shipper that periodically collects file log information and sends it to a server for analysis.  (www.elastic.co)
  Metricbeat: Metricbeat is also a lightweight shipper that periodically collects metrics from the operating system and from services running on the server.  Metricbeat takes the metrics and statistics that it collects and ships them to Elasticsearch. (www.elastic.co)

The configuration details of each machine may be found below. 
Name          |   Function                     |  IP Address   |   Operating System  |
--------------|--------------------------------|---------------|---------------------|
Jump Box      |   Gateway                      |  10.0.0.1     |   Linux             |
Web-1         |   Web server                   |  10.0.0.8     |   Linux             |
Web-2         |   Web server                   |  10.0.0.9     |   Linux             |
Web-3         |   Web server                   |  10.0.0.10    |   Linux             |
ELK VM        |   Monitoring Virtual Machine   |  10.1.0.4     |   Linux             |

#Access Policies
The machines on the internal network are not exposed to the public Internet.
Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
172.248.215.95
Machines within the network can only be accessed by the Jump Box and the ELK Virtual Machine.
The ELK VM is only accessible from my home client at 172.248.215.95.
A summary of the access policies in place can be found in the table below.
Name      |   Publicly Accessible   |   Allowed IP Addresses   |
----------|-------------------------|--------------------------|
Jump Box  |   No                    |   172.248.215.95         | 
ELK VM    |   No                    |   172.248.215.95         |


#Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
The main advantage of utilizing an automated ansible configuration is the ability to leverage a viable, working solution - saving time and effort.
The playbook implements the following tasks:
1.Install Docker
2.Install Python
3.Request and Allocate additional memory
4.Download and launch a Docker ELK Container (Elasticsearch, Logstash, Kibaba)
5.Enable Service - Docker to start on boot
The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.
<ELK_ScreenShot1.jpg> <ELK_ScreenShot2.jpg>

#Target Machines & Beats
This ELK server is configured to monitor the following machines:
Machines being monitored (Web servers):
 Web-1 (10.0.0.8)
 Web-2 (10.0.0.9)
 Web-3 (10.0.0.10)
We have installed the following Beats on these machines:
Beats installed on the Web Servers:
 Filebeat
 Metricbeat
These Beats allow us to collect the following information from each machine:
 Filebeat allows you to monitor the file system on your server by forwarding and centralizing logs and files in a lightweight, efficient way.
 Metricbeat allows you to monitor the metric data captured on your server by periodically collecting metrics from the operating system and from services running on your server. (esastic.co/guide/en/beats/metricbeat/7.14/metricbeat-overview.html)

#Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
SSH into the control node and follow the steps below:
Copy the playbook file to the Ansible container.
Update the hosts file to include IP addresses of the servers in the network.
Run the playbook, and navigate to the internal network servers to check that the installation worked as expected.

#Answer the following questions to fill in the blanks:
Which file is the playbook? The playbook file contains instructions to download images and install images to the servers.
Where do you copy it?  Copy the playbook to the Ansible container in the /etc/ansible directory.
Which file do you update to make Ansible run the playbook on a specific machine?  The hosts file
How do I specify which machine to install the ELK server on versus which to install Filebeat on?
In your hosts file, create a header section for [webservers] with the IPs to install filebeat to and a header section for [ELK] with the internal IP of your ELK VM.
_Which URL do you navigate to in order to check that the ELK server is running?  http://20.65.15.207:5601/app/kibana

#As a Bonus, provide the specific commands the user will need to run to download the playbook, update the files, etc.
To download the ELK playbook:
# ansible-playbook install-elk.yml

To download filebeat
# ansible-playbook filebeat-playbook.yml

To download metricbeat
# ansible-playbook metricbeat-playbook.yml

To update the files:
# sudo nano hosts
# sudo nano filebeat-config.yml
# sudo nano metricbeat-config.yml
