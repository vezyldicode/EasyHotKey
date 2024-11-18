#Requires AutoHotkey v2.0


/*
Macro The final stand 2 Roblox
Author: Tuan Viet Nguyen
https://github.com/vezyldicode
Date: 10.11.2024
Description: Chương trình này chứa các hàm để thực hiện lệnh macro trong career mode game the final stand 2.

---
Convention
1 lần tiến lên (w key) được tính bằng 1 cDis, mặc định bằng 1400ms .Quãng đường di chuyển từ nhà lên đến chỗ setup mặc định là 30 cDis

---
Note when using for the first time
1. sửa lại các vị trí x, y và màu pixel theo chú thích
2. thay đổi đường dẫn roblox và file source (2 chương trình BẮT BUỘC phải chạy dưới quyền Admin, đã được tích hợp sẵn trong code)
3. có thể cần phải sửa lại 4 vị trí lấy mã màu đen khi chết
4. sửa lại thời gian doorDis và centerDis


Note each time use
1. Nên chạy roblox ở chế độ fullscreen. Nếu không có thể xảy ra lỗi nhận sai cửa sổ trên màn hình
2. Đảm bảo rằng KHÔNG có bất cứ ứng dụng hay chương trình nào đang ở chế độ always on top
3. tắt hoàn toàn thông báo window, nếu không chương trình sẽ không thể nhận và bấm nút ready up
4. tắt hoàn toàn Shift Lock và Toggle Sprint trong cài đặt Roblox và game
*/


SendMode ("InputThenPlay")

; tạo file macro customization
cusFilePath := "MacroCustomization.ini"
If !FileExist(cusFilePath) || FileGetSize(cusFilePath) = 0 {
    if FileExist(cusFilePath) ; Kiểm tra sự tồn tại trước khi xóa
        FileDelete(cusFilePath) ; Xóa file nếu có nhưng trống
    FileAppend("", cusFilePath) ; Tạo file mới
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, 'path to AutoHotkey.exe file')
    WriteValueToFile(cusFilePath, 'AHKfilePath := "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"')
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, 'path to RobloxPlayerBeta.exe file')
    WriteValueToFile(cusFilePath, 'robloxPath := ')
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "Mouse position on screen at last played game position")
    WriteValueToFile(cusFilePath, "x1 := 0")
    WriteValueToFile(cusFilePath, "y1 := 0")
    WriteValueToFile(cusFilePath, "c1 := 0x202227")
    WriteValueToFile(cusFilePath, "Mouse position at play game button")
    WriteValueToFile(cusFilePath, "x2 := 0")
    WriteValueToFile(cusFilePath, "y2 := 0")
    WriteValueToFile(cusFilePath, "c2 := 0x00B06F")
    WriteValueToFile(cusFilePath, "c21 := 0x009F64")
    WriteValueToFile(cusFilePath, "mouse position on white text in private game option")
    WriteValueToFile(cusFilePath, "x3 := 0")
    WriteValueToFile(cusFilePath, "y3 := 0")
    WriteValueToFile(cusFilePath, "c3 := 0xFFFFFF")
    WriteValueToFile(cusFilePath, "mouse position at the green text in career mode option")
    WriteValueToFile(cusFilePath, "x4 := 0")
    WriteValueToFile(cusFilePath, "y4 := 0")
    WriteValueToFile(cusFilePath, "c4 := 0x00A5FF")
    WriteValueToFile(cusFilePath, "c41 := 0x00527F")
    WriteValueToFile(cusFilePath, "Mouse position on the white text in the private game creation button")
    WriteValueToFile(cusFilePath, "x5 := 0")
    WriteValueToFile(cusFilePath, "y5 := 0")
    WriteValueToFile(cusFilePath, "c5 := 0xFFFFFF")
    WriteValueToFile(cusFilePath, "mouse position on white text in play button")
    WriteValueToFile(cusFilePath, "x6 := 0")
    WriteValueToFile(cusFilePath, "y6 := 0")
    WriteValueToFile(cusFilePath, "c6 := 0xFFFFFF")
    WriteValueToFile(cusFilePath, "Mouse position at the white text in the Ready button (recommended to choose the letter R to avoid being recognized as counting kills")
    WriteValueToFile(cusFilePath, "x7 := 0")
    WriteValueToFile(cusFilePath, "y7 := 0")
    WriteValueToFile(cusFilePath, "c7 := 0xA6A6A6")
    WriteValueToFile(cusFilePath, "Position the mouse on the white text in the view change button (right arrow)")
    WriteValueToFile(cusFilePath, "x8 := 0")
    WriteValueToFile(cusFilePath, "y8 := 0")
    WriteValueToFile(cusFilePath, "c8 := 0xFFFFFF")
    WriteValueToFile(cusFilePath, "Mouse position at yellow text when receiving first round reward (recommended not to use perk that can change the amount received in first round)")
    WriteValueToFile(cusFilePath, "x9 := 0")
    WriteValueToFile(cusFilePath, "y9 := 0")
    WriteValueToFile(cusFilePath, "c9 := 0xFFB400")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "4 desired mouse positions to set Normal gear")
    WriteValueToFile(cusFilePath, "x10 := 0")
    WriteValueToFile(cusFilePath, "y10 := 0")
    WriteValueToFile(cusFilePath, "x11 := 0")
    WriteValueToFile(cusFilePath, "y11 := 0")
    WriteValueToFile(cusFilePath, "x12 := 0")
    WriteValueToFile(cusFilePath, "y12 := 0")
    WriteValueToFile(cusFilePath, "x13 := 0")
    WriteValueToFile(cusFilePath, "y13 := 0")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "4 positions on the screen will have black space when losing the match")
    WriteValueToFile(cusFilePath, "x14 := 0")
    WriteValueToFile(cusFilePath, "y14 := 0")
    WriteValueToFile(cusFilePath, "x15 := 0")
    WriteValueToFile(cusFilePath, "y15 := 0")
    WriteValueToFile(cusFilePath, "x16 := 0")
    WriteValueToFile(cusFilePath, "y16 := 0")
    WriteValueToFile(cusFilePath, "x17 := 0")
    WriteValueToFile(cusFilePath, "y17 := 0")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "Position the mouse on the screen at the position of special gear 2 (recommended in the middle of the character)")
    WriteValueToFile(cusFilePath, "xs2 := 0")
    WriteValueToFile(cusFilePath, "ys2 := 0")
    WriteValueToFile(cusFilePath, "doorDis := 2310")
    WriteValueToFile(cusFilePath, "centerDis := 2440")
}

;tạo file data
dataFilePath := "MacroData.txt"
If !FileExist(dataFilePath) || FileGetSize(dataFilePath) = 0 {
    if FileExist(dataFilePath) ; Kiểm tra sự tồn tại trước khi xóa
        FileDelete(dataFilePath) ; Xóa file nếu có nhưng trống
    FileAppend("", dataFilePath) ; Tạo file mới
    Loop 16{
        num := A_Index
        WriteValueToFile(dataFilePath, "input" num " := 0" )
    }
}

hisFilePath := "MacroHistory.txt"
If !FileExist(hisFilePath){
    FileAppend("", hisFilePath) ; Tạo file mới
}


 
; chọn game pixel màu trắng
global x1 := ReadValueFromFile(cusFilePath, "x1")
global y1 := ReadValueFromFile(cusFilePath, "y1")
global c1 := ReadValueFromFile(cusFilePath, "c1")

; nút vào game màu xanh góc trên bên trái
global x2 := ReadValueFromFile(cusFilePath, "x2")
global y2 := ReadValueFromFile(cusFilePath, "y2")
global c2 := ReadValueFromFile(cusFilePath, "c2")
global c21 := ReadValueFromFile(cusFilePath, "c21")

; bấm vào private game pixel màu trắng
global x3 := ReadValueFromFile(cusFilePath, "x3")
global y3 := ReadValueFromFile(cusFilePath, "y3")
global c3 := ReadValueFromFile(cusFilePath, "c3")

; bấm vào career mode màu xanh dương
global x4 := ReadValueFromFile(cusFilePath, "x4")
global y4 := ReadValueFromFile(cusFilePath, "y4")
global c4 := ReadValueFromFile(cusFilePath, "c4")
global c41 := ReadValueFromFile(cusFilePath, "c41")

; bấm vào tạo Private game
global x5 := ReadValueFromFile(cusFilePath, "x5")
global y5 := ReadValueFromFile(cusFilePath, "y5")
global c5 := ReadValueFromFile(cusFilePath, "c5")

; bấm vào nút play trong trận
global x6 := ReadValueFromFile(cusFilePath, "x6")
global y6 := ReadValueFromFile(cusFilePath, "y6")
global c6 := ReadValueFromFile(cusFilePath, "c6")

; bấm nút Ready (dùng pixel màu trắng ở ngay chữ R - tránh bị trùng vào Kill)
global x7 := ReadValueFromFile(cusFilePath, "x7")
global y7 := ReadValueFromFile(cusFilePath, "y7")
global c7 := ReadValueFromFile(cusFilePath, "c7")

; bấm nút sang phải 3 lần pixel màu trắng ở mũi tên
global x8 := ReadValueFromFile(cusFilePath, "x8")
global y8 := ReadValueFromFile(cusFilePath, "y8")
global c8 := ReadValueFromFile(cusFilePath, "c8")

; vị trí nhận tiền round đầu tiên pixel màu vàng
global x9 := ReadValueFromFile(cusFilePath, "x9")
global y9 := ReadValueFromFile(cusFilePath, "y9")
global c9 := ReadValueFromFile(cusFilePath, "c9")

; thời gian di chuyển các chặng
global doorDis := ReadValueFromFile(cusFilePath, "doorDis")
global centerDis := ReadValueFromFile(cusFilePath, "centerDis")



; 4 vị trí đặt đồ
global x10 := ReadValueFromFile(cusFilePath, "x10")
global y10 := ReadValueFromFile(cusFilePath, "y10")
global x11 := ReadValueFromFile(cusFilePath, "x11")
global y11 := ReadValueFromFile(cusFilePath, "y11")
global x12 := ReadValueFromFile(cusFilePath, "x12")
global y12 := ReadValueFromFile(cusFilePath, "y12")
global x13 := ReadValueFromFile(cusFilePath, "x13")
global y13 := ReadValueFromFile(cusFilePath, "y13")

; 4 vị trí màu đen báo hiệu khi thua
global x14 := ReadValueFromFile(cusFilePath, "x14")
global y14 := ReadValueFromFile(cusFilePath, "y14")
global x15 := ReadValueFromFile(cusFilePath, "x15")
global y15 := ReadValueFromFile(cusFilePath, "y15")
global x16 := ReadValueFromFile(cusFilePath, "x16")
global y16 := ReadValueFromFile(cusFilePath, "y16")
global x17 := ReadValueFromFile(cusFilePath, "x17")
global y17 := ReadValueFromFile(cusFilePath, "y17")


;YOU SHOULD ASK THE AUTHOR BEFORE EDITING THE FOLLOWING VARIABLES
global backwardtime := 0 ; số lần di chuyển lùi về, mặc định ban đầu là 0
global rechargeWait ;biến boolean quy định có đang đợi recharge hay không
global SpecialGear1SetupDone := true ;biến boolean quy định đã hoàn thành xong setup special gear 1 (mặc định là true cho cả trường hợp không có special gear 1)
global getroundsSurvivedvalue := 0 ;lấy số round đã sống sót được ở lần macro trước để hiển thị lên GUI (mặc định là 0 cho lần chạy đầu tiên)
global firsttimesetup := true ;biến boolean quy định đây có phải lần đầu đặt special gear 1 hay không
global cDis := 0 ;quy định khoảng cách từ vị trí xuất phát (nhà) đến chỗ setup (bắt đầu từ 0)
global StopFlag := false ;quy định khi giá trị này bằng true thì chương trình bị buộc dừng bởi người dùng (mặc định là false)
globalAutoReady := false ;biến boolean sau khi setup lần đầu tiên thì tự động ready cho đến khi thua (mặc định là false khi chưa thực hiện setup)
globalDeath := 0 ;biến đếm số lần chết
global recharging := false ;biến quy định khi nào là lúc đang thực hiện recharge (mặc định là false khi chưa thực hiện)
global Resetround := 30 ;chống tình trạng trôi loop, khi đến round chỉ định thì tự động tắt game 
global loopCurrent := 0
global robloxopen := false ;biến hiển thị trạng thái roblox lên gameGUI
global isShopUpgrade := false ;biến báo hiệu khi nào hoàn thành việc nâng shop

; lấy vị trí chính giữa màn hình
dpi := GetDpiScale()
global xct := A_ScreenWidth /2
global yct := A_ScreenHeight /2
global cct
; Tính toán vị trí cho GUI
global gameGUIWidth := 405
global gameGUIHeight := 147
screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight
ScaleFactor := Dpi / 96.0
xPos := ((screenWidth - gameGUIWidth * dpi) / 2)/dpi ; X tại giữa màn hình
yPos := screenHeight / 12 ; Y tại 1/12 chiều rộng màn hình



AHKfilePath := ReadValueFromFile(cusFilePath, "AHKfilePath")
robloxPath := ReadValueFromFile(cusFilePath, "robloxPath") ; "C:\Users\pc\AppData\Local\Roblox\Versions\version-0c1a10704cb043cc\RobloxPlayerBeta.exe"


if (robloxPath == ""){
    MsgBox("Enter your Roblox file Path in MacroCustomization.ini first before open this macro again", "Macro By Vezyl")
    ExitApp
}
runRoblox(){ ;run Roblox as Administrator
    Run ("*RunAs " robloxPath)
    LongWaitingTime
    LongWaitingTime
    While(true){
        if WinExist('Roblox'){
            WinActivate
            break
        }
    }
    ; WinActivate('Roblox')
    NormalWaitingTime

}

RestartRoblox(){
    global loopCurrent
    if WinExist('Roblox')
        WinClose
    loopCurrent++
    main()
}

ScriptfilePath := A_ScriptFullPath
if !A_IsAdmin{ ; run as Administrator
    Run( "*RunAs " AHKfilePath " " ScriptfilePath)
    ExitApp
}









/*
Các hàm có ảnh hưởng đến thời gian hoặc vòng lặp đều mặc định có đoạn code dưới đây để nhận tín hiệu từ phím PgUp để buộc dừng chương trình
        if (GetKeyState("PgUp", "P")) {
                    stopFlag := true
                    ErrorMissTime
                    break
                }
*/

ShortWaitingTime(){ ;anti-system overload
    global StopFlag

    totalSleepDuration := 200
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            ErrorMissTime
            break
        }
        Sleep sleepInterval
        elapsed += sleepInterval
    }
}

NormalWaitingTime(){ ;pause between actions
    global StopFlag

    totalSleepDuration := 1000
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            ErrorMissTime
            break
        }
        Sleep sleepInterval
        elapsed += sleepInterval 
    }
}

AvgLongWaitingTime(){
    global StopFlag

    totalSleepDuration := 2500
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            ErrorMissTime
            break
        }
        Sleep sleepInterval
        elapsed += sleepInterval
    }
}

LongWaitingTime(){ ;wait for system response
    global StopFlag

    totalSleepDuration := 5000
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            ErrorMissTime
            break
        }
        Sleep sleepInterval
        elapsed += sleepInterval
    }
}


DoorTime(){ ;time to go from corner to door (default 2310ms)
    global StopFlag

    totalSleepDuration := doorDis
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true
            ErrorMissTime
            break
        }
        Sleep sleepInterval
        elapsed += sleepInterval
    }
}


CenterTime(){ ;time to go from door to center (default 2440ms)
    global StopFlag

    totalSleepDuration := centerDis
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        if (GetKeyState("PgUp", "P")) {
            stopFlag := true  ; Set the flag if Page Up is pressed
            ErrorMissTime
            break  ; Exit the sleep loop
        }
        Sleep sleepInterval  ; Sleep for a short interval
        elapsed += sleepInterval  ; Increment elapsed time
    }
}


PlacementWalkTime(){ ;time to go from center to Placement position (default 30cDis)
    Loop 30 {
    MoveForward
    }
}


ReadyUp(){ ;wait for the ready button and press (function has a waiting time of about 1 round)
    /*
    Hàm điều phối và thực hiện lệnh bấm ready khi round mới
    Mặc định di chuyển chuột đến vị trí x7, y7 sau mỗi 1s, lấy mẫu màu ở vị trí đó
    báo lỗi sau 10000 lần lấy mẫu
    tự động ready nếu không có thêm luồng phụ (recharge hoặc special gear recharge)
    Lấy 4 vị trí trên màn hình, kiểm tra nếu cả 4 màu đều là màu đen thì được tính là 1 lần chết, countdown 10s để tránh bị đếm lặp. Nếu phát hiện chết thì đóng vòng lặp
    Các lệnh if trong vòng lặp nên được thực hiện song song, không phải else if để đảm bảo thực hiện đủ quá trình
    Hàm Ready được gọi lên chính là điều kiện để check khi nào sang round mới để thực hiện chuyển round
    */
    global rechargeWait
    global StopFlag 
    global globalDeath
    global globalAutoReady
    global roundcount
    global SpecialGear1SetupDone
    global loopCount
    global isShopUpgrade

    if (GetKeyState("PgUp", "P")) {
        StopFlag := true
        ErrorMissTime
    }
    NormalWaitingTime
    count := 0
    While (!StopFlag) {
        if (GetKeyState("PgUp", "P")) {
            StopFlag := true
            ErrorMissTime
            break
        }
        MouseMove x7, y7
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        NormalWaitingTime
        if (count > 10000){
            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot Ready. Current loop: " loopCurrent ", Current round " roundcount)
            ErrorMissTime
        }
        if (globalDeath >0)
            break
        if (color == c7) ;
        {
            if (roundcount == 16 and SpecialGear1SetupDone == false){ ;setup sau round chỉ định 1 round
                currentDis := cDis
                oldPos := cDis
                While (currentDis < 30){
                    MoveForward
                    currentDis := cDis
                }
                SpecialGear1Setup
                While (currentDis > oldPos){
                    MoveBackward
                    currentDis := cDis
                }
                SpecialGear1SetupDone := true
                MouseMove x7, y7
            }
            ; if (roundcount == 1 and isShopUpgrade == false){
            ;     currentDis := cDis
            ;     oldPos := cDis
            ;     While (currentDis >0){
            ;         MoveBackward
            ;         currentDis := cDis
            ;     }
            ;     ShopUpgrade
            ;     While (currentDis < oldPos){
            ;         MoveForward
            ;         currentDis := cDis
            ;     }
            ; }
            while (color == c7){
                MouseMove x7, y7
                ShortWaitingTime
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm ready", "Thông báo")
                Click
                ShortWaitingTime
                color := PixelGetColor(xpos, ypos)
            }
            roundcount++
            if (!globalAutoReady || recharging)
                break
            else count := 0
        }
        if (roundcount == 14 and rechargeWait == true){
            MoveBackward
            GearSetup
        }

        if (roundcount == 18 and rechargeWait == true){
            MoveBackward
            GearSetup
        }
        /*
        Thêm đoạn code bên dưới nếu muốn thêm 1 lần recharge vào round đó
        Lưu ý mỗi lần recharge sẽ mấy 3 round liên tục (ví dụ set round 18 recharge thì sẽ recharge trong các round 18 19 20)
        ---
        if (roundcount == 18 and rechargeWait == true){
        MoveBackward
        GearSetup
        ---
        Thêm lệnh "rechargeWait := false" vào lần cuối cùng recharge để đảm bảo không có lỗi
        }
        */
        if (roundcount == 21 and rechargeWait == true){
            MoveBackward
            GearSetup
            rechargeWait := false
        }
        if (roundcount == Resetround){
            RestartRoblox
            break
        }
    }
}


GearSetup(){
    /*
    Tổ hợp lệnh phức tạp để điều khiển quá trình setup đồ
    Mặc định sẽ là 4 đồ trên mỗi cDis
    3 gear cơ bản sẽ được setup ở đây
    */
    x13able := true
    global globalDeath
    global recharging
    global rechargeWait
    round := 2
    currentHotKey1 := 0
    currentHotKey2 := 0
    currentHotKey3 := 0
    currentX := x10
    currentY := y10
    While (round <5 and globalDeath == 0){ ;setup đến hết round 4
        NormalWaitingTime

        SendEvent "1"
        currentHotKey1 := 0
        currentHotKey2 := 0
        currentHotKey3 := 0
        switch round {
            case 2:  ;nếu đang round 2 thì chỉnh số lượng hiện có của các đồ cho round 2
                currentNumforHotkey1 := NumforHotkey1round2
                currentNumforHotkey2 := NumforHotkey2round2
                currentNumforHotkey3 := NumforHotkey3round2
                if (rechargeWait == false) { ;nếu không phải lần recharge thì bấm ready
                    ReadyUp
                }else {
                    recharging := true
                    rechargeWait := false
                    ; MsgBox ('tat recharge wait')
                }
            case 3: 
                currentNumforHotkey1 := NumforHotkey1round3
                currentNumforHotkey2 := NumforHotkey2round3
                currentNumforHotkey3 := NumforHotkey3round3
                ReadyUp
            case 4: 
                currentNumforHotkey1 := NumforHotkey1round4
                currentNumforHotkey2 := NumforHotkey2round4
                currentNumforHotkey3 := NumforHotkey3round4
                ReadyUp
                recharging := false
                rechargeWait := true
        }
        While (globalDeath == 0 and currentHotKey1 < currentNumforHotkey1){ ;khi mà số đồ hiện có của hotkey1 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey1++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey1 ; chỉnh sang đồ thứ 1
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
            oldColor := PixelGetColor(currentX, currentY)
            currentColor := oldColor
            While (currentColor == oldColor){
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang đặt đặt ... " currentHotKey1 " cho " HotKey1, "Thông báo")
                ShortWaitingTime
                SendEvent "{Lbutton}" ;đặt đồ
                ShortWaitingTime
                currentColor := PixelGetColor(currentX, currentY)
            }
            switch currentX {
                case x10:
                    currentX := x11
                    currentY := y11
                case x11:
                    currentX := x12
                    currentY := y12
                case x12:
                    currentX := x13
                    currentY := y13
                case x13:
                    if (currentHotKey2 < currentNumforHotkey2 || currentHotKey1 < currentNumforHotkey1 || currentHotKey3 < currentNumforHotkey3){
                        MoveBackward
                        currentX := x10
                        currentY := y10
                    }else if (round <4){
                        x13able := false
                    }
            } 
        }
        While (globalDeath == 0 and currentHotKey2 < currentNumforHotkey2){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey2++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey2 ; chỉnh sang đồ thứ 2
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
            oldColor := PixelGetColor(currentX, currentY)
            currentColor := oldColor
            While (currentColor == oldColor){
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang đặt đặt ... " currentHotKey2 " cho " HotKey2, "Thông báo")
                ShortWaitingTime
                SendEvent "{Lbutton}" ;đặt đồ
                ShortWaitingTime
                currentColor := PixelGetColor(currentX, currentY)
            }
            switch currentX {
                case x10:
                    currentX := x11
                    currentY := y11
                case x11:
                    currentX := x12
                    currentY := y12
                case x12:
                    currentX := x13
                    currentY := y13
                case x13:
                    if (currentHotKey2 < currentNumforHotkey2 || currentHotKey3 < currentNumforHotkey3){
                        MoveBackward
                        currentX := x10
                        currentY := y10
                    }else if (round <4){
                        x13able := false
                    }
            } 
        }
        While (globalDeath == 0 and currentHotKey3 < currentNumforHotkey3){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey3++ ;cộng 1 đồ đã được đặt
            if (!x13able){
                MoveBackward
                currentX := x10
                currentY := y10
                x13able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey3 ; chỉnh sang đồ thứ 3
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            SetTimer(CloseMsgBox, 500) 
            MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
            oldColor := PixelGetColor(currentX, currentY)
            currentColor := oldColor
            While (currentColor == oldColor){
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đang đặt đặt ... " currentHotKey3 " cho " HotKey3, "Thông báo")
                ShortWaitingTime
                SendEvent "{Lbutton}" ;đặt đồ
                ShortWaitingTime
                currentColor := PixelGetColor(currentX, currentY)
            }
            switch currentX {
                case x10:
                    currentX := x11
                    currentY := y11
                case x11:
                    currentX := x12
                    currentY := y12
                case x12:
                    currentX := x13
                    currentY := y13
                case x13:
                    if (currentHotKey3 < currentNumforHotkey3){
                        MoveBackward
                        currentX := x10
                        currentY := y10
                    }else if (round <4){
                        x13able := false
                    }
            }
        }
        round++
    }
}


SpecialGear1Setup(){ ;đặt special gear 1 cách sang bên phải 2460ms
    ; ĐẶT FLAME TURRET
    global firsttimesetup
    if (NumforHotkey4 >0 and HotKey4 != 0 and globalDeath == 0){
        global NumforHotkey4
        global HotKey4
        SendEvent("{d down}") 
        CenterTime
        ShortWaitingTime  
        SendEvent("{d up}")
        currentHotKey4 := 0
        if (firsttimesetup){
            currentX := x10
            currentY := y10
        }else{
            currentX := x12
            currentY := y12
        }

        
        While (globalDeath == 0 and currentHotKey4 < NumforHotkey4){ ;khi mà số đồ hiện có của hotkey4 bé hơn hoặc bằng số lượng đặt được trong round đấy
            currentHotKey4++ ;cộng 1 đồ đã được đặt
            SendEvent "1"
            ShortWaitingTime
            SendEvent HotKey4 ; chỉnh sang đồ thứ 4
            MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
            NormalWaitingTime
            ShortWaitingTime
            if (firsttimesetup){
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
                oldColor := PixelGetColor(currentX, currentY)
                currentColor := oldColor
                While (currentColor == oldColor){
                    SetTimer(CloseMsgBox, 500) 
                    MsgBox("Đang đặt... " currentHotKey4 " cho " HotKey4, "Thông báo")
                    ShortWaitingTime
                    SendEvent "{Lbutton}" ;đặt đồ
                    ShortWaitingTime
                    currentColor := PixelGetColor(currentX, currentY)
                }
                ; SendEvent "{Lbutton}" ;đặt đồ
                ; NormalWaitingTime
                NormalWaitingTime
                SendEvent "b"
                firsttimesetup := false
            }else{
                SetTimer(CloseMsgBox, 500) 
                MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
                oldColor := PixelGetColor(currentX, currentY)
                currentColor := oldColor
                While (currentColor == oldColor){
                    SetTimer(CloseMsgBox, 500) 
                    MsgBox("Đang đặt... " currentHotKey4 " cho " HotKey4, "Thông báo")
                    ShortWaitingTime
                    SendEvent "{Lbutton}" ;đặt đồ
                    ShortWaitingTime
                    currentColor := PixelGetColor(currentX, currentY)
                }
                ; SendEvent "{Lbutton}" ;đặt đồ
                ; NormalWaitingTime
                ; SendEvent "{Lbutton}"
            }
            switch currentX {
                case x10:
                    currentX := x11
                    currentY := y11
                case x11:
                    currentX := x12
                    currentY := y12
                case x12:
                    currentX := x13
                    currentY := y13
                case x13:
                    currentX := x10
                    currentY := y10
            }
            }
        SendEvent("{a down}") 
        CenterTime
        ShortWaitingTime  
        SendEvent("{a up}")
        ShortWaitingTime
        }
}

ShopUpgrade(){
    ;di sang phai
    SendEvent("{d down}")
    NormalWaitingTime
    NormalWaitingTime
    ShortWaitingTime
    SendEvent("{d up}")
    SendEvent("{s down}")
    NormalWaitingTime
    NormalWaitingTime
    ShortWaitingTime
    SendEvent("{s up}")


    SendEvent("{w down}")
    NormalWaitingTime
    NormalWaitingTime
    ShortWaitingTime
    SendEvent("{w up}")
    SendEvent("{a down}")
    NormalWaitingTime
    NormalWaitingTime
    ShortWaitingTime
    SendEvent("{a up}")
    isShopUpgrade := true
}
MoveBackward(){ ; di chuyển xuống 1 cDis
    global backwardtime
    backwardtime++
    global cDis
    cDis--
    SendEvent("{s down}")
    NormalWaitingTime
    ShortWaitingTime
    ShortWaitingTime
    SendEvent("{s up}")
}


MoveForward(){ ;di chuyển lên 1 cDis
    global cDis
    cDis++
    SendEvent("{w down}")
    NormalWaitingTime
    ShortWaitingTime
    ShortWaitingTime
    SendEvent("{w up}")
}


main(){
    global StopFlag := false
    global globalAutoReady
    global Hotkey4
    global NumforHotkey4
    global loopCount := userInput ;generate loop number according to user data
    global loopCurrent
    global roundcount := 0
    global SpecialGear1SetupDone
    global getroundsSurvivedvalue := 0
    global robloxopen := false
    GUIingame()

    ;display current time and write into macrodata
    WriteValueToFile(hisFilePath, "---" )
    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    WriteValueToFile(hisFilePath, formattedTime " run macro with " loopCount " loop(s)" )


    runRoblox
    if (GetKeyState("PgUp", "P")) {
        StopFlag := true
        ErrorMissTime
    }
    
    ;hover to most recent game location
    LongWaitingTime
    LongWaitingTime
    count := 0
    global robloxopen := true
    While (!StopFlag) {
        if (GetKeyState("PgUp", "P")) {
            StopFlag := true
            ErrorMissTime
            break
        }
        MouseMove x1, y1 
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        count++
        ShortWaitingTime
        if (count > 100){
            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot find game. Current loop: " loopCurrent)
            ErrorMissTime ;error report after 100 tries
        }
        if (color == c1) 
        {
            SetTimer(CloseMsgBox, 500) 
            MsgBox("mẹ cha mấy thằng súc vật roblox dùng human checker", "Macro by Vezyl")
            Click 
            break
        }
    }

    
    Loop loopCount { ;macro loop execution
        
        if (GetKeyState("PgUp", "P")) {
            StopFlag := true
            ErrorMissTime
            break
        }
        if (NumforHotkey4 >0 and HotKey4 != 0){ ;nếu không có special gear 1 coi như setup xong
            SpecialGear1SetupDone := false
        }else SpecialGear1SetupDone := true
        
        global globalDeath := 0
        global globalAutoReady := false
        global firsttimesetup := true
        loopCurrent := A_Index
        global cDis := 0
        count := 0
        global roundcount := 0
        global isShopUpgrade := false

        currentXYC := 2 ; biến xác định hiện tại chuột nên ở vị trí thứ mấy
        While(!StopFlag and currentXYC <= 6){ ; vòng lặp này sẽ vào đến màn hình trong shop chờ ready
            count := 0
            While(!StopFlag){
                ;vòng lặp chờ load này có thời gian chờ 11 phút
                if (GetKeyState("PgUp", "P")) {
                    StopFlag := true
                    break
                }
                NormalWaitingTime
                MouseMove xct, yct ; di chuyển chuột ra giữa màn hình
                nextXYC := currentXYC +1
                NormalWaitingTime
                MouseMove x%currentXYC%, y%currentXYC% ; di chuyển chuột đến vị trí mong muốn
                ShortWaitingTime
                MouseGetPos &xpos, &ypos ;lấy vị trí chuột hiện tại
                color := PixelGetColor(xpos, ypos) ; lấy mã màu hiện tại
                nextcolor := PixelGetColor(x%nextXYC%, y%nextXYC%)
                count++
                ShortWaitingTime
                if (count > 300){
                    switch currentXYC{
                        case 2:
                            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot join game. Current loop: " loopCurrent)
                        case 3:
                            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot find Private Game button. Current loop: " loopCurrent)
                        case 4:
                            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot find Career Mode button. Current loop: " loopCurrent)
                        case 5:
                            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot find Create Private button. Current loop: " loopCurrent)
                        case 6:
                            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                            WriteValueToFile(hisFilePath, formattedTime " Error: Cannot find Play button. Current loop: " loopCurrent)
                        }
                    ErrorMissTime
                }
                if (color == c4 || color == c41){
                    MouseMove x%currentXYC%, y%currentXYC%
                    SetTimer(CloseMsgBox, 500) 
                    MsgBox("Nhấm Chuột tại vị trí: x" currentXYC, "Macro By Vezyl")
                    ShortWaitingTime
                    Click
                    NormalWaitingTime
                }
                if (color == c%currentXYC% || color == c21) { ;nếu trùng màu rồi thì xét màu tiếp theo
                    minicount := 0
                    while (nextcolor != c%nextXYC% || nextcolor == c41){ ;khi mà màu đằng sau chưa xuất hiện thì bấm chuột
                        ;vòng lặp nhấn chuột này có độ dài chờ khoảng 5 phút rưỡi
                        ShortWaitingTime
                        minicount++
                        if (minicount > 300){
                            switch currentXYC{
                                case 2:
                                    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                                    WriteValueToFile(hisFilePath, formattedTime " Error: Spam clicking at join game. Current loop: " loopCurrent)
                                case 3:
                                    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                                    WriteValueToFile(hisFilePath, formattedTime " Error: Spam clicking at Private Game button. Current loop: " loopCurrent)
                                case 4:
                                    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                                    WriteValueToFile(hisFilePath, formattedTime " Error: Spam clicking at Career Mode button. Current loop: " loopCurrent)
                                case 5:
                                    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                                    WriteValueToFile(hisFilePath, formattedTime " Error: Spam clicking at Create Private button. Current loop: " loopCurrent)
                                case 6:
                                    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                                    WriteValueToFile(hisFilePath, formattedTime " Error: Spam clicking at Play button. Current loop: " loopCurrent)
                                }
                            ErrorMissTime
                            break
                        }
                        if (color == c%currentXYC% || color == c21){
                            SetTimer(CloseMsgBox, 500) 
                            MsgBox("Nhấm Chuột tại vị trí: x" currentXYC, "Macro By Vezyl")
                            Click
                        }
                        NormalWaitingTime
                        nextcolor := PixelGetColor(x%nextXYC%, y%nextXYC%)
                        if (nextcolor == c%nextXYC% || nextcolor == c41) {
                            break ; Thoát vòng lặp nếu đã nhận được nextcolor
                        }
                    }
                    break
                }
            }
            currentXYC++
        }

        ReadyUp
        SetTimer(Deathcount, 1000)

        count := 0
        While (!StopFlag) { ;comfirm and click change character perspective
            if (GetKeyState("PgUp", "P")) {
                StopFlag := true
                break
            }
            MouseMove x8, y8
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            NormalWaitingTime
            if (count > 100){
                formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                WriteValueToFile(hisFilePath, formattedTime " Error:  cannot change character perspective. Current loop: " loopCurrent)
                ErrorMissTime
            }
            if (color == c8) 
            {
                SetTimer(CloseMsgBox, 500) 
                MsgBox("bấm đổi góc nhìn", "chọn màu thành công")
                Click
                ShortWaitingTime
                Click
                ShortWaitingTime
                Click
                ShortWaitingTime
                break
            }
        }

        
        ; khóa vị trí
        count := 0
        While (!StopFlag) { ;move character out of shop
            if (GetKeyState("PgUp", "P")) {
                StopFlag := true
                break
            } 
            MouseMove x9, y9
            MouseGetPos &xpos, &ypos 
            color := PixelGetColor(xpos, ypos)
            count++
            sleep 250
            if (count > 600){
                formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
                WriteValueToFile(hisFilePath, formattedTime " Error: Cannot get out of round 1. Current loop: " loopCurrent)
                ErrorMissTime
            }
            if (color == c9) 
            {
                SendEvent("{w down}") 
                AvgLongWaitingTime 
                SendEvent("{w up}")
                SendEvent("{d down}")
                AvgLongWaitingTime     
                SendEvent("{d up}")
                SendEvent("{a down}")
                DoorTime     
                SendEvent("{a up}")
                ShortWaitingTime
                SendEvent "F"
                break
            }
        }


        SendEvent("{d down}") 
        CenterTime  
        SendEvent("{d up}")
        SendEvent("{w down}")
        PlacementWalkTime    
        SendEvent("{w up}")
        ShortWaitingTime

        SpecialGear1Setup



        global rechargeWait :=false
        GearSetup
        global rechargeWait := true
        global globalAutoReady := true
        ReadyUp


        if (globalDeath >0 || roundcount == Resetround){
            SendEvent "{Esc}"
            sleep 1000
            SendEvent "L"
            sleep 1000
            SendEvent "{Enter}"
            sleep 1000
            loopCurrent++
        }
        SetTimer(Deathcount, -1)
        ;loop count notification
        loopCurrent := A_Index
        LoopRemaining := loopCount - loopCurrent
        getroundsSurvivedvalue := roundcount
        formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
        WriteValueToFile(hisFilePath, formattedTime " Complete loop " loopCurrent ", Rounds Survived: " getroundsSurvivedvalue)
        SetTimer(CloseMsgBox, 1000)
        MsgBox("complete the loop: " loopCurrent "`nremaining loop : " LoopRemaining)
    }
    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    WriteValueToFile(hisFilePath, formattedTime " Complete all ")
    SetTimer(CloseMsgBox, 3000) 
    MsgBox("Chạy thành công", "Thông báo")
    ExitApp
}


;Main Graphical User Interface
global Totalhotkey1
global Totalhotkey2
global Totalhotkey3
global Totalhotkey4
global Totalhotkey5 


mainGUI := Gui()
; mainGUI.Opt("+AlwaysOnTop")
mainGUI.SetFont("s14", "Segoe UI")
mainGUI.SetFont("s30 cBlack")
startButton := mainGUI.Add("Button", "x544 y16 w64 h49", "▸")
mainGUI.Title := "MACRO THE FINAL STAND 2 v2.2"


; nhập thông tin số lần loop
mainGUI.SetFont("s14", "Segoe UI")
mainGUI.Add("Text", "x16 y16 w309 h34 +0x200 -Background", "Enter the number of loops you want:")
MyText := mainGUI.Add("Text", "x400 y16 w137 h33 +0x200", "Estimated time")
textInput := mainGUI.Add("ComboBox", "x328 y16 w62", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"])

;phần chữ
mainGUI.Add("Text", "x16 y72 w120 h23 +0x200", "Gear Setting")
mainGUI.Add("Text", "x16 y112 w112 h23 +0x200", "Hotkey")
mainGUI.Add("Text", "x160 y112 w112 h23 +0x200", "Round 2, 18, 21")
mainGUI.Add("Text", "x304 y112 w112 h23 +0x200", "Round 3, 19, 22")
mainGUI.Add("Text", "x448 y112 w113 h23 +0x200", "Round 4, 20, 23")

;simple macro
input1 := mainGUI.Add("ComboBox", "x16 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input2 := mainGUI.Add("ComboBox", "x160 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input3 := mainGUI.Add("ComboBox", "x304 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input4 := mainGUI.Add("ComboBox", "x448 y136 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input5 := mainGUI.Add("ComboBox", "x16 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input6 := mainGUI.Add("ComboBox", "x160 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input7 := mainGUI.Add("ComboBox", "x304 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input8 := mainGUI.Add("ComboBox", "x448 y200 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input9 := mainGUI.Add("ComboBox", "x16 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input10 := mainGUI.Add("ComboBox", "x160 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input11 := mainGUI.Add("ComboBox", "x304 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input12 := mainGUI.Add("ComboBox", "x448 y264 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])

;advanced macro
mainGUI.Add("Text", "x16 y336 w291 h25 +0x200", "Special Gear ")
input13 := mainGUI.Add("ComboBox", "x16 y384 w112", ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
input14 := mainGUI.Add("ComboBox", "x160 y384 w112", ["1", "2"])
input15 := mainGUI.Add("ComboBox", "x16 y448 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
input16 := mainGUI.Add("ComboBox", "x160 y448 w112", ["1", "2", "3", "4", "5", "6", "7", "8"])
mainGUI.SetFont("s10")
mainGUI.Add("Text", "x304 y384 w257 h34", "Upper right corner (recommended: Flame turret). Round 2, 17")
mainGUI.SetFont("s14", "Segoe UI")
mainGUI.SetFont("s10")
mainGUI.Add("Text", "x304 y448 w257 h34", "Bottom corner (recommended: Mortar). Round 17")
mainGUI.SetFont("s14", "Segoe UI")


; thông tin total gear

Totalhotkey1 := mainGUI.Add("Text", "x568 y136 w48 h33 +0x200", "0")
Totalhotkey2 := mainGUI.Add("Text", "x568 y200 w48 h33 +0x200", "0")
Totalhotkey3 := mainGUI.Add("Text", "x568 y264 w48 h33 +0x200", "0")
Totalhotkey4 := mainGUI.Add("Text", "x568 y384 w48 h33 +0x200", "0")
Totalhotkey5 := mainGUI.Add("Text", "x568 y448 w48 h33 +0x200", "0")


;auto-fill
input1.Value := ReadValueFromFile(dataFilePath, "input1")
input2.Value := ReadValueFromFile(dataFilePath, "input2")
input3.Value := ReadValueFromFile(dataFilePath, "input3")
input4.Value := ReadValueFromFile(dataFilePath, "input4")
input5.Value := ReadValueFromFile(dataFilePath, "input5")
input6.Value := ReadValueFromFile(dataFilePath, "input6")
input7.Value := ReadValueFromFile(dataFilePath, "input7")
input8.Value := ReadValueFromFile(dataFilePath, "input8")
input9.Value := ReadValueFromFile(dataFilePath, "input9")
input10.Value := ReadValueFromFile(dataFilePath, "input10")
input11.Value := ReadValueFromFile(dataFilePath, "input11")
input12.Value := ReadValueFromFile(dataFilePath, "input12")
input13.Value := ReadValueFromFile(dataFilePath, "input13")
input14.Value := ReadValueFromFile(dataFilePath, "input14")
input15.Value := ReadValueFromFile(dataFilePath, "input15")
input16.Value := ReadValueFromFile(dataFilePath, "input16")


;lệnh điều khiển và chuyển trạng thái
startButton.OnEvent("Click", onButtonClick)
textInput.OnEvent("Change", OnEventHandler)
input1.OnEvent("Change", OnEventHandler)
input2.OnEvent("Change", OnEventHandler)
input3.OnEvent("Change", OnEventHandler)
input4.OnEvent("Change", OnEventHandler)
input5.OnEvent("Change", OnEventHandler)
input6.OnEvent("Change", OnEventHandler)
input7.OnEvent("Change", OnEventHandler)
input8.OnEvent("Change", OnEventHandler)
input9.OnEvent("Change", OnEventHandler)
input10.OnEvent("Change", OnEventHandler)
input11.OnEvent("Change", OnEventHandler)
input12.OnEvent("Change", OnEventHandler)
input13.OnEvent("Change", OnEventHandler)
input14.OnEvent("Change", OnEventHandler)
input15.OnEvent("Change", OnEventHandler)
input16.OnEvent("Change", OnEventHandler)
mainGUI.OnEvent('Close', (*) => ExitApp())
isContinuePressed := false
global roundcount

OnEventHandler(*){ ;gán các giá trị người dùng vào biến xử lý khi các giá trị thay đổi
    global isContinuePressed  ; Sử dụng biến toàn cục
    global userInput := textInput.Value
    global HotKey1 := input1.Value
    global NumforHotkey1round2 := input2.Value
    global NumforHotkey1round3 := input3.Value
    global NumforHotkey1round4 := input4.Value
    global HotKey2 := input5.Value
    global NumforHotkey2round2 := input6.Value
    global NumforHotkey2round3 := input7.Value
    global NumforHotkey2round4 := input8.Value
    global HotKey3 := input9.Value
    global NumforHotkey3round2 := input10.Value
    global NumforHotkey3round3 := input11.Value
    global NumforHotkey3round4 := input12.Value
    global Hotkey4 := input13.Value
    global NumforHotkey4 := input14.Value
    global Hotkey5 := input15.Value
    global NumforHotkey5 := input16.Value

    global Totalhotkey1
    global Totalhotkey2
    global Totalhotkey3
    global Totalhotkey4
    global Totalhotkey5

    Totalhotkey1.value := NumforHotkey1round2 + NumforHotkey1round3 + NumforHotkey1round4
    Totalhotkey2.text := NumforHotkey2round2 + NumforHotkey2round3 + NumforHotkey2round4
    Totalhotkey3.text := NumforHotkey3round2 + NumforHotkey3round3 + NumforHotkey3round4
    Totalhotkey4.text := NumforHotkey4
    Totalhotkey5.text := NumforHotkey5
    ; MsgBox(" input2 " NumforHotkey1round2)
    global totalMinutes := userInput * 54
    hours := totalMinutes // 60
    minutes := Mod(totalMinutes, 60)
    result := " " hours "h" minutes "m"
    MyText.Text := (result)
}


onButtonClick(*) {
    global isContinuePressed  ; Sử dụng biến toàn cục
    global userInput := textInput.Value
    global HotKey1 := input1.Value
    global NumforHotkey1round2 := input2.Value
    global NumforHotkey1round3 := input3.Value
    global NumforHotkey1round4 := input4.Value
    global HotKey2 := input5.Value
    global NumforHotkey2round2 := input6.Value
    global NumforHotkey2round3 := input7.Value
    global NumforHotkey2round4 := input8.Value
    global HotKey3 := input9.Value
    global NumforHotkey3round2 := input10.Value
    global NumforHotkey3round3 := input11.Value
    global NumforHotkey3round4 := input12.Value


    if FileExist(dataFilePath)
        FileDelete(dataFilePath) ;xóa file data cũ
    FileAppend("", dataFilePath) ; Tạo file mới
    WriteValueToFile(dataFilePath, "input1 := " input1.value)
    WriteValueToFile(dataFilePath, "input2 := " input2.value)
    WriteValueToFile(dataFilePath, "input3 := " input3.value)
    WriteValueToFile(dataFilePath, "input4 := " input4.value)
    WriteValueToFile(dataFilePath, "input5 := " input5.value)
    WriteValueToFile(dataFilePath, "input6 := " input6.value)
    WriteValueToFile(dataFilePath, "input7 := " input7.value)
    WriteValueToFile(dataFilePath, "input8 := " input8.value)
    WriteValueToFile(dataFilePath, "input9 := " input9.value)
    WriteValueToFile(dataFilePath, "input10 := " input10.value)
    WriteValueToFile(dataFilePath, "input11 := " input11.value)
    WriteValueToFile(dataFilePath, "input12 := " input12.value)
    WriteValueToFile(dataFilePath, "input13 := " input13.value)
    WriteValueToFile(dataFilePath, "input14 := " input14.value)
    WriteValueToFile(dataFilePath, "input15 := " input15.value)
    WriteValueToFile(dataFilePath, "input16 := " input16.value)

        
        global totalMinutes := userInput * 54
        hours := totalMinutes // 60
        minutes := Mod(totalMinutes, 60)
        result := " " hours "h" minutes "m"
        confirm := MsgBox("Run the program with the number of loops is " userInput "`nEstimated time :" result, "Macro by Vezyl - Press Pgup Key to force Stop", 4)  ; 4 là flag cho Yes/No
        if (confirm == 'No') {
            ExitApp  ; Nếu người dùng chọn "No", kết thúc
            isContinuePressed := false
        }
        isContinuePressed := true
        mainGUI.Hide()
        main()
    ; }
}

mainGUI.Show ("w623 h514")
if (!isContinuePressed) {
    return
}





global gameGUI
GUIingame() {
    
    gameGUI := Constructor()
    gameGUI.Move(xPos, yPos, gameGUIWidth, gameGUIHeight)
	
}

Constructor(){
    global totalMinutes
    global changeText := false
    global SpecialGear1SetupDone
    global cDis
    gameGUI := Gui()
    global roundcount
    gameGUI.Opt("+AlwaysOnTop -Caption")
    gameGUI.BackColor := "0x000040"
    gameGUI.SetFont("cWhite")
	gameGUI.SetFont("s14", "Segoe UI")
	gameGUI.SetFont("s16", "Segoe UI")
	gameGUI.Add("Text", "x-1 y8 w407 h42 +0x200 +Center", "MACRO THE FINAL STAND 2 v2.2")
	gameGUI.SetFont("s14", "Segoe UI")
	loopEdit := gameGUI.Add("Text", "x8 y96 w96 h26 +0x200", "Loop" loopCurrent "/" userInput)

	roundsSurvived := gameGUI.Add("Text", "x8 y64 w254 h23 +0x200", "Rounds survived last time: " getroundsSurvivedvalue)
	gameGUI.Add("Text", "x-8 y56 w493 h1 +0x10")
	roundEdit := gameGUI.Add("Text", "x104 y96 w176 h26 +0x200", "Current Round: " roundcount)
	timeEdit := gameGUI.Add("Text", "x288 y96 w106 h26 +0x200", "Time")
    Progressvar :=  0 ;loopCurrent / userInput *100
	gameProgress := gameGUI.Add("Progress", "x0 y128 w407 h20 -Smooth +Background0x000040 +C0x006A67", Progressvar)
	gameGUI.OnEvent('Close', (*) => ExitApp())
	gameGUI.Title := "Press Pgup Key to cancel"
    global StartTime := A_TickCount

    ; Sử dụng SetTimer để cập nhật GUI mỗi 1000 ms (1 giây)
    SetTimer(UpdateTimer, 2000)

    ; Hàm cập nhật thời gian trong GUI
    UpdateTimer() {
        global StartTime, Gui
        global changeText
        global robloxopen
        ElapsedTime := Round((A_TickCount - StartTime) / 1000) ; Tính thời gian đã trôi qua bằng giây
        totalTime := totalMinutes *60
        mins := ElapsedTime //60
        hours := mins //60
        mins := Mod(mins, 60)
        seconds := Mod(ElapsedTime, 60)
        
        if (!changeText){
            timeEdit.Text := hours "h " mins "m " seconds "s"
            changeText := true
        }else {
            timeEdit.Text := "Dis: " cDis
            changeText := false
    }
        roundEdit.Text := "Current Round: " roundcount
        loopEdit.Text := "Loop" loopCurrent "/" userInput
        Progressvar := ElapsedTime / totalTime * 100
        gameProgress.Value := Progressvar
        if (!robloxopen){
            roundsSurvived.Text := "Starting Roblox ..."
        }else roundsSurvived.Text := "Rounds survived last time: " getroundsSurvivedvalue
    }
    
    
    
    
    gameGUI.Show
    return gameGUI
}


CloseMsgBox() { ;close dialog box automatically
    WinClose("ahk_class #32770")
    SetTimer(CloseMsgBox, 0)
}

ErrorMissTime() { ;error report, close Program
    global loopCurrent
    global roundcount
    MouseGetPos &xpos, &ypos 
    color := PixelGetColor(xpos, ypos)
    if (StopFlag == true){
        formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
        WriteValueToFile(hisFilePath, formattedTime " Stop by User. Current loop: " loopCurrent ", Current round " roundcount)
        MsgBox("Stop by User ", "Macro Stopped")
    } else {
        formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
        WriteValueToFile(hisFilePath, formattedTime " Error. Current loop: " loopCurrent ", Current round " roundcount)
        SetTimer(CloseMsgBox, 1000)
        MsgBox("unexpected color, the color code collected is: " color, "Time ran out")
        RestartRoblox
        }
    ExitApp
}

WriteValueToFile(filePath, content) { ; ghi file
    FileAppend(content "`n", filePath) ; Thêm nội dung vào file
}

ReadValueFromFile(filePath, keyword) {
    fileContent := FileRead(filePath) ; Đọc toàn bộ nội dung file
    for line in StrSplit(fileContent, "`n") { ; Duyệt từng dòng
        if InStr(line, keyword " := ") = 1 { ; Kiểm tra dòng bắt đầu bằng từ khóa
            global value := StrSplit(line, " := ")[2] ; Lấy giá trị sau dấu :=
            return value
        }
    }
    return "0" ; Trả về chuỗi trống nếu không tìm thấy từ khóa
}

Deathcount(){
    global globalDeath
    global roundcount
    if (PixelGetColor(x14, y14) == 0x000000 and PixelGetColor(x15, y15) == 0x000000 and PixelGetColor(x16, y16) == 0x000000 and PixelGetColor(x17, y17) == 0x000000)
        {globalDeath++
        roundcount--
        SetTimer(CloseMsgBox, 1000) 
        MsgBox("so lan chet" globalDeath)
        LongWaitingTime
        LongWaitingTime
    }
    ToolTip("Death detector is working" . A_TickCount)
}

GetDpiScale() { ;lấy tỉ lệ scale của màn hình
    ; Retrieve the DPI of the main screen
    hdc := DllCall("GetDC", "ptr", 0)
    dpi := DllCall("GetDeviceCaps", "ptr", hdc, "int", 88, "int") ; LOGPIXELSX
    DllCall("ReleaseDC", "ptr", 0, "ptr", hdc)
    
    ; Calculate the scaling factor based on DPI (96 is the default DPI)
    return dpi / 96
}