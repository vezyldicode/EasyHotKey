#Requires AutoHotkey v2.0
ScriptfilePath := A_ScriptFullPath
; if !A_IsAdmin{ ; run as Administrator
;     Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " ScriptfilePath)
;     ExitApp
; }
if !A_IsAdmin { ; Kiểm tra nếu chưa có quyền Admin
    try {
        if (SubStr(A_ScriptFullPath, -3) = "exe"){
            exePath := A_ScriptFullPath ; Lấy đường dẫn của tệp .exe
            Run("*RunAs " exePath) ; Chạy lại chính nó với quyền Admin
        }else{
            Run( "*RunAs " "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" " " ScriptfilePath)
        }

    }
    catch {
        MsgBox("Không thể yêu cầu quyền Admin.")
        ExitApp
    }
}
; Tạo GUI với tên myGui
myGui := Gui()
myGui.BackColor := "0x000040"
myGui.SetFont("cWhite")
myGui.SetFont("s30", "Tahoma")
myGui.OnEvent("Close", (*) => ExitApp()) ; Đóng ứng dụng khi tắt GUI

; Thêm "nhện" (biểu tượng)
Spider := myGui.Add("Text", "x100 y100 ", "🕷️") ; Ký tự nhện Unicode
Spider.OnEvent("Click", (*) => ClimbUp()) ; Sự kiện nhấn chuột vào nhện

; Tọa độ ban đầu
SpiderX := 100
SpiderY := 100
Climbing := false

; Hiển thị GUI
myGui.Show("w300 h300")

; Timer di chuyển nhện xuống
SetTimer(() => MoveSpiderDown(), 50)

; Thoát bằng ESC
Hotkey("Esc", (*) => ExitApp())

MoveSpiderDown() {
    global Spider, SpiderY, Climbing
    if (Climbing) ; Nếu đang bò lên thì không đi xuống
        return
    SpiderY += 1
    if (SpiderY > 250) ; Khi chạm đáy, reset về trên
        SpiderY := 100
    Spider.Move(SpiderX, SpiderY)
}

ClimbUp() {
    global Spider, SpiderY, Climbing
    if (Climbing) ; Nếu đang bò lên rồi thì không lặp lại
        return
    Climbing := true
    Loop 50 {
        SpiderY -= 2
        Spider.Move(SpiderX, SpiderY)
        Sleep(20)
    }
    Climbing := false
}
