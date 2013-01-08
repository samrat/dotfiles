import XMonad
import XMonad.Layout.NoBorders

main = xmonad $ defaultConfig
       {
       modMask = mod4Mask
       , layoutHook = smartBorders (layoutHook defaultConfig)
       , focusFollowsMouse = False
       , terminal = "urxvtc"
       , borderWidth = 1
       }