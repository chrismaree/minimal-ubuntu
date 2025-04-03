FROM ubuntu:22.04

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
        fonts-powerline

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

RUN echo "neofetch" >> /root/.bashrc && \
    echo "neofetch" >> /root/.zshrc

EXPOSE $PORT

RUN echo $CREDENTIAL > /tmp/debug

# CMD: Setup SSH key from env and start ttyd with bash
CMD ["/bin/bash", "-c", "\
  mkdir -p /root/.ssh && \
  echo \"$SSH_KEY\" > /root/.ssh/id_rsa && \
  chmod 600 /root/.ssh/id_rsa && \
  echo 'Host *\\n  StrictHostKeyChecking no' > /root/.ssh/config && \
  /bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]
