#!/bin/bash

echo 'this version will not clobber; run autocp-unsafe for that' &

cp -n res/xmobarrc ~/.xmobarrc 

bash cd ~/.xmonad 2> /dev/null || mkdir ~/.xmonad 2> /dev/null
cp -n res/xmonad.hs ~/.xmonad/xmonad.hs &

cp -n res/Xresources ~/.Xresources &
          