# 参考文献

- https://qiita.com/ozawan/items/160728f7c6b10c73b97e

# ホストマシンにvagrantをインストール

- https://www.vagrantup.com/downloads.html

rootユーザーで実行

```
$curl -LO https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm
$rpm -ivh vagrant_2.2.7_x86_64.rpm
```

```
$vagrant --version
Vagrant 2.2.7
```

# ホストマシンにvisual-boxをインストール

```
$yum install -y libvpx libvpx-devel libvpx-utils
$yum install -y kernel-devel kernel-devel-3.10.0-1062.el7.x86_64
$curl -LO https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
$rpm -ivh VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
```

# 仮想マシンイメージ選択

- https://app.vagrantup.com/archlinux/boxes/archlinux

```

```

# てばっぐ

- https://qiita.com/shuu1222/items/7a6d04172363be44025c
```
aine@centos ~/vagrant$vi /opt/vagrant/embedded/gems/2.2.7/gems/vagrant-2.2.7/plugins/providers/virtualbox/driver/meta.rb
aine@centos ~/vagrant$vi /opt/vagrant/embedded/gems/2.2.7/gems/vagrant-2.2.7/plugins/providers/virtualbox/plugin.rb
```


# 再現可能なwindows環境の構築

- http://tech.nitoyon.com/ja/blog/2014/02/20/vagrant-win-guest/
```
```
