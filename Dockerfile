# Use the Ubuntu latest image as the base
FROM ubuntu:latest

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y wget git python3 python3-venv sudo

# Create the stablediffusion user and set their home directory
RUN useradd -m -d /home/stablediffusion -s /bin/bash stablediffusion

# Download webui.sh, set permissions, and run it as stablediffusion
USER stablediffusion
WORKDIR /home/stablediffusion
RUN wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh && \
    chmod +x webui.sh