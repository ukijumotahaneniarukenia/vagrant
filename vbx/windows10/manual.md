
# 参考文献

- https://qiita.com/hinataysi29734/items/d4e48ca673bad2f5ea03

# virtualboxコマンドで設定

```
aine@centos ~/vagrant/vbx/windows10$virtualbox &
```

# isoファイルを移動

ここからダウンロード
- https://www.microsoft.com/ja-jp/software-download/windows10ISO

プロダクトキーはwin7のやつを使用

```
aine@centos ~/VirtualBox VMs/win10$cp ~/Downloads/Win10_1909_Japanese_x64.iso .
aine@centos ~/VirtualBox VMs/win10$ls
Win10_1909_Japanese_x64.iso  win10.vbox  win10.vbox-prev  win10.vhd
aine@centos ~/VirtualBox VMs/win10$ll
合計 5250564
-rw-rw-r--. 1 aine aine 5376456704  2月  1 13:54 Win10_1909_Japanese_x64.iso
-rw-------. 1 aine aine       2281  2月  1 13:51 win10.vbox
-rw-------. 1 aine aine       1792  2月  1 13:51 win10.vbox-prev
-rw-------. 1 aine aine     104448  2月  1 13:51 win10.vhd
```

# フルスクリーン表示
- http://exlight.net/linux/vbox_guest_additions/
