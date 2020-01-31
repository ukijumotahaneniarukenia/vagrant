# 参考文献

- https://qiita.com/ozawan/items/160728f7c6b10c73b97e

x環境構築

ソケットファイルを共有するのではなく、sshサービスの機能を利用する

https://msyksphinz.hatenablog.com/entry/2015/11/24/020000

# ホストマシンにvagrantをインストール

- https://www.vagrantup.com/downloads.html

- rootユーザーで実行

```
$cd /opt
$curl -LO https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm
$rpm -ivh vagrant_2.2.7_x86_64.rpm
```

- バージョン確認
```
$vagrant --version
Vagrant 2.2.7
```

# ホストマシンにvisual-boxをインストール

- rootユーザーで実行

```
$yum install -y libvpx libvpx-devel libvpx-utils
$yum install -y kernel-devel kernel-devel-3.10.0-1062.el7.x86_64
$cd /opt
$curl -LO https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
$rpm -ivh VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
```

# 仮想マシンイメージ選択

- 以下から検索条件を指定してisoイメージを取得する

- https://app.vagrantup.com/boxes/search

# 再現可能なwindows環境の構築

- http://tech.nitoyon.com/ja/blog/2014/02/20/vagrant-win-guest/
```
```

# 仮想マシンの作成

- ホストマシンで以下のコマンドを実行
- デフォルトの名前はdefalutらしいので、名前管理したほうがよさげ。

```
$vagrant up
```

# isoファイルの確認

```
$find / -name "*iso*" 2>/dev/null | grep vagrant | grep boxes
/home/aine/.vagrant.d/boxes/archlinux-VAGRANTSLASH-archlinux/2020.01.03/virtualbox/packer-virtualbox-iso-1578064342-disk001.vmdk
$ls -lh /home/aine/.vagrant.d/boxes/archlinux-VAGRANTSLASH-archlinux/2020.01.03/virtualbox/packer-virtualbox-iso-1578064342-disk001.vmdk
-rw-r--r--. 1 aine aine 567M  1月 31 00:21 /home/aine/.vagrant.d/boxes/archlinux-VAGRANTSLASH-archlinux/2020.01.03/virtualbox/packer-virtualbox-iso-1578064342-disk001.vmdk
```


# 仮想マシンの一覧取得

```
$vagrant box list
archlinux/archlinux (virtualbox, 2020.01.03)
```

# 仮想マシンの状態確認

```
$vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
```

# SSH接続

```
aine@centos ~/vagrant$vagrant ssh
[vagrant@archlinux ~]$ whoami
vagrant
```

# SSH接続情報確認

```
$vagrant ssh-config
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/aine/vagrant/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL

```

# 仮想マシンの停止

```
aine@centos ~/vagrant$vagrant halt
==> default: Attempting graceful shutdown of VM...
```

# 仮想マシンの再起動

```
$vagrant reload
```

# 仮想マシンの状態確認

```
$vagrant status
Current machine states:

default                   poweroff (virtualbox)

The VM is powered off. To restart the VM, simply run `vagrant up`
```

# 仮想マシンの削除

```
$vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Destroying VM and associated drives...
```

# 仮想マシンの状態確認

```
$vagrant status
Current machine states:

default                   not created (virtualbox)

The environment has not yet been created. Run `vagrant up` to
create the environment. If a machine is not created, only the
default provider will be shown. So if a provider is not listed,
then the machine is not created for that environment.

```

# 仮想マシンの情報確認

- pacmanコマンドラインの操作

  - http://malkalech.com/arch_linux_pacman
  - https://qiita.com/MoriokaReimen/items/dbe1448ce6c0f80a6ac1

- os情報の確認

```
[vagrant@node1 ~]$ cat /etc/os-release 
NAME="Arch Linux"
PRETTY_NAME="Arch Linux"
ID=arch
BUILD_ID=rolling
ANSI_COLOR="0;36"
HOME_URL="https://www.archlinux.org/"
DOCUMENTATION_URL="https://wiki.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://bugs.archlinux.org/"
LOGO=archlinux
```

- ipアドレスの確認

```
[vagrant@node1 ~]$ ip a show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:56:95:23 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 86055sec preferred_lft 86055sec
    inet6 fe80::a00:27ff:fe56:9523/64 scope link 
       valid_lft forever preferred_lft forever
```
