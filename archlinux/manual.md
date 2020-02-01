# SSHサーバー側（vagrantゲスト側）にxauthコマンドをインストール

```
[vagrant@node1 ~]$pacman -S xauth
```

# SSHサーバー設定ファイル

- 有効な設定を抽出する
```
[vagrant@node1 ~]$ grep -P '^[^#]' /etc/ssh/sshd_config
AuthorizedKeysFile	.ssh/authorized_keys
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no
PrintMotd no # pam does that
Subsystem	sftp	/usr/lib/ssh/sftp-server
```
- X転送する上で重要な設定は以下
```
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost no
```


# SSH接続

```
aine@centos ~/vagrant$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
```

# DISPLAY環境変数の確認

- SSHでX転送有りの接続をする際、DISPLAY環境変数は端末ごとに自動で付番されるらしい

あるターミナル端末
```
[vagrant@node1 ~]$ tty
/dev/pts/1
[vagrant@node1 ~]$ echo $DISPLAY
node1:11.0
```

別のターミナル端末
```
[vagrant@node1 ~]$ tty
/dev/pts/2
[vagrant@node1 ~]$ echo $DISPLAY
node1:12.0
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
