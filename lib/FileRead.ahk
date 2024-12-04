#Requires AutoHotkey v2.0

ReadKeyWordFromFile(filePath, keyword) {
    if FileExist(filePath){
        fileContent := FileRead(filePath) ; Đọc toàn bộ nội dung file
        for line in StrSplit(fileContent, "`n") { ; Duyệt từng dòng
            if InStr(line, keyword " := ") = 1 { ; Kiểm tra dòng bắt đầu bằng từ khóa
                global value := StrSplit(line, " := ")[2] ; Lấy giá trị sau dấu :=
                return value
            }
        }
    }
    return "0" ; Trả về chuỗi trống nếu không tìm thấy từ khóa
}

Base64Decode(s) {
    ; Trim whitespace and remove mime type.
    s := Trim(s)
    s := RegExReplace(s, "(?i)^.*?;base64,")

    ; Retrieve the size of bytes from the length of the base64 string.
    size := StrLen(RTrim(s, "=")) * 3 // 4
    bin := Buffer(size)

    ; Place the decoded base64 string into a binary buffer.
    flags := 0x1 ; CRYPT_STRING_BASE64
    DllCall("crypt32\CryptStringToBinary", "str", s, "uint", 0, "uint", flags, "ptr", bin, "uint*", size, "ptr", 0, "ptr", 0)

    ; Must reinterpret the binary bytes from UTF-8.
    return StrGet(bin, size, "UTF-8")
}


Base64Encode(s) {
    ; Convert the input string into a byte string of UTF-8 characters.
    size := StrPut(s, "UTF-8")
    bin := Buffer(size)
    StrPut(s, bin, "UTF-8")
    size := size - 1 ; A binary does not have a null terminator

    ; Calculate the length of the base64 string.
    length := 4 * Ceil(size / 3) + 1   ; A string has a null terminator
    VarSetStrCapacity(&str, length)    ; Allocates a ANSI or Unicode string
    ; This appends 1 or 2 zero byte null terminators respectively.

    ; Passing a pre-allocated string buffer prevents an additional memory copy via StrGet.
    flags := 0x40000001 ; CRYPT_STRING_NOCRLF | CRYPT_STRING_BASE64
    DllCall("crypt32\CryptBinaryToString", "ptr", bin, "uint", size, "uint", flags, "str", str, "uint*", &length)

    ; Returns an AutoHotkey native string.
    return str
}
