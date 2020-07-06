# SingleWebServerDeployment - A easy way to create a web server using ansible


It was tested with:
-  KVM servers + CentOS 8 minimal.


## Overview
- Nginx
- Mysql8
- PHP74, PHP73, PHP71
- Logrotate
- Domain
- Shorewall (firewall)
- Certbot (SSL)
- Rsyslog
- Phpmyadmin
- Composer tool

## How to setup

On this setup we use user "root" to manage the servers (you can use ssh key or another user)

#### 1. Install "ansible" on Master server
```
$ yum install ansible
```

#### 2. Clone the repo in your /etc/ansible

#### 3. Generate SSH key from Ansible (skip if you have)

```sh
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

#### 4. Copy the ssh key to server

```
$ ssh-copy-id root@192.168.1.101

```

#### 1. Prepare the config

```
# inventory 

$ vim inventory/single

$ vim playbooks/vars/setup-server-vars.yml

```

### Notes: 

Remember to modify the variables with your data!!!


#### 2. Start the SETUP

```
$ ansible-playbook playbooks/setup-server-vars.yml
```