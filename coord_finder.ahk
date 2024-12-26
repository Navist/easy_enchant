#Persistent
CoordMode, Mouse, Screen
SetTimer, ShowMousePos, 100
Return

ShowMousePos:
    MouseGetPos, xpos, ypos
    ToolTip, X: %xpos% Y: %ypos%
    Return
