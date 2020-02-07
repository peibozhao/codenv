# VERSION 0.0.1
FROM ubuntu
MAINTAINER peibo.zhao

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ARG MinicondaInstall=/usr/local/miniconda3
ARG UserName=zpb
ARG GroupName=users
ARG TmuxLocalFileName=tmux.conf.local

SHELL ["/bin/bash", "-c"]

COPY sources.list /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt update -y && apt upgrade -y
RUN apt install -yqq libssl-dev
RUN apt install -yqq libcurl4-openssl-dev
RUN apt install -yqq build-essential
RUN apt install -yqq gdb
RUN apt install -yqq cmake
RUN apt install -yqq wget
RUN apt install -yqq curl
RUN apt install -yqq git
RUN apt install -yqq iputils-ping
RUN apt install -yqq sudo
RUN apt install -yqq zsh
RUN apt install -yqq tmux
RUN apt install -yqq graphviz
RUN apt install -yqq doxygen

RUN apt install -yqq clang
RUN apt install -yqq clangd-9
RUN ln -s `which clangd-9` /usr/local/bin/clangd
RUN apt install -yqq clang-format

Run apt install -yqq ack
Run apt install -yqq ctags
Run apt install -yqq ffmpeg
RUN apt install -yqq unzip

Run apt install -yqq pkg-config
Run apt install -yqq libjpeg-dev
Run apt install -yqq libpng-dev
Run apt install -yqq libtiff-dev
Run apt install -yqq libatlas-base-dev
Run apt install -yqq gfortran
Run apt install -yqq webp
Run apt install -yqq qt5-default
Run apt install -yqq zlib1g-dev
RUN apt install -yqq gnutls-bin

# add user
RUN useradd -m -s /bin/zsh -g ${GroupName} ${UserName}
RUN chmod u+w /etc/sudoers && \
      echo -e "\n${UserName}    ALL=(ALL:ALL) ALL" >> /etc/sudoers && \
      chmod u-w /etc/sudoers

# config git
USER ${UserName}
WORKDIR /home/${UserName}
COPY --chown=${UserName}:${GroupName} gitconfig .gitconfig
# RUN git config --global http.sslVerify false
# RUN git config --global http.postBuffer 1048576000

# install python
USER root
WORKDIR /root
# RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
COPY Miniconda3-latest-Linux-x86_64.sh .
RUN sh Miniconda3-latest-Linux-x86_64.sh -b -f -p ${MinicondaInstall}
RUN mkdir -p .pip
COPY pip.conf .pip
ENV PATH="${MinicondaInstall}/bin:${PATH}"
RUN ln -s ${MinicondaInstall}/bin/python /bin/python
RUN ln -s ${MinicondaInstall}/bin/python /usr/local/bin/python
RUN ${MinicondaInstall}/bin/pip install --upgrade pip
RUN ${MinicondaInstall}/bin/pip install -q opencv-python
RUN ${MinicondaInstall}/bin/pip install -q mxnet
RUN ${MinicondaInstall}/bin/pip install -q ipython

# install neovim
USER root
RUN apt install -yqq software-properties-common
RUN apt-add-repository -y ppa:neovim-ppa/unstable
RUN apt update -y
RUN apt install -yqq neovim
RUN ${MinicondaInstall}/bin/pip install -q neovim
RUN apt install -yqq nodejs
RUN apt install -yqq nodejs-dev node-gyp libssl1.0-dev
RUN apt install -yqq npm
USER ${UserName}
WORKDIR /home/${UserName}
RUN mkdir -p Download/ && cd Download && git clone https://github.com/junegunn/vim-plug
RUN mkdir -p .config/nvim/autoload/
RUN cp Download/vim-plug/plug.vim .config/nvim/autoload/
COPY --chown=${UserName}:${GroupName} init.vim .config/nvim/
RUN nvim +"PlugInstall --sync" +qa
COPY --chown=${UserName}:${GroupName} coc-settings.json .config/nvim/
 
# intall oh-my-zsh
USER ${UserName}
WORKDIR /home/${UserName}
RUN git clone https://github.com/ohmyzsh/ohmyzsh
RUN sh ohmyzsh/tools/install.sh
COPY --chown=${UserName}:${GroupName} zshrc .
RUN cat zshrc >> .zshrc && rm zshrc

# install oh-my-tmux
USER ${UserName}
WORKDIR /home/${UserName}
RUN git clone https://github.com/gpakosz/.tmux.git
RUN ln -s -f .tmux/.tmux.conf
COPY --chown=${UserName}:${GroupName} ${TmuxLocalFileName} .
RUN cat .tmux/.tmux.conf.local ${TmuxLocalFileName} > .tmux.conf.local
RUN rm ${TmuxLocalFileName}
