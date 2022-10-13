FROM ubuntu:devel

RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos '' rmg
RUN adduser rmg sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER rmg

WORKDIR /home/rmg

RUN mkdir -p .config/nvim/ .doom.d/

RUN sudo apt-get update && \
    sudo apt-get install -y neovim \
                            make \
                            zsh \
                            curl \
                            sbcl \
                            tmux \
                            git \
                            emacs \
                            ripgrep \
                            fzf \
                            gcc \
                            g++ \
                            unzip \
                            jq \
                            libpq-dev \
                            build-essential \
                            python \
                            findutils


RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --load quicklisp.lisp \
         --eval "(quicklisp-quickstart:install)" \
         --quit

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    mkdir src

RUN git clone --depth 1 https://github.com/doomemacs/doomemacs /home/rmg/.emacs.d
COPY doom/* .doom.d/

RUN yes | .emacs.d/bin/doom install
RUN .emacs.d/bin/doom sync

COPY init.vim .config/nvim/init.vim
COPY zshrc .zprofile

RUN sudo curl -fsSL https://deno.land/install.sh | sh
RUN echo "source ~/.zprofile" > ~/.zshrc

RUN yes | sudo unminimize

RUN nvim --headless +PlugInstall +qa

WORKDIR /home/rmg

ENV REPO=/home/rmg/discovery-pipeline/
ENV SRC=$REPO/embark-research-on-aws/src
ENV CONDA_ENVIRONMENT=science



CMD ["/usr/bin/zsh"]
