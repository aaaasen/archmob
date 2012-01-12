import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import System.IO
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

bw = 2
nbc = "#d3d4d2"
fbc = "#96fcfc"

ml = tiled ||| Mirror tiled ||| Full
   where
	tiled = spacing 2 $ Tall nmaster delta ratio
	nmaster = 1
	delta = 5/100
	ratio = 3/5

wspcs = ["1","2","3","4","5","6" ]
managehook = composeAll
	   [
	   ]

term = "urxvt"

main = do
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
xmonad $ defaultConfig
       {
       manageHook = manageDocks <+> managehook <+> manageHook defaultConfig
       , layoutHook = avoidStruts $ ml
       , logHook = dynamicLogWithPP xmobarPP
       	 {
		ppOutput = hPutStrLn xmproc
		, ppTitle = xmobarColor "#000000" "" . shorten 50
		, ppLayout = const ""
		}
	 , borderWidth = bw
	 , normalBorderColor = nbc
	 , focusedBorderColor = fbc
	 , workspaces = wspcs
	 , terminal = term
	 }
