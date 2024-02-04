#!/bin/bash

# Disable UFW
echo "Disabling UFW..."
sudo ufw disable

# Update and upgrade packages
echo "Updating and upgrading packages..."
# sudo apt-get update && sudo apt-get upgrade -y

# Install socat, curl, and git
echo "Installing socat, curl, and git..."
sudo apt install socat curl git -y

# Clone the Marzban-node repository
echo "Cloning Marzban-node repository..."
git clone https://github.com/Gozargah/Marzban-node && cd Marzban-node

# Install Docker
echo "Installing Docker..."
# curl -fsSL https://get.docker.com | sh

# Create directory for Marzban-node and add the SSL client certificate
echo "Creating directory for Marzban-node and adding SSL client certificate..."
sudo mkdir -p /var/lib/marzban-node/
echo "-----BEGIN CERTIFICATE-----
MIIEnDCCAoQCAQAwDQYJKoZIhvcNAQENBQAwEzERMA8GA1UEAwwIR296YXJnYWgw
IBcNMjQwMTI4MTQyNTAxWhgPMjEyNDAxMDQxNDI1MDFaMBMxETAPBgNVBAMMCEdv
emFyZ2FoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAnYp34olKNzi9
oR/XNfUZJg/msUGB74Y0+Ap1L9rJG2Zo7tP6PYHdN619Sb1Wp3WZk01Q+pmETO0E
rtS3/7Kg+HWdrZy4o1EYtfybwIsB0HUqolwPxl5RBpJ5Uij4XypbZVOqq8GPajGC
m+WYw1lgIBSGFRvMgXNYoFwONhZHHmYHwX2w+obk7LyM2xo3Ww4uhRy6v83Iecbp
P91DTZ3AWysVYcXE74rAlztnSasDoU08hYlZmwBA/S4jMj4bAj+RwnTa+DuJlZB3
M39axdO0L7d8Nk/R1X7UGrDpqH+gFpmhkC3tqUo73CkjBcbSHFZuCSY4f9fFy8n7
qdEoDcT9OOqZrvK07beR56S7GRtDbNN8cfpO8Dj8yUkKP7mcsCjND6sSqGhWgIMr
JTF9xTYJnsTU6B3/GX22AC15L8csQpC/6djDFKJTbtzzXW5QC6cJfHTZnX/Z9epV
koVe0VOT32eK1sHkr9YmYULcqhwB1Xmr6PjSguWQykqhjDoGWLKdfmjgBStfz9UX
6PLTJwaiZuqr09HWxodYxcqiuwpQsKrRXnHj0OygGJa7hB9NFLUXO1fkGip7AvvX
3ijBHJ3DisivTiKM4QCSwHjt7dMn/Cmo7242PnE7TUQdKBMT2oK2ZlYwk0slRkx3
JwLeXyBXWDJKZmdanocHHpfeB19GrhcCAwEAATANBgkqhkiG9w0BAQ0FAAOCAgEA
EB7wHAPTU6TIA2fAT+i2GxddF6gLn64ImydCbbKQaBI/Ga/yC/hPY5guF5dQmrnd
/mGo0PtGzfGpDgdc/0GkZ4iwdCtQ4CX0Gl5/ZbiOmP+LCvW13s8yCY9Prujtuqun
UWujsk0P85YPkf3PAfGD/ykN8UzpVEKCIVAu1x1W8MiwgBlFKBYkIyFqFlC0EGpA
vwhMc9yWYkz1UwL5mTdjIETGWfj12Y5DMADfMluZ9DcUlhh6OWlBefCdzT59bXNP
BZ4CZ4M3+Jb6YLMHFjcG0U6kressI4CmcGBmCGUZxbObeMtQaEicnFAkQs02rx4m
imCavD4yTQZ/71AIsjfZG7cXSd/6MB2ZJzGv/UaCFzHANBMjXPnkbolBdf1SVhGx
K3koiq0wClCIPdIjwCxZXljD48ixN4S1QT7aS/R9VfHo8JoX9+xbZvLecxIVPKgl
Jy99LfXinEu+AdzH2dgsmzlxCUAFs03uToIQDvqwaHarWUoSmgDIjX/ZdVIXhvsR
nDoNs9llUMcsyTWDo72MEWuWHK3VopPvQLipLrv0Tq93em4iboGCT3kXyxsdWuQL
XGevbdnD/vzyDke7CPvCAu3XbhJBy8VsweWvubZZC6vKEtgx4C/laH57rJ1oKXxy
Af1LcFSh8vu6K5GLpI5XF/+rw6tq0TTsUxYx5Fg/3TQ=
-----END CERTIFICATE-----" | sudo tee /var/lib/marzban-node/ssl_client_cert.pem

# Uncomment SSL_CLIENT_CERT_FILE line in docker-compose.yml
echo "Modifying docker-compose.yml..."
sed -i '/SSL_CLIENT_CERT_FILE/s/^# //' docker-compose.yml

# Start Docker Compose
echo "Starting Docker Compose..."
sudo docker compose up -d
