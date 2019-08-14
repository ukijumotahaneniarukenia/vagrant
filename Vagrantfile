# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.synced_folder '.', '/mnt', type: 'rsync'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.define "node1" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node1"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
  config.vm.define "node2" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node2"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
  config.vm.define "node3" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node3"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
  config.vm.define "node4" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node4"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
  config.vm.define "node5" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node5"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
  config.vm.define "node6" do |centos_on_kvm|
    centos_on_kvm.vm.provision :shell, :path => "a.sh"
    centos_on_kvm.vm.hostname = "node6"
    centos_on_kvm.vm.provider "libvirt" do |spec|
      spec.memory = 2048
      spec.cpus = 1
    end
  end
end
