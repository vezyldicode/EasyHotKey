#Requires AutoHotkey v2.0

; Khai báo các biến với giá trị cụ thể
value1 := 10
value2 := 14
value3 := 17
value4 := 20
value5 := 25

; Khai báo biến roundcount
roundcount := 14  ; Bạn có thể thay đổi giá trị này theo nhu cầu

; Hàm tìm giá trị gần nhất lớn hơn hoặc bằng roundcount
FindClosest(roundcount) {
    closest := 0
    ; Duyệt qua từng giá trị
    if (value1 >= roundcount && (closest = 0 || value1 < closest))
        closest := value1
    if (value2 >= roundcount && (closest = 0 || value2 < closest))
        closest := value2
    if (value3 >= roundcount && (closest = 0 || value3 < closest))
        closest := value3
    if (value4 >= roundcount && (closest = 0 || value4 < closest))
        closest := value4
    if (value5 >= roundcount && (closest = 0 || value5 < closest))
        closest := value5
    return closest
}

; Gọi hàm và hiển thị kết quả
closestValue := FindClosest(roundcount)

if (closestValue > 0) {
    MsgBox "Giá trị gần nhất lớn hơn hoặc bằng " roundcount " là: " closestValue
} else {
    MsgBox "Không có giá trị nào lớn hơn hoặc bằng " roundcount
}