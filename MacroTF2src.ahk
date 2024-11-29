#Requires AutoHotkey v2.0
#SingleInstance Force
#Include %A_ScriptDir%\Lib\FindImage.ahk
#Include %A_ScriptDir%\Lib\FileRead.ahk
#Include %A_ScriptDir%\mainGUI.ahk
#Include %A_ScriptDir%\Lib\FileWrite.ahk


class Metadata {
    static name := "Macro Roblox"
    static version := "v4.0"
}
class filePath {
    static cus := A_ScriptDir "\config\MacroConfig.ini"
    static src := A_ScriptFullPath
    static roblox := ""
    static data := A_ScriptDir "\config\MacroData.txt"
    static AHK := ReadKeyWordFromFile(filePath.cus, "AHKfilePath")
}
TraySetIcon(A_WorkingDir "\Ico\mainIcon.ico")


class Hotkey {
    static stopkey := "PgUp"
    static TinyTaskHotkey := "0"
}

class MacroParam {
    static LoopCount := "0"
    static EstimatedTime := "60"
}
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
    {
        try{
            if A_IsCompiled
                Run '*RunAs "' A_ScriptFullPath '" /restart'
            else
                Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
        }catch{
            Msgbox "This program requires Admin rights to start.", Metadata.name
        }
        ExitApp
    }
; AHK := "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

; Msgbox AHK
; A_Clipboard := AHK
; if !A_IsAdmin{ ; run as Administrator
;     try {
;         if (SubStr(A_ScriptFullPath, -3) = "exe"){
;             Run("*RunAs " filePath.src) ; Chạy lại chính nó với quyền Admin
;             ExitApp
;         }else{
;             Run( "*RunAs " AHK " " filePath.src)
;             ExitApp
;         }
;     }catch{
;         Msgbox "This program requires Admin rights to start.", Metadata.name
;         ExitApp
;     }
; }

MacroPause(*){
    if (GetKeyState(Hotkey.stopkey, "P")) {
        confirm := MsgBox("Are you sure to close the program? ", "Macro Stopped", 262164)
        if (confirm == 'No') {
            return true
        }else{
            ExitApp
            return false
        }
    }
}
If A_IsAdmin{
    mainGUI := mainGUIcall()
    mainGUI.Show ("w623 h514")
}



AutoReadyModeFunc(*){
    ; global IsAutoReady := true
    ; loopCurrent := 1
    ; global userInput := 1
    ; global roundcount := 0
    ; GUIingame()
    ; SetTimer(Deathcount, 1000)
    ; if WinExist('Roblox'){
    ;     WinActivate
    ; }
    ; While (globalDeath ==0){
    ;     ReadyUp
    ; }
    ; ExitApp
    
}
AutoClickGUIFunc(*){
    Run("AutoClick.exe")
    mainGUI.Minimize()
}
main(){
    Msgbox "đã vào MainWindow"
    x1 := ReadKeyWordFromFile(filePath.cus, "x1")
    y1 := ReadKeyWordFromFile(filePath.cus, "y1")
    MouseMove x1, y1
}
