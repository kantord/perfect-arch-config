FROM archlinux/base
RUN useradd -ms /bin/bash kdani
RUN pacman -Sy sudo --noconfirm
RUN sudo -u kdani mkdir -p /home/kdani/repos/perfect-arch-config/yay
WORKDIR /home/kdani/repos/perfect-arch-config
COPY setup.sh .
COPY tools .
COPY packages.txt .
COPY extra_packages.txt .

RUN pacman -S git --noconfirm
RUN pacman -S base-devel --noconfirm
RUN pacman -S go --noconfirm
RUN git clone https://aur.archlinux.org/yay.git && cd yay && sudo -u kdani makepkg -s && pacman -U yay-*.pkg.tar.xz --noconfirm && cd - && rm -rf yay
COPY tools tools
COPY bootstrap.sh .
RUN bash bootstrap.sh
RUN bash setup.sh
