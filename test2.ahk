
Result := ""
; Hàm tìm kiếm file trong một thư mục và các thư mục con
FindFile(FileName, StartDir) {
    Loop Files, StartDir "\*RobloxPlayerBeta.exe", "R"  ; Recurse into subfolders.
        {
            Result :=A_LoopFilePath
            return Result
        }
}

; Đường dẫn mặc định để tìm kiếm RobloxPlayerBeta.exe



robloxPath := FindFile("RobloxPlayerBeta", "C:\Program Files (x86)\Roblox\Versions")


if (robloxPath != "") {
    MsgBox("Đã tìm thấy RobloxPlayerBeta.exe tại: " robloxPath)

    Run(robloxPath)
} else {
    robloxPath := FindFile("RobloxPlayerBeta", "C:\Users\" A_UserName "\AppData\Local\Roblox\Versions")
    if (robloxPath == ""){
        MsgBox("khong tim thay")
    }
}
; "C:\Program Files (x86)\Roblox\Versions\version-8aa36bbf0eb1494a\RobloxPlayerBeta.exe"
; C:\Users\" A_UserName "\AppData\Local\Roblox\Versions