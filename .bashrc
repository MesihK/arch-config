#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

export XDG_CONFIG_HOME=~/.config
export PATH=$PATH:/media/mesih/hdd1/Xilinx/SDK/2018.3/bin
export PATH=$PATH:/media/mesih/hdd1/opt/Qt5.11.2/Tools/QtCreator/bin
export PATH=$PATH:/opt/MATLAB/R2018a/bin
export PATH=$PATH:/opt/Qt5.12.4/5.12.4/gcc_64/bin
export PATH=$PATH:/opt/Qt5.12.4/Tools/QtCreator/bin
export PATH=$PATH:/home/mesih/edu/sys/final/test/

alias ls='ls --color=auto'
alias ll='ls -alF'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '

alias batprtcon='sudo tpacpi-bat -v -s ST 0 70; sudo tpacpi-bat -v -s SP 0 80; sudo tlp-stat -b'
alias batprtcoff='sudo tpacpi-bat -v -s ST 0 0; sudo tpacpi-bat -v -s SP 0 0; sleep 1; sudo tlp-stat -b'

alias "c=xclip"
alias "v=xclip -o"

alias yt-dl360='youtube-dl -i -f "bestvideo[height<=360]+bestaudio/best[height<=360]" -o "%(title)s.%(ext)s"'
alias yt-dl480='youtube-dl -i -f "bestvideo[height<=480]+bestaudio/best[height<=480]" -o "%(title)s.%(ext)s"'
alias yt-axel='youtube-dl --external-downloader-args "-a " --external-downloader axel'
alias yt-lf='youtube-dl --list-formats'
alias dmes='dmesg | tail -n 20'
alias v3='vim ~/.config/i3/config'
alias vp='vim ~/.config/polybar/config'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias t='vim ~/prog/tracker/tracker.csv'
alias grep='grep --color=auto'
alias hd='hexdump -C'
alias sagem='sage --notebook=jupyter'
yt-mp3(){
	youtube-dl -i --audio-format mp3 -f "bestaudio/best" --postprocessor-args '-threads 4' -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}
yt-mp3r(){
	youtube-dl -i --audio-format mp3 -f "bestaudio/best" --postprocessor-args '-threads 4' -x -o "%(title)s.%(ext)s" --download-archive archive.txt --playlist-reverse "$1"
}
yt-opus(){
	youtube-dl -i --audio-format opus -f "bestaudio/best" --postprocessor-args '-threads 4' -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}

duu(){
    sudo du -h -d "$1" > /tmp/size; ll -hS | awk '{print $5"\t"$9}' >> /tmp/size; cat /tmp/size | grep -P '^[0-9,.]+[G]' | sort -t, -n -r; cat /tmp/size | grep -P '^[0-9,.]+[M]' | sort -t, -n -r; rm /tmp/size
}
p (){
for (( ; ; ))
do
	ping google.com
	if [ $? -eq 0 ] 
	then
		break
	else
		sleep 1
	fi
done
}

h2d () {
    printf "%03d\n" `echo "obase=10; ibase=16; $1" | bc`
}
d2h () {
    printf "0x%02X\n" $1
}
h2b () {
    printf "b%08d\n" `echo "obase=2; ibase=16; $1" | bc`
}
d2b () {
    printf "b%08d\n" `echo "obase=2; ibase=10; $1" | bc`
}
yt-opus(){
	youtube-dl -i --audio-format opus -f "bestaudio/best" --postprocessor-args '-threads 4' -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}

duu(){
    sudo du -h -d "$1" > /tmp/size; ll -hS | awk '{print $5"\t"$9}' >> /tmp/size; cat /tmp/size | grep -P '^[0-9,.]+[G]' | sort -t, -n -r; cat /tmp/size | grep -P '^[0-9,.]+[M]' | sort -t, -n -r; rm /tmp/size
}
p (){
for (( ; ; ))
do
	ping google.com
	if [ $? -eq 0 ] 
	then
		break
	else
		sleep 1
	fi
done
}

h2d () {
    printf "%03d\n" `echo "obase=10; ibase=16; $1" | bc`
}
d2h () {
    printf "0x%02X\n" $1
}
h2b () {
    printf "b%08d\n" `echo "obase=2; ibase=16; $1" | bc`
}
d2b () {
    printf "b%08d\n" `echo "obase=2; ibase=10; $1" | bc`
}
b2h () {
    printf "0x%02X\n" `echo "obase=10; ibase=2; $1" | bc`
}
b2d () {
    printf "%03d\n" `echo "obase=10; ibase=2; $1" | bc`
}
cmesg () {
	dmesg | tail -n $1
}
makep () {
	make -s printvars VARS='$1'
}

#export LD_PRELOAD=/media/mesih/hdd1/opt/Xilinx/Vivado_Lab/2018.3/data/xicom/cable_drivers/lin64/install_script/install_drivers/usb-driver/libusb-driver.so
alias bckphdd='sudo rsync -aAX --delete  --info=progress2 / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /media/mesih/hdd1/backupArch/ '

export LD_LIBRARY_PATH=/usr/local/qwt-6.0.1-svn/lib/:/usr/local/lib64:/usr/local/osg/lib
