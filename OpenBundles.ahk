; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; OPEN BUNDLES - AutoHotKey 2.0 Macro for Pet Simulator 99
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; DIRECTIVES & CONFIGURATIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

#Requires AutoHotkey v2.0  ; Ensures the script runs only on AutoHotkey version 2.0, which supports the syntax and functions used in this script.
#SingleInstance Force  ; Forces the script to run only in a single instance. If this script is executed again, the new instance will replace the old one.
CoordMode "Mouse", "Window"  ; Sets the coordinate mode for mouse functions (like Click, MouseMove) to be relative to the active window's client area, ensuring consistent mouse positioning across different window states.
CoordMode "Pixel", "Window"  ; Sets the coordinate mode for pixel functions (like PixelSearch, PixelGetColor) to be relative to the active window's client area, improving accuracy in color detection and manipulation.
SetMouseDelay 10  ; Sets the delay between mouse events to 10 milliseconds, balancing speed and reliability of automated mouse actions.


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GLOBAL VARIABLES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; Titles and verfsioning for GUI elements.
global MACRO_TITLE := "Open Bundles"  ; The title displayed in main GUI elements.
global MACRO_VERSION := "0.2.0"  ; Script version, helpful for user support and debugging.


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; LIBRARIES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; Third-party Libraries:
#Include <OCR>        ; Includes an Optical Character Recognition library for text extraction from images.

; Macro Related Libraries:
#Include "%A_ScriptDir%\Modules"    ; Includes all scripts located in the 'Modules' directory relative to the script's directory.
#Include "Coords.ahk"               ; Includes a script defining coordinates for GUI elements, useful for automation tasks.
#Include "Inventory.ahk"

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; HOTKEYS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

F5::ExitApp
F8::pauseMacro()

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MACRO
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

runMacro()


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; Functions and procedures.
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ----------------------------------------------------------------------------------------
; MainProcedure Function
; Description: The main procedure of the macro.
; ----------------------------------------------------------------------------------------
runMacro() {
    completeInitialisationTasks()  ; Perform all initial tasks necessary for the macro's setup, such as setting variables or preparing the environment.
    showguiMain()  ; Creates and displays a graphical user interface that lists quests and other activities, enhancing user interaction and control.
    activateRoblox()  ; Ensures that the Roblox window is active and ready for input, critical for reliably sending commands to the game.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; MACRO SETTINGS/FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; completeInitialisationTasks Function
; Description: Performs a series of initialization tasks to set up the Roblox game environment.
; Operation:
;   - Updates the system tray icon to a custom one.
;   - Activates the Roblox window to ensure it's in focus.
;   - Changes the game window to full screen if not already.
;   - Defines hotkeys for macro controls.
; Dependencies:
;   - updateTrayIcon, activateRoblox, changeToFullscreen, DefineHotKeys: Functions to adjust UI elements and settings.
; Return: None; performs setup operations only.
; ---------------------------------------------------------------------------------
completeInitialisationTasks() {
    updateTrayIcon()
    activateRoblox()
    changeToFullscreen()
}

; ---------------------------------------------------------------------------------
; updateTrayIcon Function
; Description: Sets a custom icon for the application in the system tray.
; Operation:
;   - Composes the file path for the icon and sets it as the tray icon.
; Dependencies: None.
; Return: None; changes the tray icon appearance.
; ---------------------------------------------------------------------------------
updateTrayIcon() {
    iconFile := A_WorkingDir . "\Assets\Fruit_Bundle.ico"  ; Set the tray icon file path.
    TraySetIcon iconFile  ; Apply the new tray icon.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; ROBLOX CLIENT FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; activateRoblox Function
; Description: Activates the Roblox game window, ensuring it's the current foreground application.
; Operation:
;   - Attempts to activate the Roblox window using its executable name.
;   - If the window cannot be found, displays an error message and exits the application.
;   - Waits for a predefined delay after successful activation to stabilize the environment.
; Dependencies:
;   - WinActivate: AHK command to focus a window based on given criteria.
;   - MsgBox ExitApp: Functions to handle errors and exit.
;   - Wait: Function to pause the script, ensuring timing consistency.
; Return: None; the function directly interacts with the system's window management.
; ---------------------------------------------------------------------------------
activateRoblox() {
    try {
        WinActivate "ahk_exe RobloxPlayerBeta.exe"  ; Try to focus on Roblox window.
    } catch {
        MsgBox "Roblox window not found."  ; Error message if window is not found.
        ExitApp  ; Exit the script.
    }
    Sleep 200  ; Delay for stabilization after activation.
}

; ---------------------------------------------------------------------------------
; changeToFullscreen Function
; Description: Toggles the Roblox game window to full screen mode if not already.
; Operation:
;   - Checks current window size against the screen resolution and sends F11 if not full screen.
; Dependencies: None.
; Return: None; alters the window state of the game.
; ---------------------------------------------------------------------------------
changeToFullscreen() {
    WinGetPos &X, &Y, &W, &H, "ahk_exe RobloxPlayerBeta.exe"  ; Get current window position.
    if (H != A_ScreenHeight) {
        Send "{F11}"  ; Toggle full screen.
    }
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GUI INITIALISATION
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; showguiMain Function
; Description: Initializes and displays the main GUI with interactive controls and event handlers.
; Operation:
;   - Sets the GUI to always stay on top.
;   - Configures the GUI title and font.
;   - Adds buttons for various interactive controls (Open Bundles, Pause, Help, Exit).
;   - Positions the GUI at the top-right corner of the screen.
;   - Attaches event handlers to the buttons for defined functionalities.
; Dependencies: 
;   - openBundles, pauseMacro, openWiki, exitMacro: Functions to handle button events.
; Return: None; initializes and displays the main GUI.
; ---------------------------------------------------------------------------------
showguiMain() {
    ; Initialize the main GUI with "AlwaysOnTop" property to ensure it stays in the foreground.
    global guiMain := Gui("+AlwaysOnTop")
    guiMain.Title := MACRO_TITLE " v" MACRO_VERSION  ; Set the GUI title, incorporating version information.
    guiMain.SetFont(, "Segoe UI")  ; Set a modern-looking font for the GUI text.

    global lvCurrent := guiMain.AddListView("r1 w350 NoSortHdr", ["Action"])
    lvCurrent.Add(, "-")  ; Initialize with a default row.
    lvCurrent.ModifyCol(1, 325)

    ; Add buttons for interactive controls such as pausing or accessing help and about sections.
    btnStart := guiMain.AddButton("Section", "▶ Open Bundles")  ; Adds a button to open bundles.
    btnPause := guiMain.AddButton("yp", "⏸ &Pause (F8)")  ; Adds a pause button with a shortcut key.
    btnHelp := guiMain.AddButton("yp", "🌐 &Wiki")  ; Adds a help button.
    btnExit := guiMain.AddButton("yp", "✖ E&xit (F5)")  ; Adds an exit button with a shortcut key.

    ; Display the GUI on the screen.
    guiMain.Show()

    ; Position the GUI at the top right of the screen by calculating its width and screen dimensions.
    guiMain.GetPos(,, &Width,)  ; Get the current width of the GUI.
    guiMain.Move(A_ScreenWidth - Width + 8, 0)  ; Move the GUI to just inside the top-right corner.

    ; Attach event handlers to the buttons for defined functionalities.
    btnStart.OnEvent("Click", openBundles)  ; Connects the Open Bundles button to its function.
    btnPause.OnEvent("Click", pauseMacro)  ; Connects the Pause button to its function.
    btnHelp.OnEvent("Click", openWiki)  ; Connects the Help button to its function.
    btnExit.OnEvent("Click", exitMacro)  ; Connects the Exit button to its function.
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GUI BUTTONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; openBundles Function
; Description: Activates the Roblox window, repeatedly uses "Bundle" items from the inventory until none are left, and then closes the inventory menu.
; Operation:
;   - Activates the Roblox window to ensure it is ready for input.
;   - Loops to use "Bundle" items from the inventory until none are found.
;   - Closes the inventory menu after all bundles are used.
; Dependencies: 
;   - activateRoblox, UseItem, closeInventoryMenu: Various functions handling specific operations.
; Return: None; performs the operation to open bundles.
; ---------------------------------------------------------------------------------
openBundles(*) {
    activateRoblox()  ; Ensure the Roblox window is active.
    
    Loop {
        UseItem("Bundle")  ; Use "Bundle" items from the inventory.
    }
    
    closeInventoryMenu()  ; Close the inventory menu.
}

; ---------------------------------------------------------------------------------
; openWiki Function
; Description: Opens a help text file in Notepad for user assistance.
; Operation:
;   - Executes Notepad with a specified file path to display help documentation.
; Dependencies:
;   - Run: Function to execute external applications.
; Parameters:
;   - None; uses a global variable for the file path.
; Return: None; opens a text file for user reference.
; ---------------------------------------------------------------------------------
openWiki(*) {
    Run "https://github.com/waktool/OpenBundles/wiki"  ; Run Notepad with the path to the help file stored in g_ReadMe.
}

; ---------------------------------------------------------------------------------
; exitMacro Function
; Description: Exits the macro application completely.
; Operation:
;   - Terminates the application.
; Dependencies:
;   - ExitApp: Command to exit the application.
; Parameters:
;   - None
; Return: None; closes the application.
; ---------------------------------------------------------------------------------
exitMacro(*) {
    ExitApp  ; Exit the macro application.
}

; ---------------------------------------------------------------------------------
; pauseMacro Function
; Description: Toggles the pause state of the macro.
; Operation:
;   - Sends a keystroke to simulate a pause/unpause command.
;   - Toggles the pause state of the script.
; Dependencies:
;   - Send: Function to simulate keystrokes.
; Parameters:
;   - None
; Return: None; toggles the paused state of the macro.
; ---------------------------------------------------------------------------------
pauseMacro(*) {
    Send "{F11}"  ; Send the F11 key, which is often used to pause/resume scripts.
    Pause -1  ; Toggle the pause status of the macro.
}

; ---------------------------------------------------------------------------------
; setCurrentAction Function
; Description: Updates the current action displayed in the ListView.
; Operation:
;   - Modifies the first row of the ListView to display the specified current action.
; Dependencies:
;   - lvCurrent: A global variable representing the ListView control to be updated.
; Return: None; the function directly updates the ListView display.
; ---------------------------------------------------------------------------------
setCurrentAction(currentAction) {
    lvCurrent.Modify(1, , currentAction)  ; Modify the first row to display the new action.
}

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; OCR FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; getOcr Function
; Description: Performs OCR (Optical Character Recognition) on a specified rectangular area and returns the result.
; Operation:
;   - Uses the OCR.FromRect function to capture text from the defined coordinates and dimensions.
;   - Returns the full OCR result object or just the recognized text based on the ReturnObject parameter.
; Dependencies: 
;   - OCR.FromRect: Function to perform OCR on a specified rectangular area.
; Return: OCR result object or recognized text.
; ---------------------------------------------------------------------------------
getOcr(X, Y, W, H, Scale, ReturnObject := false) {
    OcrResult := OCR.FromRect(X, Y, W, H, "en", Scale)  ; Perform OCR on the specified area.
    return ReturnObject ? OcrResult : OcrResult.Text  ; Return the full OCR result object or just the text.
}