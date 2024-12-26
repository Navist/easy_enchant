## Installation Guide
1. Install [AutoHotkey](https://www.autohotkey.com/).
2. Copy the script above into a text editor and save it as a `.ahk` file, e.g., `MinecraftEnchantingMacro.ahk`.
3. Run the script by double-clicking the `.ahk` file.

## How to Use
1. **Start/Pause the Macro**:
   - Press `Ctrl + E` to toggle the macro on or off.
   - When running, the script automates the enchanting process.
2. **Stop the Macro**:
   - Press `Ctrl + Q` to exit the script entirely.
3. **Adjust Coordinates**:
   - Use a coordinate-finding script to determine the exact positions for your inventory, enchanting table, and enchantment level buttons if needed.

## Coordinate Finder Script
To determine your custom coordinates, use the following AHK script:
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
Run this script, hover over the desired spots in your Minecraft interface, and note the displayed coordinates.

## Notes
- Ensure Minecraft is running in the same resolution and windowed mode each time you use the script to avoid coordinate mismatches.
- Adjust the `Sleep` values (in milliseconds) if the macro runs too fast or slow for your system.
- Follow server rules when using macros to ensure compliance.

## Troubleshooting
- If the macro doesn’t start or pause, ensure no other application is interfering with the hotkeys.
- Verify that the coordinates match your Minecraft setup.
