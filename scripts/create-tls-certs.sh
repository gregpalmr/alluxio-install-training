#!/bin/bash
#
# SCRIPT: create-tls-certs.sh
#

  certs_dir=/alluxio/certs
  store_password="changeme123"

  echo "Creating SSL keys for masters"
  if [ -d $certs_dir ];
  then
    \rm -rf $certs_dir/*
  fi

  # Create the "Subject Alternative Name" (SAN) field
  san=""
  for fqdn in $(cat /opt/alluxio/conf/masters /opt/alluxio/conf/workers)
  do
    if [[ ${san} == "" ]];
    then
      san='dns:'${fqdn}
    else
      san=${san}',dns:'${fqdn}
    fi
  done
  echo "Using Subect Alternative Names (SAN): " ${san}

  # Generate the keystore and certificate
  keytool -genkeypair -keypass ${store_password} -storepass ${store_password}  \
       -keyalg RSA -keysize 2048 \
       -alias all-alluxio-nodes \
       -dname "CN=all-alluxio-nodes, OU=Alluxio, L=San Mateo, ST=CA, C=US" -ext san=${san} \
       -keystore ${certs_dir}/all-alluxio-nodes-keystore.jks

  # Export the certificate’s public key to a certificate file
  keytool -export -rfc -storepass ${store_password} \
       -alias all-alluxio-nodes \
       -keystore ${certs_dir}/all-alluxio-nodes-keystore.jks \
       -file ${certs_dir}/all-alluxio-nodes.cert

  # Import the certificate’s public key to a truststore file
  keytool -import -noprompt -storepass ${store_password} \
       -alias all-alluxio-nodes \
       -file  ${certs_dir}/all-alluxio-nodes.cert \
       -keystore ${certs_dir}/all-alluxio-nodes-truststore.jks

chmod 440 ${certs_dir}/*.jks ${certs_dir}/*.cert
chmod 444 ${certs_dir}/all-alluxio-nodes-truststore.jks

# List the contents of the trustore file
echo; echo
echo "Contents of trust store file: ${certs_dir}/all-alluxio-nodes-truststore.jks"
echo "(this file will be used by Alluxio client applications to connect to Alluxio daemons)"
echo
keytool -list -v -keystore ${certs_dir}/all-alluxio-nodes-keystore.jks -storepass $store_password 

# end of script 
