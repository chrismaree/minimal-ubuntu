FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        wget \
        curl \
        git \
        python3 \
        python3-pip \
        python3-venv \
        neofetch \
        zsh \
        tmux \
        fonts-powerline \
        openssh-client

# Install Oh My Zsh (non-interactive)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true

# Install ttyd
RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

# Add neofetch to shells
RUN echo "neofetch" >> /root/.bashrc && \
    echo "neofetch" >> /root/.zshrc

# Expose default ttyd port (Railway uses env var at runtime)
EXPOSE 7681

# Debug: optional credential dump (can remove if not needed)
RUN echo $CREDENTIAL > /tmp/debug || true

# Final startup script
CMD /bin/bash -c "\
    mkdir -p /root/.ssh && \
    echo \"$SSH_KEY\" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    echo 'Host *\n  StrictHostKeyChecking no' > /root/.ssh/config && \
    /bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"
