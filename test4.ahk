#Requires AutoHotkey v2.0

; Tạo GUI
mainGUI := Gui()
startButton := mainGUI.Add("Button", "x200 y16 w64 h49", "▸")

; Gán sự kiện bấm nút cho startButton
startButton.OnEvent("Click", onButtonClick)


onButtonClick(*){
    input := "abc" ; Ví dụ giá trị đầu vào
    if (!validateInput(input)) {
        shakeButton(startButton)
    } else {
        MsgBox "Input hợp lệ: " input
    }
}

mainGUI.Show()

; Hàm kiểm tra giá trị đầu vào
validateInput(value) {
    return IsNumber(value) && value != 0
}

; Hàm lắc nút
shakeButton(button) {
    button.GetPos(&x, &y)

    ; Lắc nút theo trục x
    loop 4 {
        button.Move(x + 5, y) ; Dịch sang phải
        Sleep(50)
        button.Move(x - 5, y) ; Dịch sang trái
        Sleep(50)
    }

    ; Trả về vị trí ban đầu
    button.Move(x, y)
}
