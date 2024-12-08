
CheckForUpdates() {
    Url := "https://api.github.com/repos/vezyldicode/EasyHotKey/releases/latest"
    HttpObj := ComObject("WinHttp.WinHttpRequest.5.1")
    HttpObj.Open("GET", Url, True)
    HttpObj.Send()
    HttpObj.WaitForResponse()
    Response := HttpObj.ResponseText
    WriteValueToFile("text.txt", Response)
    ; Parse JSON (you may need a JSON library for this)
    filecontent := FileRead("text.txt")
    if filecontent != Response{
        Msgbox
    }else Msgbox "deptrai"
}
WriteValueToFile(filePath, content) { ; ghi file
    FileAppend(content, filePath) ; Thêm nội dung vào file
}

CheckForUpdates