FROM python:3.12.7-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    openssh-server \
    curl \
    net-tools \
    iputils-ping \
    vim \
    passwd \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Configure SSH
RUN mkdir /var/run/sshd
# Create user and set password
RUN useradd -ms /bin/bash rayuser && echo "rayuser:raypass" | chpasswd && adduser rayuser sudo

# RUN echo 'rayuser:raypass' | chpasswd
# RUN useradd -ms /bin/bash rayuser && adduser rayuser sudo
RUN echo 'rayuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Enable SSH access for root and rayuser
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Install Ray
RUN pip install -U pip && pip install ray[default]==2.43.0 && pip install debugpy==1.8.0

# Expose Ray and SSH ports
EXPOSE 22 6379 8265

# Optional: Add Ray start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start SSH and optionally Ray
CMD ["/start.sh"]
