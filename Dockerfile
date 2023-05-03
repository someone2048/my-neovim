FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y
RUN apt install git curl gcc make npm nodejs unzip cargo ripgrep -y
RUN npm install remark -gy
RUN git -C / clone "https://github.com/someone2048/my-neovim.git"
RUN mkdir -p "/root/.config"
RUN mv /my-neovim/ /root/.config/nvim
RUN cd /root/.config/nvim && git checkout mychanges && ./install.sh
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') &&  \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && install lazygit /usr/local/bin

WORKDIR /project_root
CMD [ "/usr/bin/nim", "." ]
