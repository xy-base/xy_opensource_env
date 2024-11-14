
ARG os_version=24.04
FROM ubuntu:${os_version}

ARG version=0.0.2
LABEL name="xy_base"
LABEL version="${version}"
LABEL description="xy_base"
ENV xy_base "${version}"
ARG username="xy_base"
ARG password="abc1236547890"
ARG groupname="xy_base"
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt update
RUN apt -y upgrade
RUN apt install -y ca-certificates
RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list.d/ubuntu.sources
RUN apt update
RUN apt -y upgrade
RUN apt-get -yq install tzdata
RUN apt install -y sudo bash zsh curl wget systemctl python3 python3-pip vim git make llvm clang pkg-config zip mariadb-server
RUN groupadd ${groupname}
RUN useradd --create-home --no-log-init --shell /bin/bash -m ${username} -g ${groupname} -d /home/${username} && echo "${username}:${password}" | chpasswd
RUN usermod -a -G sudo ${username}
USER ${username}
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
        netbase \
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

SHELL ["/bin/zsh", "--login", "-c"]

COPY ./install.sh /opt/xy_base/ohmysh/install.sh
RUN echo ${password} | sudo -S chmod 777 /opt/xy_base/ohmysh/install.sh
RUN sh /opt/xy_base/ohmysh/install.sh
CMD ["zsh"]
RUN zsh -c "source ~/.zshrc"

RUN pip install xy_conda --break-system-packages
RUN /home/${username}/.local/bin/xy_conda -w install_b

# RUN pip install -r /opt/xy_base/python/requirements.txt
RUN echo ${password} | sudo -S mkdir -p /opt/xy_base/mysql/
RUN echo ${password} | sudo -S touch /opt/xy_base/mysql/.root_key.txt
RUN echo ${password} | sudo -S chmod 777 -R /opt/xy_base/

RUN echo ${password} | sudo -S nohup zsh -c "mysqld_safe --skip-grant-tables&" && sleep 10 && python3 /opt/xy_base/python/initial_mysql.py

ENTRYPOINT ["tail", "-f", "/dev/null"]
