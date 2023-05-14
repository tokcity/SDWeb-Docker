# Use the Debian 11 image as the base
FROM debian:bullseye-slim

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y wget git python3 python3-venv sudo ffmpeg libsm6 libxext6 google-perftools

# Create the stablediffusion user and set their home directory
RUN useradd -m -d /home/stablediffusion -s /bin/bash stablediffusion

# Download webui.sh and set permissions
USER stablediffusion
WORKDIR /home/stablediffusion
RUN wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh && \
    chmod +x webui.sh
