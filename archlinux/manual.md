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

# SSHプロセス再起動

設定ファイルを修正したら、再起動

```
[vagrant@node1 ~]$ sudo systemctl restart sshd
[vagrant@node1 ~]$ systemctl status sshd
● sshd.service - OpenSSH Daemon
     Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: disabled)
     Active: active (running) since Sat 2020-02-01 10:42:56 JST; 1h 17min ago
   Main PID: 333 (sshd)
      Tasks: 1 (limit: 2370)
     Memory: 8.0M
     CGroup: /system.slice/sshd.service
             └─333 /usr/bin/sshd -D

Warning: Journal has been rotated since unit was started. Log output is incomplete or unavailable.
```

# SSH接続

- vagrantホスト側から接続

- -Xオプションを忘れない

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

# キーボード設定

- https://qiita.com/j8takagi/items/1ff632ce15d02b595718

デフォルトの状態
```
[vagrant@node1 ~]$ localectl
   System Locale: LANG=en_US.UTF-8
       VC Keymap: us
      X11 Layout: us
       X11 Model: pc105+inet
     X11 Options: terminate:ctrl_alt_bksp
```

利用可能なキー配列
```
[vagrant@node1 ~]$ localectl list-keymaps | grep jp
jp106
```

日本語キーボードに設定

```
[vagrant@node1 ~]$ sudo localectl set-keymap jp106
```

変更後の状態
```
[vagrant@node1 ~]$ localectl
   System Locale: LANG=en_US.UTF-8
       VC Keymap: jp106
      X11 Layout: jp
       X11 Model: jp106
     X11 Options: terminate:ctrl_alt_bksp
```

# ネットワーク設定

- vagrantホスト側からvirtualboxのツールを使って確認できる

```
aine@centos ~/vagrant/archlinux$virtualbox &
[1] 15586
```

これはVisualBoxのコマンドの一つへのリンクとなっている

```
aine@centos ~/vagrant/archlinux$ls -l /usr/bin/virtualbox
lrwxrwxrwx. 1 root root 4  1月 30 23:21 /usr/bin/virtualbox -> VBox
aine@centos ~/vagrant/archlinux$ls -l /usr/bin/VBox
-rwxr-xr-x. 1 root root 4677  1月 14  2019 /usr/bin/VBox
```

![](./1.png)
