#Requires AutoHotkey v2.0

ReadKeyWordFromFile(filePath, keyword) {
    fileContent := FileRead(filePath) ; Đọc toàn bộ nội dung file
    for line in StrSplit(fileContent, "`n") { ; Duyệt từng dòng
        if InStr(line, keyword " := ") = 1 { ; Kiểm tra dòng bắt đầu bằng từ khóa
            global value := StrSplit(line, " := ")[2] ; Lấy giá trị sau dấu :=
            return value
        }
    }
    return "0" ; Trả về chuỗi trống nếu không tìm thấy từ khóa
}
