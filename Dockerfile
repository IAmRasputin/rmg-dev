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
                            curl

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["/usr/bin/zsh"]
