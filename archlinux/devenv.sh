#!/bin/bash

#ユーザー作成
groupadd -g 1001 postgres && \
useradd -m -g postgres -u 1001 postgres && \
echo 'postgres:postgres_pwd' | chpasswd && \
echo 'postgres ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
chsh -s /bin/bash postgres

groupadd -g 1002 kuraine && \
useradd -m -g kuraine -u 1002 kuraine && \
echo 'kuraine:kuraine_pwd' | chpasswd && \
echo 'kuraine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
chsh -s /bin/bash kuraine

echo 'root:root_pwd' | sudo chpasswd

#パッケージの更新
echo | pacman -Syyu

#パッケージのインストール
echo | pacman -S net-tools
echo | pacman -S lsof
echo | pacman -S psmisc
echo | pacman -S traceroute
echo | pacman -S bridge-utils
