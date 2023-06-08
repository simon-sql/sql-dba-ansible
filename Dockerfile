FROM quay.io/centos/centos:stream8

# Install required packages and clean up the package manager cache
RUN dnf install -y openssh-server && dnf clean all

# Copy the SSH public key and configure SSH
COPY .ssh/ansible-mssql.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys \
    && chmod 700 /root/.ssh \
    && sed -i 's/#PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config

# Start SSH server as the default command
CMD ["/sbin/init", "-D"]

