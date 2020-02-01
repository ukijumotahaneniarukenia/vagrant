```
aine@centos ~$cd vagrant/
aine@centos ~/vagrant$ls
README.md  a.sh  archlinux  manual.md  windows10
aine@centos ~/vagrant$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
ssh: connect to host 127.0.0.1 port 2222: Connection refused
aine@centos ~/vagrant$cd archlinux/
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
ssh: connect to host 127.0.0.1 port 2222: Connection refused
aine@centos ~/vagrant/archlinux$vagrant status
Current machine states:

node1                     poweroff (virtualbox)

The VM is powered off. To restart the VM, simply run `vagrant up`
aine@centos ~/vagrant/archlinux$vagrant up
Bringing machine 'node1' up with 'virtualbox' provider...
==> node1: Checking if box 'archlinux/archlinux' version '2020.01.03' is up to date...
==> node1: Clearing any previously set forwarded ports...
==> node1: Clearing any previously set network interfaces...
==> node1: Preparing network interfaces based on configuration...
    node1: Adapter 1: nat
==> node1: Forwarding ports...
    node1: 5901 (guest) => 15901 (host) (adapter 1)
    node1: 22 (guest) => 2222 (host) (adapter 1)
==> node1: Running 'pre-boot' VM customizations...
==> node1: Booting VM...
==> node1: Waiting for machine to boot. This may take a few minutes...
    node1: SSH address: 127.0.0.1:2222
    node1: SSH username: vagrant
    node1: SSH auth method: private key
==> node1: Machine booted and ready!
==> node1: Checking for guest additions in VM...
==> node1: Setting hostname...
==> node1: Mounting shared folders...
    node1: /vagrant => /home/aine/vagrant/archlinux
==> node1: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> node1: flag to force provisioning. Provisioners marked to run always will still run.
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:39:07 2020 from 10.0.2.2
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$cd ~/.ssh
aine@centos ~/.ssh$ll
合計 8
-rwx------. 1 aine aine 292  2月  1 09:32 config
-rw-r--r--. 1 aine aine 178  2月  1 09:39 known_hosts
aine@centos ~/.ssh$rm -rf *
aine@centos ~/.ssh$cd -
/home/aine/vagrant/archlinux
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
The authenticity of host '[127.0.0.1]:2222 ([127.0.0.1]:2222)' can't be established.
ECDSA key fingerprint is SHA256:RVBG7soEP46U4sbWNkMAPIyOVXUSjdjS/urok2gdGjk.
ECDSA key fingerprint is MD5:6f:11:82:19:50:95:f5:df:de:64:54:35:20:36:59:79.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:2222' (ECDSA) to the list of known hosts.
Last login: Sat Feb  1 01:43:19 2020 from 10.0.2.2
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$vim manual.md 
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:43:54 2020 from 10.0.2.2
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$vim manual.md 
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:44:32 2020 from 10.0.2.2
[vagrant@node1 ~]$ xterm
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ ls -la
total 44
drwx------ 4 vagrant vagrant 4096 Feb  1 01:45 .
drwxr-xr-x 5 root    root    4096 Jan 31 13:52 ..
-rw------- 1 vagrant vagrant 2296 Feb  1 01:46 .bash_history
-rw-r--r-- 1 vagrant vagrant   21 Nov 13 17:31 .bash_logout
-rw-r--r-- 1 vagrant vagrant   57 Nov 13 17:31 .bash_profile
-rw-r--r-- 1 vagrant vagrant  141 Nov 13 17:31 .bashrc
drwx------ 3 vagrant vagrant 4096 Jan 31 23:55 .cache
drwx------ 2 vagrant vagrant 4096 Jan 31 13:52 .ssh
-rw-r--r-- 1 vagrant vagrant    5 Jan  3 15:25 .vbox_version
-rw------- 1 vagrant vagrant 2323 Feb  1 00:49 .viminfo
-rw------- 1 vagrant vagrant   51 Feb  1 01:45 .Xauthority
[vagrant@node1 ~]$ rm -rf .Xauthority 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ 
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:45:17 2020 from 10.0.2.2
/usr/bin/xauth:  file /home/vagrant/.Xauthority does not exist
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:46:39 2020 from 10.0.2.2
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$vi manual.md 
aine@centos ~/vagrant/archlinux$ls
Vagrantfile  devenv.sh  log  manual.md
aine@centos ~/vagrant/archlinux$vi devenv.sh 
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X
Last login: Sat Feb  1 01:46:47 2020 from 10.0.2.2
[vagrant@node1 ~]$ date
Sat 01 Feb 2020 01:52:16 AM UTC
[vagrant@node1 ~]$ sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
[vagrant@node1 ~]$ date
Sat 01 Feb 2020 10:52:28 AM JST
[vagrant@node1 ~]$ logout
Connection to 127.0.0.1 closed.
aine@centos ~/vagrant/archlinux$
aine@centos ~/vagrant/archlinux$vi devenv.sh 
aine@centos ~/vagrant/archlinux$ssh vagrant@127.0.0.1 -p 2222 -i /home/aine/vagrant/archlinux/.vagrant/machines/node1/virtualbox/private_key -X

```


- https://blog.livewing.net/install-arch-linux


環境構成がいい
- https://memo.laughk.org/2017/12/03/000013.html
