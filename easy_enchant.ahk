global isRunning := false ; Variable to track macro state (stopped by default)

; Hotkey to toggle the macro on/off (Ctrl + E in this example)
^e::
isRunning := !isRunning ; Toggle the running state

if (isRunning)
{
    ToolTip, Macro Running
    SetTimer, RunMacro, 100 ; Start the macro with a 100ms interval
}
else
{
    ToolTip, Macro Paused
    SetTimer, RunMacro, Off ; Stop the macro
}
Sleep, 1000
ToolTip ; Hide the tooltip after 1 second
Return

; The macro function (runs periodically via the timer)
RunMacro:
{
    ; 1. Move to the book in our inventory and place it into the enchanting table slot
    MouseMove, 819, 600, 0 ; Coordinates of the book in inventory
    Sleep, 100
    Send, ^{Click} ; Control + Left Click to pick up the book
    Sleep, 100

    ; 2. Move to the enchantment level we want and select it
    MouseMove, 981, 476, 0 ; Coordinates of the enchantment level
    Sleep, 100
    Click ; Left Click to select the enchantment
    Sleep, 100

    ; 3. Move back to the enchanting table slot to remove the enchanted book
    MouseMove, 828, 464, 0 ; Coordinates of the enchanting table slot
    Sleep, 100
    Send, ^{Click} ; Control + Left Click to retrieve the enchanted book
    Sleep, 100
}
Return

; Hotkey to stop the macro entirely (Ctrl + Q in this example)
^q::
ExitApp
```
