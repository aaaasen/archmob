#!/bin/bash

echo 'warning: will clobber existing config files' &

cp res/xmobarrc ~/.xmobarrc 

bash cd ~/.xmonad 2> /dev/null || mkdir ~/.xmonad 2> /dev/null
cp res/xmonad.hs ~/.xmonad/xmonad.hs &

cp res/Xresources ~/.Xresources &

res/xinitrc >> ~/.xinitrc
res/bashrc >> ~/.bashrc          