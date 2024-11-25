#Requires AutoHotkey v2.0


SendMode ("InputThenPlay")
ScriptfilePath := A_ScriptFullPath
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

; sleep(10000)
if WinExist('TinyTask'){
    WinActivate
}
sleep(5000)
; SendEvent "{F8 down}"
SendEvent "{F12 down}"
sleep(200)
SendEvent "{F12 up}"
; SendEvent "{F8 up}"