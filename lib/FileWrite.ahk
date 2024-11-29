#Requires AutoHotkey v2.0

WriteValueToFile(filePath, content) { ; ghi file
    FileAppend(content "`n", filePath) ; Thêm nội dung vào file
}