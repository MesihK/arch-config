## General
* installing latex: download full image! http://mirrors.rit.edu/CTAN/systems/texlive/Images/
* science articles: https://sci-hub.tw/
* set default programs: `mimeopen -d *.pdf`

## I3
* if i3 has big fonts it about glx driver. `xrandr --dpi 96` solves the problem
* to be able to use siji font: `sudo mv /etc/fonts/conf.d/70-no-bitmaps.conf /etc/fonts/conf.d/70-no-bitmaps.conf.old`
* ttf fonts can be used with adding to `/usr/share/fonts/truetype/font-name/ & sudo fc-cache -f -v`
* To get the class of a window use `xprop | grep CLASS` and click the window

## Development
* caching github passwords: `git config --global credential.helper cache`
* use `bear` to generate compilation database to use in vim for c, c++ projects
* if a file unintentionally added to git `git rm --cached giant_file; git commit --ammend -CHEAD`
* if yocto complains about tmpdir that it has changed location then correct the path in TMPDIR/saved_tmpdir
* for kernel development copy ycm_extra_kernel_conf.py to kernel root dir with name: .ycm_extra_conf.py
* ccache used like this: `CC='ccache gcc'`
* use gtk-chtheme to change gtk themes
* use `man -k printf(regex)` to search man pages
* use `axel` for fast downloads
* yocto ipk files : '/opt/yocto/deploy/ipk/armv7at2hf-neon'

## Network 
* `nmcli c` list saved wifi connections
* `nmcli d wifi list` list current wifi connections
* `nmcli c up "SavedWifiName"` connect to wifi
* `nmcli d wifi c SSIDNAME password SSIDPASS name SHORTNAME` to connect a wifi
* network connections are stored in: `/etc/NetworkManager/system-connections`

## Mail
* to install neomutt you need to compile from source. `./configure --disable-doc --ssl --bdb`
* use Luke Smith mutt-wizard to setup mutt
* `offlinemutt -a gmail` ile de mailleri indireceksin
* mail gonderebilmek icin msmtp programini yukle `export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:0:1` bashrc ye ekle

## PDF
* multiple pager per sheet `pdfnup`
* to cropt pdf `pdfmargin`
* to print two sided first `print odd pages` than `reverse print even pages`

## Git like diff files
diff -purN package-version.orig/ package-version/

## Upstreaming
* `git format-patch -o ../patches/rfc_v1/ --cover-letter -n --thread=shallow -9 --subject-prefix="RFC PATCH v2"`

* `git rebase -i HEAD^^^ || git rebase -i HEAD~3`
* `git add && git commit --amend || git reset HEAD~ & git commit`
* `git rebase --continue`

* `git push origin force`

* `get to and cc addresses from cover patch`
* `use --in-reply-to= swtich for patch series. Old series first message id should be given.`
* `git send-email --to-cover --cc-cover path/to/patch/dir/*.patch`
* `--cc-cmd="scripts/get_maintainer.pl -i --norolestats" to interactively get the maintainers list`

* `Icenowy first patch: 20180119231735.61504-1-icenowy@aosc.io`

* `use --no-signed-off-by-cc to send only yourself`
* `git send-email --to-cmd="~/scripts/to.sh" --cc-cmd="~/scripts/cc.sh" `

## Sync forked repo
* `git remote add upstream https://github.com/torvalds/linux.git`
* `git fetch upstream`
* `git checkout master`
* `git merge upstream/master`
* `git checkout development`
* `git rebase master`


## GIT
* `git checkout -- .` to reset all modified files
* `git clean -fd` to remove all untracked files
* `git am path/to/patch` to apply a patch
* `git stash save --keep-index` to stash only un-staged changes
* local .gitconfig `git config --local include.path ../.gitconfig`

## Latex
* For Turkish tex there is a problem with `includegraphics` and can be solved by
`https://latex.org/forum/viewtopic.php?t=11060`  adding this two command before
and after `\shorthandoff{=}` `\shorthandon{=}`

## Sending a file to an embedded system through uart that runs shell
* install lrzsz package to embedded system. 
* Can be installed by buildroot.
(Target Packages -> Networking Applications -> lrzsz)
* use picocom to connect embedded system
* invoke `rz` on embedded system
* invoke picocom send through `ctrl+a, s` 

## Receiving a file from an embedded system through uart that runs shell
* use picocom to connect embedded system
* invoke `rs -e --delay-startup 5` on embedded system
* invoke picocom receive through `ctrl+a, r` with `-e` option 

## Yocto in arch
* rpcgen in pacaur -S rpcsvc-proto


## Bash
* use  `bash-completion` package to enhance bash tab support
* cmd result will be stored as new line separated array into var.
  ```var=(`cmd`)```
* echo will nor print new lines unles called by double quotes
  ```echo "$var"```

## Diff Tool
* `vimdiff` or `vim -d file1 file2` is great for diffing.
* `git config --global diff.tool vimdiff`
* `git difftool`
* 
```
dp             diffput: puts changes under the cursor into the other file
                        making them identical (thus removing the diff).
do             diffget: (o => obtain). The change under the cursor is replaced
                        by the content of the other file making them identical.


]c             Jump to the next diff
[c             Jump to the previous diff
```

## Picocom

Save output of com to a log file:
`picocom /dev/ttyUSB1 -b 115200 -l | tee my.log`


## Microscope

`gst-launch-1.0 v4l2src device='/dev/video2' ! videoflip method=horizontal-flip \
 ! videoflip method=vertical-flip ! autovideoconvert ! autovideosink`

## Git Submodule

Add a submodule for a specific branch with shallow copy:
`git submodule add --depth 1 https://github.com/MesihK/linux.git`
cd linux
git fetch origin f1c100s-lcd:f1c100s-lcd
cd ../
git add linux
git ci -m'checked to f1c100s branch'


## Virtualbox

In order to acces usb devices from Linux host:
`sudo usermod -a -G vboxusers mesih`

## FFMPEG Desktop Recording

With headphone microphone:
```
ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 output.mkv
```
With doridcam microphone
```
ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 -f alsa -ac 1 -i hw:1,1  output.mkv
```

## External HDD (Filesystem problem)

if `df -h` show available as %0, it maybe because the reserved area.
Normally %5 of the total space of a harddrive reserved to use by only root.
So normal users see `df -h` output as available %0. 


## Time Syncronization

* install `chrony` and run
* `sudo systemctl enable chronyd`
* use `sudo hwclock --systohc` to save the clock
