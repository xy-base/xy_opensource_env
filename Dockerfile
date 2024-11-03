
ARG xy_ubuntu_version=24.04
FROM ubuntu:${xy_ubuntu_version}

ARG xy_base_version=1.0
LABEL name="xy_base"
LABEL version="${xy_base_version}"
LABEL description="xy_base"
ENV xy_base "${xy_base_version}"
ARG username="xy_base"
ARG password="abc1236547890"
ARG groupname="xy_base"
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt update
RUN apt -y upgrade
RUN apt install -y ca-certificates
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./sources.list /etc/apt/sources.list
RUN apt update
RUN apt -y upgrade
RUN apt-get -yq install tzdata
RUN apt install -y sudo
RUN apt install -y bash
RUN groupadd ${groupname}
RUN useradd --create-home --no-log-init --shell /bin/bash -m ${username} -g ${groupname} -d /home/${username} && echo "${username}:${password}" | chpasswd
RUN usermod -a -G sudo ${username}
USER ${username}
RUN echo ${password} | sudo -S apt install -y curl wget systemctl python3 python3-pip zsh vim git
RUN echo ${password} | sudo -S apt update && echo ${password} | sudo -S apt install -y --no-install-recommends \
        build-essential \
        libbz2-dev \
        libffi-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        liblzma-dev \
        llvm \
        make \
        netbase \
        pkg-config \
        tk-dev \
        xz-utils \
        zlib1g-dev \
        ffmpeg \
        libsm6 \
        libxext6

RUN echo ${password} | sudo -S mkdir -p /opt/xy_base/config
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base/config
RUN echo ${password} | sudo -S mkdir -p /opt/xy_base/script
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base/script
RUN echo ${password} | sudo -S mkdir -p /opt/xy_base/python/
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base/python/

COPY ./pip.conf /home/${username}/.pip/pip.conf
COPY ./requirements.txt /opt/xy_base/python/requirements.txt
COPY ./initial_mysql.py /opt/xy_base/python/initial_mysql.py
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base

RUN echo ${password} | sudo -S apt install -y python3-dev libpcre2-dev default-libmysqlclient-dev libpcre3 libpcre3-dev
RUN echo ${password} | sudo -S mkdir -p /xy_base
RUN echo ${password} | sudo -S chmod 777 -R /xy_base

ARG SOURCEPATH "/xy_base"

VOLUME ["/xy_base"]

RUN echo ${password} | sudo -S ln -snf /usr/share/zoneinfo/$TZ /etc/localtime 
RUN echo ${password} | sudo -S dpkg-reconfigure -f noninteractive tzdata

COPY ./install.sh /opt/xy_base/ohmysh/install.sh
RUN echo ${password} | sudo -S chmod 777 /opt/xy_base/ohmysh/install.sh
RUN sh /opt/xy_base/ohmysh/install.sh

RUN pip install xy_conda --break-system-packages
RUN /home/${username}/.local/bin/xy_conda -w install_b

# RUN pip install -r /opt/xy_base/python/requirements.txt

RUN echo ${password} | sudo -S mkdir -p /opt/xy_base/mysql/
RUN echo ${password} | sudo -S touch /opt/xy_base/mysql/.root_key.txt
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base/

RUN apt install -y mariadb-server
RUN echo ${password} | sudo -S nohup bash -c "mysqld_safe --skip-grant-tables&" && sleep 10 && python3 /opt/xy_base/python/initial_mysql.py

ENTRYPOINT ["tail", "-f", "/dev/null"]
