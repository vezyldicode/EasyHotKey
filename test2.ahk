; Khai báo các biến
value1 := "A"
value2 := "B"
value3 := "C"
value4 := "D"
value5 := "E"
value6 := "F"
value7 := "G"
value8 := "H"
value9 := "I"

; Gộp các biến vào mảng
something := Array() ; Tạo một mảng rỗng

Loop 9 ; Lặp từ 1 đến 9
{
    varName := "value" A_Index ; Tạo tên biến động như "value1", "value2", ...
    something.Push(%varName%) ; Thêm giá trị của biến vào mảng
}

; Hiển thị nội dung của mảng
for index, value in something
    MsgBox "Index " index ": " value
MsgBox something[1]