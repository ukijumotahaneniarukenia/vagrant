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

# 仮想マシンの起動

ホストマシンで以下のコマンドを実行

```
$vagrant up
```

<details><summary>
```
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
</summary></details>
