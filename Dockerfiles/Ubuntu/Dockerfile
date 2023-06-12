FROM docker.io/library/ubuntu:20.04

# Install required packages and clean up the package manager cache
RUN apt-get update && apt-get install -y openssh-server && apt-get clean all

# Copy the SSH public key and configure SSH
COPY .ssh/ansible-mssql.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys \
    && chmod 700 /root/.ssh \
    && sed -i 's/#PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config

# Start init as the default command
CMD ["/sbin/init", "-D"]
