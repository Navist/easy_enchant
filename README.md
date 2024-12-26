# Minecraft AutoHotkey Enchanting Macro

## Description
This AutoHotkey (AHK) script automates the process of enchanting books in Minecraft. The script:
1. Picks a book from the inventory and places it in the enchanting table.
2. Selects the desired enchantment.
3. Removes the enchanted book from the table and repeats the process until the inventory is full.

## Script
```ahk
#SingleInstance Force

global isRunning := false ; Variable to track macro state (stopped by default)

; Hotkey to toggle the macro on/off (Ctrl + E in this example)
^e::
isRunning := !isRunning ; Toggle the running state

if (isRunning)
{
    ToolTip, Macro Running
    SetTimer, RunMacro, 10 ; Short interval to allow hotkey responsiveness
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

    ; Check if paused during any part of the process
    if (!isRunning)
        SetTimer, RunMacro, Off ; Stop the macro mid-process if paused
}
Return

; Hotkey to stop the macro entirely (Ctrl + Q in this example)
^q::
ExitApp
```

## Installation Guide
1. Install [AutoHotkey](https://www.autohotkey.com/).
2. Copy the script above into a text editor and save it as a `.ahk` file, e.g., `MinecraftEnchantingMacro.ahk`.
3. Run the script by double-clicking the `.ahk` file.

## How to Use
1. **Start/Pause the Macro**:
   - Press `Ctrl + E` to toggle the macro on or off.
   - When running, the script automates the enchanting process.
   - Pressing `Ctrl + E` again pauses the macro, even if it is mid-process.
2. **Stop the Macro**:
   - Press `Ctrl + Q` to exit the script entirely.
3. **Adjust Coordinates**:
   - Use a coordinate-finding script to determine the exact positions for your inventory, enchanting table, and enchantment level buttons if needed.

## Coordinate Finder Script
Use the following AHK script to find the exact coordinates of your mouse position on the screen:
```ahk
#Persistent
CoordMode, Mouse, Screen
SetTimer, ShowMousePos, 100
Return

ShowMousePos:
    MouseGetPos, xpos, ypos
    ToolTip, X: %xpos% Y: %ypos%
    Return
```

### How to Use the Coordinate Finder
1. Copy the above script into a text editor and save it as `MousePositionFinder.ahk`.
2. Run the script by double-clicking the file.
3. Hover your mouse over the desired spots in Minecraft (e.g., inventory slot, enchanting table slot, and enchantment level).
4. Note the X and Y coordinates displayed in the tooltip.
5. Replace the coordinates in the main macro script (`MouseMove` lines) with your own.

## Notes
- Ensure Minecraft is running in the same resolution and windowed mode each time you use the script to avoid coordinate mismatches.
- Adjust the `Sleep` values (in milliseconds) if the macro runs too fast or slow for your system.
- Follow server rules when using macros to ensure compliance.

## Troubleshooting
- If the macro doesn’t start or pause, ensure no other application is interfering with the hotkeys.
- Verify that the coordinates match your Minecraft setup.
