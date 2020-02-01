# SSHサーバー側にxauthコマンドをインストール
```
$pacman -S xauth
```

# SSH接続

```
aine@centos ~/vagrant$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
```

# トラシュー

- 事象
  - SSH接続できない
```
ssh: connect to host 127.0.0.1 port 2222: Connection refused
```

- 対策
  - 仮想マシンが起動しているか確認。起動していなければ、起動した後、接続。
```
aine@centos ~/vagrant/archlinux$vagrant status
aine@centos ~/vagrant/archlinux$vagrant up
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
```

- https://blog.livewing.net/install-arch-linux


環境構成がいい
- https://memo.laughk.org/2017/12/03/000013.html
