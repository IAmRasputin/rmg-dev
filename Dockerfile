FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos '' rmg
RUN adduser rmg sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER rmg

WORKDIR /home/rmg

RUN sudo apt-get update && \
    sudo apt-get install -y neovim \
                            zsh \
                            curl \
                            sbcl \
                            tmux \
                            git


RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --load quicklisp.lisp \
         --eval "(quicklisp-quickstart:install)" \
         --quit

RUN mkdir -p /home/rmg/.config/nvim/
COPY init.vim /home/rmg/.config/nvim/init.vim
COPY .zshrc ~/.zshrc

CMD ["/usr/bin/zsh"]
