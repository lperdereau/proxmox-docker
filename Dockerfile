FROM debian:latest


RUN apt update && \
    apt install -y wget

RUN wget https://enterprise.proxmox.com/debian/proxmox-release-trixie.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-trixie.gpg

COPY pdm.sources pve.sources /etc/apt/sources.list.d/

RUN apt update && \
    apt install -y proxmox-datacenter-manager-client && \
    ln -s $(which proxmox-datacenter-manager-client) /usr/bin/pdmc

CMD ["pdmc"]
