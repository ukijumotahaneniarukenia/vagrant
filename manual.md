# 参考文献

- https://qiita.com/ozawan/items/160728f7c6b10c73b97e

# ホストマシンにvagrantをインストール

- https://www.vagrantup.com/downloads.html

rootユーザーで実行

```
$cd /opt
$curl -LO https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm
$rpm -ivh vagrant_2.2.7_x86_64.rpm
```

バージョン確認
```
$vagrant --version
Vagrant 2.2.7
```

# ホストマシンにvisual-boxをインストール

rootユーザーで実行

```
$yum install -y libvpx libvpx-devel libvpx-utils
$yum install -y kernel-devel kernel-devel-3.10.0-1062.el7.x86_64
$cd /opt
$curl -LO https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
$rpm -ivh VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
```

# 仮想マシンイメージ選択

- https://app.vagrantup.com/archlinux/boxes/archlinux


以下から検索条件を指定してisoイメージを取得する

- https://app.vagrantup.com/boxes/search

```

```


# 再現可能なwindows環境の構築

- http://tech.nitoyon.com/ja/blog/2014/02/20/vagrant-win-guest/
```
```



# 仮想マシンの作成

ホストマシンで以下のコマンドを実行

```
$vagrant up
```

デフォルトの名前はdefalutらしいので、名前管理したほうがよさげ。

<details><summary>開く</summary><div>

```
$vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'archlinux/archlinux' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Loading metadata for box 'archlinux/archlinux'
    default: URL: https://vagrantcloud.com/archlinux/archlinux
==> default: Adding box 'archlinux/archlinux' (v2020.01.03) for provider: virtualbox
    default: Downloading: https://vagrantcloud.com/archlinux/boxes/archlinux/versions/2020.01.03/providers/virtualbox.box
    default: Download redirected to host: vagrantcloud-files-production.s3.amazonaws.com
==> default: Successfully added box 'archlinux/archlinux' (v2020.01.03) for 'virtualbox'!
==> default: Importing base box 'archlinux/archlinux'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'archlinux/archlinux' version '2020.01.03' is up to date...
==> default: Setting the name of the VM: vagrant_default_1580397725236_47588
Vagrant is currently configured to create VirtualBox synced folders with
the `SharedFoldersEnableSymlinksCreate` option enabled. If the Vagrant
guest is not trusted, you may want to disable this option. For more
information on this option, please refer to the VirtualBox manual:

  https://www.virtualbox.org/manual/ch04.html#sharedfolders

This option can be disabled globally with an environment variable:

  VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

or on a per folder basis within the Vagrantfile:

  config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => /home/aine/vagrant
```
</div></details>

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
