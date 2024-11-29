#Requires AutoHotkey v2.0
SendMode ("InputThenPlay")
CoordMode "Mouse", "Screen"
#SingleInstance Force
ScriptfilePath := A_ScriptFullPath

Admin(*){
    if !A_IsAdmin{ ; run as Administrator
        if (SubStr(A_ScriptFullPath, -3) = "exe"){
            exePath := A_ScriptFullPath ; Lấy đường dẫn của tệp .exe
            Run("*RunAs " exePath) ; Chạy lại chính nó với quyền Admin
            ExitApp
        }else{
            Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " ScriptfilePath)
            ExitApp
        }
    }
}
AutoClickGUIFunc(*){
    global clicking := false, Clickinterval, StartClickButton, StopClickButton, Isclose := false, whichmouseClick, DropDownList1, SmartClick
    TraySetIcon(A_WorkingDir "\Ico\ACicon.ico")
    autoclickGUI := Gui()
    autoclickGUI.MyName := "autoclickGUI"
    autoclickGUI.SetFont("s8", "Segoe UI")
    autoclickGUI.SetFont("c484b6a")
	autoclickGUI.Opt("-MaximizeBox +AlwaysOnTop -DPIScale")
	autoclickGUI.Add("Text", "x16 y8 w74 h26 +0x200", "Click interval:")
	Clickinterval := autoclickGUI.Add("Edit", "x88 y8 w120 h26")
    Clickinterval.text := "100"
	autoclickGUI.Add("Text", "x208 y8 w25 h26 +0x200", "ms")
	StartClickButton := autoclickGUI.Add("Radio", "x16 y80 w104 h23", "Start")
	StopClickButton := autoclickGUI.Add("Radio", "x128 y80 w104 h23", "Stop")
    DropDownList1 := autoclickGUI.Add("DropDownList", "x112 y48 w120", ["Left", "Right", "Middle"])
	SmartClick := autoclickGUI.Add("CheckBox", "x16 y105 w104 h23", "Smart Click")
    if !A_IsAdmin{
    AdminRQ := autoclickGUI.Add("CheckBox", "x128 y105 w104 h23", "Admin")
    autoclickGUI.Title := "Auto Click"
    AdminRQ.OnEvent("Click", (Admin))
    }else{
        autoclickGUI.Title := "Auto Click (Admin)"
    }
    DropDownList1.Text := "Left"
	autoclickGUI.Add("Text", "x16 y48 w95 h22 +0x200", "Mouse Button:")
	StartClickButton.OnEvent("Click", StartClick)
	StopClickButton.OnEvent("Click", CancelClick)
    StopClickButton.value := 1
    SmartClick.value := 1
	DropDownList1.OnEvent("Change", (*) => whichmouseClick := DropDownList1.Value)
    
	
    autoclickGUI.Show("w248 h132")
    autoclickGUI.OnEvent("Close", MyGui_Close)
    autoclickGUI.Restore()
    Loop {
        if (Isclose){
            break
        }
        if (GetKeyState("PgUp", "P")){
            if (!clicking){
                StartClickButton.value := 1
                Sleep(200)
                StartClick
            }else {
                StopClickButton.value := 1
                Sleep(200)
                CancelClick
            }
        }
    }
    return  
}

StartClick(*){
    global clicking := true, StartClickButton, StopClickButton, Isclose, whichmouseClick, DropDownList1, SmartClick, oldXclick := "", oldYclick := ""
    whichmouseClick := DropDownList1.Value
    if (Clickinterval.value == ""){
        StopClickButton.value := 1
        Sleep(200)
        CancelClick
        return
    }

    totalSleepDuration := 200000000
    sleepInterval := Clickinterval.value
    elapsed := 0
    oldElapsed := 0
    SetTimer(SmartAI, 50)
    While (elapsed < totalSleepDuration and clicking and !Isclose) {
        
        if (GetKeyState("PgUp", "P")) {
            StopClickButton.value := 1
            Sleep(200)
            CancelClick
            break
        }
        
        if (elapsed == 500 || (sleepInterval > 500 and elapsed == sleepInterval)){
            MouseGetPos &xpos, &ypos
            oldXclick := xpos
            oldYclick := ypos
        }
        if (SmartClick.value == 1 and elapsed >= 500){
            switch whichmouseClick{
                case "1": Click
                case "2": SendEvent "{RButton}"
                case "3": SendEvent "{MButton}"
            }
            
            
        }else if (SmartClick.value == 0){
            switch whichmouseClick{
                case "1": Click
                case "2": SendEvent "{RButton}"
                case "3": SendEvent "{MButton}"
            }
        }
        Sleep sleepInterval
        elapsed += sleepInterval
    }
    SmartAI(*){
        global oldXclick, oldYclick
        MouseGetPos &xpos, &ypos
        if (oldXclick == ""){
            return
        }
        if !Isclose and (xpos < (oldXclick -300) || xpos > (oldXclick +300)){
            StopClickButton.value := 1
            Sleep(200)
            CancelClick
        }
        if !Isclose and (ypos < (oldYclick -300) || ypos > (oldYclick +300)){
            StopClickButton.value := 1
            Sleep(200)
            CancelClick
        }
        if (elapsed >=oldElapsed){
            oldElapsed := elapsed
            MouseGetPos &xpos, &ypos
            oldXclick := xpos
            oldYclick := ypos
        }
    }
    return
}

CancelClick(*){
    global clicking := false
    ToolTip( "Stop Auto Click")
    SetTimer () => ToolTip(), -3000
}

MyGui_Close(thisGui) {
    ExitApp
}

main(*){
    AutoClickGUIFunc()
}

main()