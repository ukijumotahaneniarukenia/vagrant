# 参考文献

- https://qiita.com/hinataysi29734/items/d4e48ca673bad2f5ea03

# virtualboxコマンドで設定

vagrantホスト側でvirtualboxコマンドをバッググラウンド起動

```
$virtualbox &
```

このコマンド経由による仮想マシンに対する設定内容をファイル出力したい。

Vagrantfileに落とし込めれば、自動化できる。

スナップショットにすることができた。

```
$cd ~/VirtualBox VMs/win10/Snapshots
$ll -lh
合計 2.2G
-rw-------. 1 aine aine 2.1G  2月  1 17:06 2020-02-01T08-05-45-190378000Z.sav
-rw-------. 1 aine aine  85M  2月  1 17:06 {b7a01cc9-e975-42b6-a125-b9ba32842747}.vhd
```

# isoファイルを移動

ここからダウンロード
- https://www.microsoft.com/ja-jp/software-download/windows10ISO

プロダクトキーはwin7のやつを利用できるらしい

```
$cp ~/Downloads/Win10_1909_Japanese_x64.iso ~/VirtualBox VMs/win10
$cd ~/VirtualBox VMs/win10
$ll
合計 5250564
-rw-rw-r--. 1 aine aine 5376456704  2月  1 13:54 Win10_1909_Japanese_x64.iso
-rw-------. 1 aine aine       2281  2月  1 13:51 win10.vbox
-rw-------. 1 aine aine       1792  2月  1 13:51 win10.vbox-prev
-rw-------. 1 aine aine     104448  2月  1 13:51 win10.vhd
```

# フルスクリーン表示

- http://exlight.net/linux/vbox_guest_additions/

```
$locate VBoxGuestAdditions.iso
/usr/share/virtualbox/VBoxGuestAdditions.iso
```

# 仮想マシンのメモリ・CPU

|key|value|
|:-:|:-:|
|メモリ|20MB|
|ＣＰＵ|6CORE|
|ディスク|200GB|

# WSLのインストール

- VisualBox上のwin10では安定しない

# MSYS2のインストール

- https://www.msys2.org/
  - msys2-x86_64-20190524.exeをクリック
  - OSはArchLinuxとなる


