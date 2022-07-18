FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos '' rmg
RUN adduser rmg sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER rmg

WORKDIR /home/rmg

RUN mkdir -p /home/rmg/.config/nvim/ /home/rmg/.doom.d/

RUN sudo apt-get update && \
    sudo apt-get install -y neovim \
                            zsh \
                            curl \
                            sbcl \
                            tmux \
                            git \
                            emacs \
                            ripgrep \
                            findutils


RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --load quicklisp.lisp \
         --eval "(quicklisp-quickstart:install)" \
         --quit

RUN git clone --depth 1 https://github.com/doomemacs/doomemacs /home/rmg/.emacs.d
RUN /home/rmg/.emacs.d/bin/doom install
COPY doom/* /home/rmg/.doom.d/
RUN /home/rmg/.emacs.d/bin/doom sync

COPY init.vim /home/rmg/.config/nvim/init.vim
COPY .zshrc ~/.zshrc

CMD ["/usr/bin/zsh"]
