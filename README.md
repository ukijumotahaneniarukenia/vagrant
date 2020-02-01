# vagrant

- プロバイダ別に管理

  - win機はvbx

  - win機以外はkvmにしようかな

# visualboxのインストール

仮想ホストのrootユーザで実行

```
cd /opt
rpm -ivh VirtualBox-6.1-6.1.2_135662_el7-1.x86_64.rpm
```

# vagrantのインストール

仮想ホストのrootユーザで実行

```
cd /opt
rpm -ivh vagrant_2.2.7_x86_64.rpm
```

# virshコマンドのインストール

仮想ホストのrootユーザで実行

- https://qiita.com/hana_shin/items/3fc67e2e6132bd534932

- https://qiita.com/TsutomuNakamura/items/bb5cd1bcbf1b998941ed

```
sudo yum install -y kvm virt-manager libvirt libvirt-python python-virtinst
```

```
aine@centos ~/vagrant$lsmod | grep kvm
kvm_intel             188644  0 
kvm                   621480  1 kvm_intel
irqbypass              13503  1 kvm
```

```
$which virsh
/usr/bin/virsh
```

