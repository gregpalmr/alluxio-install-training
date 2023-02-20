# alluxio-install-training

### A Docker compose environment for use with installing Alluxio with S3 compatible storage, HA configuration and with Trino and Spark integration

---

## INTRO

This git repo provides a Docker environment used for learning how to install Alluxio Enterprise Edition with multiple masters for HA, with multiple workers and integrated with an S3 compatibile root under file system (UFS). Additionally, this training sandbox allows the integration with:

- Alluxio - to be installed
- Trino - pre-installed, but not integrated with Alluxio
- Hive metastore - pre-installed, but not integrated with Alluxio
- Spark - pre-installed, but not integrated with Alluxio
- Prometheus - pre-installed, but not integrated with Alluxio
- Grafana - pre-installed, but not integrated with Alluxio

Finally, this training sanbox allows the setup of TLS encryption of Alluxio processes using the Alluxio Enterprise Edition TLS encryption. 

## USAGE

### Step 1. Install Docker desktop 

Install Docker desktop on your laptop, including the docker-compose command.

     See: https://www.docker.com/products/docker-desktop/

### Step 2. Clone this repo

Use the git command to clone this repo (or download the zip file from the github.com site).

     git clone https://github.com/gregpalmr/alluxio-install-training

     cd alluxio-install-training

### Step 3. Launch the docker containers.

Launch the containers defined in the docker-compose.yml file using the command:

     docker-compose up -d

The command will create the network object and the docker volumes, then it will take some time to pull the various docker images. When it is complete, you see this output:

     $ docker-compose up -d
     Creating network "alluxio-install-training_custom" with driver "bridge"
     Creating volume "alluxio-install-training_keystore" with local driver
     Creating volume "alluxio-install-training_mariadb-data" with local driver
     Creating volume "alluxio-install-training_minio-data" with local driver
     Creating volume "alluxio-install-training_alluxio-data" with local driver
     Creating spark-master     ... done
     Creating create-tls-certs ... done
     Creating minio            ... done
     Creating spark-worker     ... done
     Creating mariadb          ... done
     Creating hive-metastore       ... done
     Creating trino-coordinator    ... done
     Creating alluxio-worker-1     ... done
     Creating alluxio-worker-2     ... done
     Creating minio-create-buckets ... done
     Creating alluxio-master-3     ... done
     Creating alluxio-master-2     ... done
     Creating alluxio-master-1     ... done
     
### Step 4. Access the Alluxio Master Nodes

This package deploys three Alluxio master node containers and two worker node containers, but it does NOT install or start the Alluxio master and worker processes. This is so you can practice installing Alluxio masters and workers and manually configuring and starting/restarting the daemons.

To access the Alluxio master node containers, use these commands:

     docker exec -it alluxio-master-1 bash
     docker exec -it alluxio-master-2 bash
     docker exec -it alluxio-master-3 bash

To access the Alluxio worker node containers, use these commands:

     docker exec -it alluxio-worker-1 bash
     docker exec -it alluxio-worker-2 bash

### Step 5. Install Alluxio with a single master (no HA) 

     TBD

### Step 6. Install Alluxio with a three masters (HA) 

     TBD

### Step 7. Configure Trino to integrate with Alluxio

     TBD

### Step 8. Configure Spark to integrate with Alluxio

     TBD

### Step 9. Configure Alluxio with "northbound" Kerberos integration

     TBD

### Step 10. Configure Alluxio with TLS encryption

     TBD

### Step 11. Configure Alluxio with encryption at rest

     TBD

### Step 12. Configure Alluxio with Prometheus for collecting and storing Alluxio Metrics

     TBD

### Step 13. Configure Alluxio with Grafana for displaying Alluxio Metrics

     TBD

---

Please direct comments or questions to greg.palmer@alluxio.com

