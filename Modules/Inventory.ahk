#Requires AutoHotkey v2.0

; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; GLOBAL VARIABLES
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

global INVENTORY_BLUE_CAT_ICON := Map("Start", [424, 232], "End", [432, 240], "Colour", 0x14DCCD, "Tolerance", 5)
global INVENTORY_SEARCH_CURSOR := Map("Start", [1320, 265], "End", [1340, 265], "Colour", 0xAFAFAF, "Tolerance", 5)
global INVENTORY_SEARCH_TERM := Map("Start", [1408, 246], "End", [1422, 257], "Colour", 0x1E1E1E, "Tolerance", 5)
global ITEM_CONTEXT_MENU_BORDER := Map("Start", [567, 415], "End", [567, 415], "Colour", 0x000000, "Tolerance", 5)
global OOPS_ERROR_QUESTION_MARK := Map("Start", [1011, 528], "End", [1011, 528], "Colour", 0xFFB837, "Tolerance", 5)
global ITEMS_TAB_BOOSTS_TEXT := Map("X", 907, "Y", 287, "W", 101, "H", 28, "Scale", 5)


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; INVENTORY FUNCTIONS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; openInventoryMenu Function
; Description: Checks if the inventory menu is open and attempts to open it if not.
; Operation:
;   - Checks if the inventory menu is not open.
;   - If the inventory menu is not open, sends the key event to open it.
;   - Updates the current action to reflect the process of opening the inventory.
;   - Loops to check if the inventory menu is open, updating the current action during the wait.
;   - Returns true if the inventory menu is successfully opened, otherwise returns false.
; Dependencies:
;   - isInventoryOpen: Function to check if the inventory menu is open.
;   - setCurrentAction: Function to update the current action in the GUI.
; Return: 
;   - true if the inventory menu is successfully opened.
;   - false if the inventory menu fails to open after attempts.
; ---------------------------------------------------------------------------------
openInventoryMenu() {
    Loop {
        if !isInventoryOpen() {  ; Check if the inventory menu is not open.
            SendEvent "{f}"  ; Send the key event to open the inventory menu.
            setCurrentAction("Opening inventory")  ; Update the current action.
            Loop 25 {  ; Loop to check if the inventory menu is open.
                setCurrentAction("Waiting for inventory to open")  ; Update the current action.
                if isInventoryOpen()  ; Check if the inventory menu is open.
                    return true  ; Exit the loop if the inventory menu is open.
                Sleep 10  ; Wait before the next check.
            }
            setCurrentAction("Inventory not opened")  ; Update the current action if failed.
            return false  ; Return false if the inventory menu fails to open.
        }
        return true  ; Return true if the inventory menu is already open.
    }
}

; ---------------------------------------------------------------------------------
; openItemsTab Function
; Description: Checks if the items tab is open and attempts to open it if not.
; Operation:
;   - Checks if the items tab is not open.
;   - If the items tab is not open, updates the current action and sends a click event to open it.
;   - Updates the current action to reflect the process of opening the items tab.
;   - Loops to check if the items tab is open, updating the current action during the wait.
;   - Returns true if the items tab is successfully opened, otherwise returns false.
; Dependencies:
;   - isItemsTabOpen: Function to check if the items tab is open.
;   - setCurrentAction: Function to update the current action in the GUI.
;   - COORDS: Map storing coordinates for various controls and tabs.
; Return:
;   - true if the items tab is successfully opened.
;   - false if the items tab fails to open after attempts.
; ---------------------------------------------------------------------------------
openItemsTab() {
    if !isItemsTabOpen() {  ; Check if the items tab is not open.
        setCurrentAction("Opening items tab")  ; Update the current action.
        SendEvent "{Click, " COORDS["Inventory"]["Items"][1] ", " COORDS["Inventory"]["Items"][2] ", 1}"  ; Send click event to open the items tab.
        Loop 25 {  ; Loop to check if the items tab is open.
            setCurrentAction("Waiting for items tab to open")  ; Update the current action.
            if isItemsTabOpen()  ; Check if the items tab is open.
                return true  ; Exit the loop if the items tab is open.
            Sleep 10  ; Wait before the next check.
        }
        setCurrentAction("Items tab not opened")  ; Update the current action if failed.
        return false  ; Return false if the items tab fails to open.
    }
    return true  ; Return true if the items tab is already open.
}

; ---------------------------------------------------------------------------------
; clickInventorySearchBox Function
; Description: Selects the inventory search box and verifies the selection.
; Operation:
;   - Retrieves the coordinates for the inventory search box.
;   - Updates the current action to reflect the process of selecting the search box.
;   - Sends click events to select the search box.
;   - Loops to check if the search box is selected, updating the current action during the wait.
;   - Returns true if the search box is successfully selected, otherwise returns false.
; Dependencies:
;   - COORDS: Map storing coordinates for various controls and tabs.
;   - setCurrentAction: Function to update the current action in the GUI.
;   - isSearchBoxSelected: Function to check if the search box is selected.
; Return:
;   - true if the search box is successfully selected.
;   - false if the search box fails to be selected after attempts.
; ---------------------------------------------------------------------------------
clickInventorySearchBox() {
    inventorySearch := COORDS["Inventory"]["Search"]  ; Get coordinates for the search box.
    setCurrentAction("Selecting search box")  ; Update the current action.
    SendEvent "{Click, " inventorySearch[1] ", " inventorySearch[2] ", 1}"  ; Click directly on the search box.
    
    Loop 25 {  ; Loop to check if the search box is selected.
        setCurrentAction("Waiting for search box to be selected")  ; Update the current action.
        if isSearchBoxSelected()  ; Check if the search box is selected.
            return true  ; Exit the loop if the search box is selected.
        Sleep 10  ; Wait before the next check.
    }
    setCurrentAction("Search box not selected")  ; Update the current action if failed.
    return false  ; Return false if the search box fails to be selected.
}

; ---------------------------------------------------------------------------------
; enterSearchTerm Function
; Description: Enters a search term into the search box and verifies the entry.
; Operation:
;   - Updates the current action to reflect the process of entering the search term.
;   - Sends the search term text to the search box.
;   - Loops to check if the search term is entered, updating the current action during the wait.
;   - Returns true if the search term is successfully entered, otherwise returns false.
; Dependencies:
;   - setCurrentAction: Function to update the current action in the GUI.
;   - isSearchTermEntered: Function to check if the search term is entered.
; Return:
;   - true if the search term is successfully entered.
;   - false if the search term fails to be entered after attempts.
; ---------------------------------------------------------------------------------
enterSearchTerm(Item) {
    setCurrentAction("Entering search term")  ; Update the current action.
    SendText Item  ; Send the search term text to the search box.
    
    Loop 25 {  ; Loop to check if the search term is entered.
        setCurrentAction("Waiting for search term to be entered")  ; Update the current action.
        if isSearchTermEntered()  ; Check if the search term is entered.
            return true  ; Exit the loop if the search term is entered.
        Sleep 10  ; Wait before the next check.
    }
    setCurrentAction("Search term not entered")  ; Update the current action if failed.
    return false  ; Return false if the search term fails to be entered.
}

; ---------------------------------------------------------------------------------
; closeOopsWindow Function
; Description: Attempts to close the "Oops" window if it is open and verifies the closure.
; Operation:
;   - Pauses briefly before checking the window state.
;   - Checks if the inventory is open, returning immediately if it is.
;   - If the "Oops" window is open, sends a click event to the "Ok" button to close it.
;   - Loops to check if the "Oops" window is closed, returning once the window is no longer open.
; Dependencies:
;   - isInventoryOpen: Function to check if the inventory is open.
;   - isOopsWindowOpen: Function to check if the "Oops" window is open.
;   - COORDS: Map storing coordinates for various controls and buttons.
; Return: None; the function attempts to close the "Oops" window and exits once it is closed.
; ---------------------------------------------------------------------------------
closeOopsWindow() {
    Sleep 200  ; Pause briefly before proceeding.
    
    if isInventoryOpen()  ; Check if the inventory is open.
        return  ; Return immediately if the inventory is open.
    
    if isOopsWindowOpen() {  ; Check if the "Oops" window is open.
        SendEvent "{Click, " COORDS["Errors"]["Ok"][1] ", " COORDS["Errors"]["Ok"][2] ", 1}"  ; Click the "Ok" button to close the window.
        
        Loop 25 {  ; Loop to check if the "Oops" window is closed.
            if !isOopsWindowOpen()  ; Check if the "Oops" window is no longer open.
                return  ; Return once the window is closed.
            Sleep 10  ; Wait before the next check.
        }
    }
}

; ---------------------------------------------------------------------------------
; closeInventoryMenu Function
; Description: Attempts to close the inventory menu if it is open and verifies the closure.
; Operation:
;   - Checks if the inventory menu is open.
;   - If the inventory menu is open, sends a click event to the close button.
;   - Loops to check if the inventory menu is closed, returning once the menu is no longer open.
; Dependencies:
;   - isInventoryOpen: Function to check if the inventory menu is open.
;   - COORDS: Map storing coordinates for various controls and buttons.
; Return: None; the function attempts to close the inventory menu and exits once it is closed.
; ---------------------------------------------------------------------------------
closeInventoryMenu() {
    if isInventoryOpen() {  ; Check if the inventory menu is open.
        SendEvent "{Click, " COORDS["Inventory"]["X"][1] ", " COORDS["Inventory"]["X"][2] ", 1}"  ; Click the close button.
        
        Loop 25 {  ; Loop to check if the inventory menu is closed.
            if !isInventoryOpen()  ; Check if the inventory menu is no longer open.
                return  ; Return once the menu is closed.
            Sleep 10  ; Wait before the next check.
        }
    }
}

; ---------------------------------------------------------------------------------
; useItem Function
; Description: Opens the inventory menu, navigates to the items tab, searches for a specified item, and attempts to use the item.
; Operation:
;   - Opens the inventory menu.
;   - Navigates to the items tab.
;   - Clicks the inventory search box.
;   - Enters the search term for the specified item.
;   - Checks if the item is openText.
;   - If the item is openText, clicks to use the item, combines the item, and handles the success window.
;   - Closes the inventory menu and any "Oops" window if open.
; Dependencies:
;   - openInventoryMenu: Function to open the inventory menu.
;   - openItemsTab: Function to open the items tab.
;   - clickInventorySearchBox: Function to click the inventory search box.
;   - enterSearchTerm: Function to enter the search term.
;   - hasItem: Function to check if the item is present.
;   - setCurrentAction: Function to update the current action in the GUI.
;   - leftClickUseItem: Function to click and use the item.
;   - leftClickCombineOne: Function to click the combine button.
;   - leftClickCombineSuccess: Function to click the success window.
;   - closeInventoryMenu: Function to close the inventory menu.
;   - closeOopsWindow: Function to close any "Oops" window.
; Return: None; the function attempts to use the item and handles any relevant windows.
; ---------------------------------------------------------------------------------
useItem(itemToUse) {
    if !openInventoryMenu()  ; Open the inventory menu.
        return

    if !openItemsTab()  ; Open the items tab.
        return

    if !clickInventorySearchBox()  ; Click the inventory search box.
        return
    
    if !enterSearchTerm(itemToUse)  ; Enter the search term.
        return

    if hasItem() {  ; Check if the item is openText.
        rightClickUseItem()
    }
    
    closeInventoryMenu()  ; Close the inventory menu.
    closeOopsWindow()  ; Close any "Oops" window.
}

; ---------------------------------------------------------------------------------
; rightClickUseItem Function
; Description: Sends a right-click event to use the first item in the inventory, checks if the right-click menu is open, performs OCR to find the "Open" option, and clicks it.
; Operation:
;   - Sends a right-click event to the coordinates of the first item in the inventory.
;   - Moves the mouse to the right to ensure the right-click menu appears in view.
;   - Checks if the right-click menu is open by looping and waiting.
;   - Performs OCR on the right-click menu to find the "Open" option.
;   - If the "Open" option is found, moves the mouse to the "Open" option and clicks it.
; Dependencies:
;   - COORDS: Map storing coordinates for various controls and buttons.
;   - SendEvent: AHK command to send input events.
;   - MouseMove: AHK command to move the mouse cursor.
;   - Sleep: AHK command to pause execution for a specified duration.
;   - isRightClickMenuOpen: Function to check if the right-click menu is open.
;   - getOcr: Function to perform OCR on a specified area.
; Return: None; the function sends a right-click event to use the first item in the inventory and clicks the "Open" option in the right-click menu.
; ---------------------------------------------------------------------------------
rightClickUseItem() {
    SendEvent "{Click, " COORDS["Inventory"]["Item1"][1] ", " COORDS["Inventory"]["Item1"][2] ", 1, Right}"  ; Right-click the first item in the inventory.
    MouseMove 500, 0,, "R"  ; Move the mouse to the right.

    ; Loop to check if the right-click menu is open.
    Loop 50 {
        if isRightClickMenuOpen()
            break
        Sleep 50
    }

    ; Perform OCR on the right-click menu.
    ocrObject := getOcr(COORDS["OCR"]["FruitMenuStart"][1], COORDS["OCR"]["FruitMenuStart"][2], 
        COORDS["OCR"]["FruitMenuSize"][1], COORDS["OCR"]["FruitMenuSize"][2], 5, true)
    
    openText := ocrObject.FindStrings("Open",,RegExMatch)  ; Find the "Open" option in the OCR result.
    
    ; If the "Open" option is found, move the mouse to the "Open" option and click it.
    if openText.Length {
        lastOption := [COORDS["OCR"]["FruitMenuStart"][1] + openText[openText.Length].X + (openText[openText.Length].W / 2), 
            COORDS["OCR"]["FruitMenuStart"][2] + openText[openText.Length].Y + (openText[openText.Length].H / 2)]
        
        MouseMove lastOption[1], lastOption[2]
        Sleep 100

        ; Loop to click the "Open" option in the right-click menu.
        ;Loop 50 {
            SendEvent "{Click, " lastOption[1] ", " lastOption[2] ", 1}"
        ;    if isRightClickMenuOpen()
        ;        break
            Sleep 50
        ;}
    }
}


; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
; USER INTERFACE CHECKS
; ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

; ---------------------------------------------------------------------------------
; isInventoryOpen Function
; Description: Determines if the inventory is open by searching for a specific blue cat icon.
; Operation:
;   - Uses the PixelSearch function to look for the blue cat icon within a specified area.
;   - The coordinates and color of the blue cat icon are defined in the INVENTORY_BLUE_CAT_ICON map.
;   - Returns true if the icon is openText, indicating that the inventory is open.
; Dependencies:
;   - INVENTORY_BLUE_CAT_ICON: Map storing coordinates and color information for the blue cat icon.
;   - PixelSearch: AHK function to search for a pixel within a specified area.
; Return:
;   - true if the blue cat icon is openText, indicating the inventory is open.
;   - false if the blue cat icon is not openText.
; ---------------------------------------------------------------------------------
isInventoryOpen() {
    return PixelSearch(&openTextX, &openTextY,  ; Perform pixel search within specified coordinates and color.
        INVENTORY_BLUE_CAT_ICON["Start"][1], INVENTORY_BLUE_CAT_ICON["Start"][2],  
        INVENTORY_BLUE_CAT_ICON["End"][1], INVENTORY_BLUE_CAT_ICON["End"][2],  
        INVENTORY_BLUE_CAT_ICON["Colour"], INVENTORY_BLUE_CAT_ICON["Tolerance"]) 
}

; ---------------------------------------------------------------------------------
; isItemsTabOpen Function
; Description: Determines if the items tab is open by performing OCR on a specified area and searching for specific text.
; Operation:
;   - Uses the GetOcr function to perform OCR on a defined area of the screen.
;   - The coordinates and scale for OCR are defined in the ITEMS_TAB_BOOSTS_TEXT map.
;   - Checks the recognized text for any keywords related to the items tab.
;   - Returns true if any of the keywords are openText, indicating that the items tab is open.
; Dependencies:
;   - ITEMS_TAB_BOOSTS_TEXT: Map storing coordinates and scale information for the OCR area.
;   - GetOcr: Function to perform OCR on a specified rectangular area.
;   - RegExMatch: AHK function to match a regular expression against a string.
; Return:
;   - true if any of the keywords are openText in the OCR text, indicating the items tab is open.
;   - false if none of the keywords are openText.
; ---------------------------------------------------------------------------------
isItemsTabOpen() {
    OcrText := GetOcr(ITEMS_TAB_BOOSTS_TEXT["X"], ITEMS_TAB_BOOSTS_TEXT["Y"], 
        ITEMS_TAB_BOOSTS_TEXT["W"], ITEMS_TAB_BOOSTS_TEXT["H"], 
        ITEMS_TAB_BOOSTS_TEXT["Scale"])  ; Perform OCR on the specified area.
    return RegExMatch(OcrText, "i)(boosts|flags|buffs|gifts|boxes|keys|vouchers|charms|farming|tools|miscellaneous)")  ; Check for keywords.
}

; ---------------------------------------------------------------------------------
; isSearchBoxSelected Function
; Description: Determines if the search box is selected by searching for a specific cursor indicator.
; Operation:
;   - Uses the PixelSearch function to look for the cursor indicator within a specified area.
;   - The coordinates and color of the cursor indicator are defined in the INVENTORY_SEARCH_CURSOR map.
;   - Returns true if the cursor indicator is openText, indicating that the search box is selected.
; Dependencies:
;   - INVENTORY_SEARCH_CURSOR: Map storing coordinates and color information for the cursor indicator.
;   - PixelSearch: AHK function to search for a pixel within a specified area.
; Return:
;   - true if the cursor indicator is openText, indicating the search box is selected.
;   - false if the cursor indicator is not openText.
; ---------------------------------------------------------------------------------
isSearchBoxSelected() {
    return PixelSearch(&openTextX, &openTextY,  ; Perform pixel search within specified coordinates and color.
        INVENTORY_SEARCH_CURSOR["Start"][1], INVENTORY_SEARCH_CURSOR["Start"][2], 
        INVENTORY_SEARCH_CURSOR["End"][1], INVENTORY_SEARCH_CURSOR["End"][2],  
        INVENTORY_SEARCH_CURSOR["Colour"], INVENTORY_SEARCH_CURSOR["Tolerance"])  
}

; ---------------------------------------------------------------------------------
; isSearchTermEntered Function
; Description: Determines if the search term is entered by searching for a specific indicator.
; Operation:
;   - Uses the PixelSearch function to look for the indicator within a specified area.
;   - The coordinates and color of the indicator are defined in the INVENTORY_SEARCH_TERM map.
;   - Returns true if the indicator is openText, indicating that the search term is entered.
; Dependencies:
;   - INVENTORY_SEARCH_TERM: Map storing coordinates and color information for the search term indicator.
;   - PixelSearch: AHK function to search for a pixel within a specified area.
; Return:
;   - true if the indicator is openText, indicating the search term is entered.
;   - false if the indicator is not openText.
; ---------------------------------------------------------------------------------
isSearchTermEntered() {
    return PixelSearch(&openTextX, &openTextY,  ; Perform pixel search within specified coordinates and color.
        INVENTORY_SEARCH_TERM["Start"][1], INVENTORY_SEARCH_TERM["Start"][2],  
        INVENTORY_SEARCH_TERM["End"][1], INVENTORY_SEARCH_TERM["End"][2],  
        INVENTORY_SEARCH_TERM["Colour"], INVENTORY_SEARCH_TERM["Tolerance"])  
}

; ---------------------------------------------------------------------------------
; isRightClickMenuOpen Function
; Description: Checks if the right-click context menu is open by performing a pixel search within a specified area.
; Operation:
;   - Uses the PixelSearch function to look for the context menu border within defined coordinates.
;   - Returns true if the pixel matching the specified color and tolerance is openText, indicating the menu is open.
; Dependencies: 
;   - ITEM_CONTEXT_MENU_BORDER: Array containing the coordinates and color information for the context menu border.
; Return: Boolean; true if the context menu is open, false otherwise.
; ---------------------------------------------------------------------------------
isRightClickMenuOpen() {
    return PixelSearch(&openTextX, &openTextY,  ; Perform a pixel search.
        ITEM_CONTEXT_MENU_BORDER["Start"][1], ITEM_CONTEXT_MENU_BORDER["Start"][2],  ; Starting coordinates for the search area.
        ITEM_CONTEXT_MENU_BORDER["End"][1], ITEM_CONTEXT_MENU_BORDER["End"][2],  ; Ending coordinates for the search area.
        ITEM_CONTEXT_MENU_BORDER["Colour"], ITEM_CONTEXT_MENU_BORDER["Tolerance"])  ; Color and tolerance for the search.
}

; ---------------------------------------------------------------------------------
; isOopsWindowOpen Function
; Description: Determines if the "Oops" window is open by searching for a specific question mark indicator.
; Operation:
;   - Uses the PixelSearch function to look for the question mark indicator within a specified area.
;   - The coordinates and color of the question mark indicator are defined in the OOPS_ERROR_QUESTION_MARK map.
;   - Returns true if the question mark indicator is openText, indicating that the "Oops" window is open.
; Dependencies:
;   - OOPS_ERROR_QUESTION_MARK: Map storing coordinates and color information for the question mark indicator.
;   - PixelSearch: AHK function to search for a pixel within a specified area.
; Return:
;   - true if the question mark indicator is openText, indicating the "Oops" window is open.
;   - false if the question mark indicator is not openText.
; ---------------------------------------------------------------------------------
isOopsWindowOpen() {
    return PixelSearch(&openTextX, &openTextY,  ; Perform pixel search within specified coordinates and color.
        OOPS_ERROR_QUESTION_MARK["Start"][1], OOPS_ERROR_QUESTION_MARK["Start"][2], 
        OOPS_ERROR_QUESTION_MARK["End"][1], OOPS_ERROR_QUESTION_MARK["End"][2],  
        OOPS_ERROR_QUESTION_MARK["Colour"], OOPS_ERROR_QUESTION_MARK["Tolerance"])  
}

; ---------------------------------------------------------------------------------
; hasItem Function
; Description: Determines if an item is present by searching for a specific pixel color at the item's coordinates.
; Operation:
;   - Uses the PixelSearch function to look for a specific pixel color at the coordinates defined for the item.
;   - The coordinates for the item are defined in the COORDS["Inventory"]["Item1"] map entry.
;   - Returns true if the pixel color is openText, indicating the item is present.
; Dependencies:
;   - COORDS: Map storing coordinates for various controls and items.
;   - PixelSearch: AHK function to search for a pixel within a specified area.
; Return:
;   - true if the pixel color is not openText, indicating the item is present.
;   - false if the pixel color is openText.
; ---------------------------------------------------------------------------------
hasItem() {
    return !PixelSearch(&X, &Y,  ; Perform pixel search at specified coordinates and color.
        COORDS["Inventory"]["Item1"][1], COORDS["Inventory"]["Item1"][2],  
        COORDS["Inventory"]["Item1"][1], COORDS["Inventory"]["Item1"][2],  
        0xFFFFFF, 5)  ; Search for the color 0xFFFFFF with a tolerance of 5.
}