#Requires AutoHotkey v2.0
#SingleInstance Force
#Include %A_ScriptDir%\Lib\FindImage.ahk
#Include %A_ScriptDir%\Lib\FileRead.ahk
#Include %A_ScriptDir%\mainGUI.ahk
#Include %A_ScriptDir%\Lib\FileWrite.ahk

CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"
SendMode ("InputThenPlay")
class Metadata {
    static name := "Macro Roblox"
    static version := "v4.0"
    static InfoMessage := "Cheating"
    static ModeList := ["Career Macro", "TinyTask1","TinyTask2","Mode3", "AutoReady"]
    static Mode := "None"
    static Icon := A_WorkingDir "\Ico\mainIcon.ico"
}
class filePath {
    static cus := A_ScriptDir "\config\MacroConfig.ini"
    static src := A_ScriptFullPath
    static roblox := ReadKeyWordFromFile(filePath.cus, "robloxPath")
    static data := A_WorkingDir "\config\MacroData.dat"
    static his := "MacroHistory.log"
    static AHK := ReadKeyWordFromFile(filePath.cus, "AHKfilePath")
}

TraySetIcon(Metadata.Icon)


class Hotkey {
    static stopkey := "PgUp"
    static TinyTaskHotkey := "0"
}

class MacroParam {
    static DeathdetectorWork := false
    static PendingActList := ["Find Game"
    , "Game Exec"
    , "Private Game"
    , "Mode Choose"
    , "Create Private"
    , "Click Play"
    , "Ready"
    , "Change View"
    , "MoveOutofShop"
    , "GearSetup"
    , "NormalGearControll"
    , "SpecialGear1Controll"
    , "SpecialGear2Controll"
    , "Move Forward"
    , "Move Backward"
    , "ShopUpgrade"
    , "RestartGame"
    , "Error. Re-open Roblox"]
    static PendingAct := "None"
    static LoopCount := "0"
    static LoopCurrent := "0"
    static LoopRemaining := "999"
    static EstimatedTime := "60"
    static globalDeath := "0"
    static roundcount := "0"
    static IsAutoReady := "false"
    static rcing := "false"
    static IsShopUpgrade := "false"
    static ResetRound := "31"
    static DoorTime := "2310"
    static CusDoorTime := "2110"
    static CenterTime := "2440"
    static 1Dis := "1400"
    static cDis := "0"
    static maxDis := "30"
    class Bild {
        static TF2 := ReadKeyWordFromFile(filePath.cus, "TF2.Bild")
        static PlayButton := ReadKeyWordFromFile(filePath.cus, "PlayButton.Bild")
        static PrivateGame := ReadKeyWordFromFile(filePath.cus, "PrivateGame.Bild")
        static Career := ReadKeyWordFromFile(filePath.cus, "CareerMode.Bild")
        static CreatePri := ReadKeyWordFromFile(filePath.cus, "CreatePrivate.Bild")
        static PlayGame := ReadKeyWordFromFile(filePath.cus, "PlayGame.Bild")
        static ReadyUp := ReadKeyWordFromFile(filePath.cus, "ReadyUp.Bild")
        static View := ReadKeyWordFromFile(filePath.cus, "ViewChange.Bild")
        static Mode1 := ReadKeyWordFromFile(filePath.cus, "")
        static Mode2 := ReadKeyWordFromFile(filePath.cus, "")
        static Mode3 := ReadKeyWordFromFile(filePath.cus, "")
    }

    class SetupInfor{
        static HotKey1 := "0"
        static NumforHotkey1round2 := "0"
        static NumforHotkey1round3 := "0"
        static NumforHotkey1round4 := "0"
        static HotKey2 :="0"
        static NumforHotkey2round2 := "0"
        static NumforHotkey2round3 := "0"
        static NumforHotkey2round4 := "0"
        static HotKey3 := "0"
        static NumforHotkey3round2 := "0"
        static NumforHotkey3round3 := "0"
        static NumforHotkey3round4 := "0"
        static HotKey4 := "0"
        static NumforHotkey4 := "0"
        static HotKey5 := "0"
        static NumforHotkey5 := "0"
        static GearModeKey := "B"
        static xGear1 := "802"
        static yGear1 := "691"
        static xGear2 := "1073"
        static yGear2 := "693"
        static xGear3 := "1052"
        static yGear3 := "796"
        static xGear4 := "872"
        static yGear4 := "799"
        static CurrentX := "0"
        static CurrentY := "0"
    }
    static KeyHoldDuration := 150 ;ms
}

class HwID {
    static xMax := A_ScreenWidth
    static yMax := A_ScreenHeight
    static xct := A_ScreenWidth /2
    static yct := A_ScreenHeight /2
    static xQ1 := HwID.xct + HwID.xct/2
    static yQ1 := HwID.yct - HwID.yct/2
    static xQ2 := HwID.xct - HwID.xct/2
    static yQ3 := HwID.yct + HwID.yct/2
    static xQ4 := HwID.xQ1
    static yQ2 := HwID.yQ1
    static xQ3 := HwID.xQ2
    static yQ4 := HwID.yQ3
}

;Timeout 100ms
ShortWaitingTime(count := "1"){
    Loop count{
        totalSleepDuration := 100
        sleepInterval := 50
        elapsed := 0
        While (elapsed < totalSleepDuration) {
            Sleep sleepInterval
            elapsed += sleepInterval
        }
    }
}

;Timeout 200ms
NormalWaitingTime(count := "1"){
    Loop count{
        totalSleepDuration := 200
        sleepInterval := 50
        elapsed := 0
        While (elapsed < totalSleepDuration) {
            Sleep sleepInterval
            elapsed += sleepInterval
        }
    }
}

;Timeout 500ms
AvgLongWaitingTime(count := "1"){
    Loop count{
        totalSleepDuration := 500
        sleepInterval := 50
        elapsed := 0
        While (elapsed < totalSleepDuration) {
            Sleep sleepInterval
            elapsed += sleepInterval
        }
    }
}

;Timeout 1second
LongWaitingTime(count := "1"){
    ;2
    Loop count{
        totalSleepDuration := 1000
        sleepInterval := 50
        elapsed := 0
        While (elapsed < totalSleepDuration) {
            Sleep sleepInterval
            elapsed += sleepInterval
        }
    }
}

MacroPause(*){

    if (GetKeyState(Hotkey.stopkey, "P")) {
        confirm := MsgBox("Are you sure to close the program? ", "Macro Stopped", 262164)
        if (confirm == 'No') {
            return true
        }else{
            ExitApp
            return false
        }
    }
}

AutoFindRoblox(){
    if (filePath.roblox == ""){
        MsgBox("Enter your Roblox file Path in MacroCustomization.ini first before open this macro again", "Macro By Vezyl")
        ExitApp
    }else if (filePath.roblox == "auto"){
        filePath.roblox := FindFile("RobloxPlayerBeta", "C:\Program Files (x86)\Roblox\Versions")
        if (filePath.roblox != "") {
            filePath.roblox := FindFile("RobloxPlayerBeta", "C:\Users\" A_UserName "\AppData\Local\Roblox\Versions")
            if (filePath.roblox == ""){
                MsgBox("please fill in roblox path manually")
                Run ("Extractor.exe")
                ExitApp
            }
        }
        FindFile(FileName, StartDir) {
            Loop Files, StartDir "\*RobloxPlayerBeta.exe", "R"  ; Recurse into subfolders.
                {
                    Result :=A_LoopFilePath
                    return Result
                }
        }
    }
}

RunAdmin(filePath){ ;run Roblox as Administrator
    Run ("*RunAs " filePath)
    While(true){
        if WinExist('Roblox'){
            WinActivate
            break
        }
    }
    LongWaitingTime("1")
}

AutoReadyModeFunc(*){
    ; global IsAutoReady := true
    ; loopCurrent := 1
    ; global userInput := 1
    ; global roundcount := 0
    ; GUIingame()
    ; SetTimer(Deathcount, 1000)
    ; if WinExist('Roblox'){
    ;     WinActivate
    ; }
    ; While (globalDeath ==0){
    ;     ReadyUp
    ; }
    ; ExitApp
    
}

ReadyUp(out := "0"){ ;wait for the ready button and press (function has a waiting time of about 1 round)
    /*
    Hàm điều phối và thực hiện lệnh bấm ready khi round mới
    Mặc định di chuyển chuột đến vị trí x7, y7 sau mỗi 1s, lấy mẫu màu ở vị trí đó
    báo lỗi sau 10000 lần lấy mẫu
    tự động ready nếu không có thêm luồng phụ (recharge hoặc special gear recharge)
    Lấy 4 vị trí trên màn hình, kiểm tra nếu cả 4 màu đều là màu đen thì được tính là 1 lần chết, countdown 10s để tránh bị đếm lặp. Nếu phát hiện chết thì đóng vòng lặp
    Các lệnh if trong vòng lặp nên được thực hiện song song, không phải else if để đảm bảo thực hiện đủ quá trình
    Hàm Ready được gọi lên chính là điều kiện để check khi nào sang round mới để thực hiện chuyển round
    */
    LongWaitingTime
    count := 0
    While (true) {
        MacroParam.PendingAct := MacroParam.PendingActList[7]
        Image:= FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.ReadyUp)
        NormalWaitingTime
        if (Image == "0"){
            formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
            WriteValueToFile(filePath.his, formattedTime " Error: Cannot Ready. Current loop: " MacroParam.LoopCurrent ", Current round " MacroParam.roundcount)
            ExitApp
        }else{
            
            ;chỉ xác nhận nút ready xuất hiện mà không bấm ready
            if (out == "1"){
                MouseMove Image[1].1, Image[1].2
                return
            }
            ;thoát hàm nếu phát hiện chết hoặc quá round
            if (MacroParam.globalDeath >0){
                break
            }else if (MacroParam.roundcount == MacroParam.ResetRound){
                break
            }
            MacroParam.roundcount++
            if (MacroParam.roundcount == "2"){
                SpecialGear1Controll("1")
            }
            if (MacroParam.roundcount == "3"){
                SpecialGear1Controll("2")
            }
            MouseMove Image[1].1, Image[1].2
            AutoCloseMsgBox
            NormalWaitingTime
            SendKey("LButton")
            ShortWaitingTime
            if (!MacroParam.IsAutoReady || MacroParam.rcing)
                break
            else {
                continue
            }
        }
        
        ; if (color == c7) ;
        ; {
        ;     if (roundcount == (RechargeSpecialGear1 -1) and SpecialGear1SetupDone == false){ ;setup sau round chỉ định 1 round
        ;         currentDis := cDis
        ;         oldPos := cDis
        ;         While (currentDis < 30){
        ;             MoveForward
        ;             currentDis := cDis
        ;         }
        ;         SpecialGear1Setup
        ;         While (currentDis > oldPos){
        ;             MoveBackward
        ;             currentDis := cDis
        ;         }
        ;         SpecialGear1SetupDone := true
        ;         MouseMove x7, y7
        ;     }
        ;     if (roundcount == (ShopUpgradeRound -1) and isShopUpgrade == false){
        ;         currentDis := cDis
        ;         oldPos := cDis
        ;         While (currentDis >0){
        ;             MoveBackward
        ;             currentDis := cDis
        ;         }
        ;         ShopUpgrade
        ;         While (currentDis < oldPos){
        ;             MoveForward
        ;             currentDis := cDis
        ;         }
        ;     }
            
        ; }
        ; if (roundcount == RechargeNormalGear1st and rechargeWait == true){
        ;     MoveBackward
        ;     GearSetup
        ; }
        ; if (roundcount == RechargeNormalGear2nd and rechargeWait == true){
        ;     MoveBackward
        ;     GearSetup
        ; }

        ; if (roundcount == RechargeNormalGear3rd and rechargeWait == true){
        ;     MoveBackward
        ;     GearSetup
        ; }
        ; /*
        ; Thêm đoạn code bên dưới nếu muốn thêm 1 lần recharge vào round đó
        ; Lưu ý mỗi lần recharge sẽ mấy 3 round liên tục (ví dụ set round 18 recharge thì sẽ recharge trong các round 18 19 20)
        ; ---
        ; if (roundcount == 18 and rechargeWait == true){
        ; MoveBackward
        ; GearSetup
        ; ---
        ; Thêm lệnh "rechargeWait := false" vào lần cuối cùng recharge để đảm bảo không có lỗi
        ; }
        ; */
        ; if (roundcount == RechargeNormalGear4th and rechargeWait == true){
        ;     MoveBackward
        ;     GearSetup
        ; }
        ; if (roundcount == RechargeNormalGear5th and rechargeWait == true){
        ;     MoveBackward
        ;     GearSetup
        ;     rechargeWait := false
        ; }

        
    }
}

SpecialGear1Controll(time := "1"){ ;đặt special gear 1 cách sang bên phải 2460ms
    saveDis := MacroParam.cDis
    ; ĐẶT FLAME TURRET
    MacroParam.PendingAct := MacroParam.PendingActList[12]
    if (MacroParam.SetupInfor.NumforHotkey4 >0 and MacroParam.SetupInfor.HotKey4 != 0 and MacroParam.globalDeath == 0){
        While (MacroParam.cDis < MacroParam.maxDis){
            MoveForward
        }
        SendEvent("{d down}") 
        sleep MacroParam.CenterTime
        SendEvent("{d up}")
        currentHotKey4 := "0"
        if (Mod(time, 2) == "1"){
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear1
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear1
        }else{
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear3
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear3
        }

        ;khi mà số đồ hiện có của hotkey4 bé hơn hoặc bằng số lượng đặt được trong round đấy
        While (MacroParam.globalDeath == 0 and currentHotKey4 < MacroParam.SetupInfor.NumforHotkey4){ 
            currentHotKey4++ ;cộng 1 đồ đã được đặt
            SendEvent "1"
            AvgLongWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey4 ; chỉnh sang đồ thứ 4
            GearSetup
        }
        SendEvent("{a down}") 
        sleep MacroParam.CenterTime
        SendEvent("{a up}")
        While (MacroParam.cDis > saveDis){
            MoveBackward
        }
        ShortWaitingTime
    }
}
; NormalGearControll(){
;     /*
;     Tổ hợp lệnh phức tạp để điều khiển quá trình setup đồ
;     Mặc định sẽ là 4 đồ trên mỗi cDis
;     3 gear cơ bản sẽ được setup ở đây
;     */
;     x13able := true
;     global globalDeath, recharging, rechargeWait
;     round := 2
;     currentHotKey1 := 0
;     currentHotKey2 := 0
;     currentHotKey3 := 0
;     currentX := x10
;     currentY := y10
;     While (round <5 and globalDeath == 0){ ;setup đến hết round 4
;         NormalWaitingTime

;         SendEvent "1"
;         currentHotKey1 := 0
;         currentHotKey2 := 0
;         currentHotKey3 := 0
;         switch round {
;             case 2:  ;nếu đang round 2 thì chỉnh số lượng hiện có của các đồ cho round 2
;                 currentNumforHotkey1 := NumforHotkey1round2
;                 currentNumforHotkey2 := NumforHotkey2round2
;                 currentNumforHotkey3 := NumforHotkey3round2
;                 if (rechargeWait == false) { ;nếu không phải lần recharge thì bấm ready
;                     ReadyUp
;                 }else {
;                     recharging := true
;                     rechargeWait := false
;                     ; MsgBox ('tat recharge wait')
;                 }
;             case 3: 
;                 currentNumforHotkey1 := NumforHotkey1round3
;                 currentNumforHotkey2 := NumforHotkey2round3
;                 currentNumforHotkey3 := NumforHotkey3round3
;                 ReadyUp
;             case 4: 
;                 currentNumforHotkey1 := NumforHotkey1round4
;                 currentNumforHotkey2 := NumforHotkey2round4
;                 currentNumforHotkey3 := NumforHotkey3round4
;                 ReadyUp
;                 recharging := false
;                 rechargeWait := true
;         }
;         While (globalDeath == 0 and currentHotKey1 < currentNumforHotkey1){ ;khi mà số đồ hiện có của hotkey1 bé hơn hoặc bằng số lượng đặt được trong round đấy
;             currentHotKey1++ ;cộng 1 đồ đã được đặt
;             if (!x13able){
;                 MoveBackward
;                 currentX := x10
;                 currentY := y10
;                 x13able := true
;             }
;             SendEvent "1"
;             ShortWaitingTime
;             SendEvent HotKey1 ; chỉnh sang đồ thứ 1
;             MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
;             SetTimer(CloseMsgBox, 500) 
;             MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
;             oldColor := PixelGetColor(currentX, currentY)
;             currentColor := oldColor
;             While (currentColor == oldColor){
;                 SetTimer(CloseMsgBox, 500) 
;                 MsgBox("Đang đặt đặt ... " currentHotKey1 " cho " HotKey1, "Thông báo")
;                 ShortWaitingTime
;                 ;SendEvent "{Lbutton}" ;đặt đồ
;                 Click "Down"
;                 Sleep 100
;                 Click "Up"
;                 ShortWaitingTime
;                 currentColor := PixelGetColor(currentX, currentY)
;             }
;             switch currentX {
;                 case x10:
;                     currentX := x11
;                     currentY := y11
;                 case x11:
;                     currentX := x12
;                     currentY := y12
;                 case x12:
;                     currentX := x13
;                     currentY := y13
;                 case x13:
;                     if (currentHotKey2 < currentNumforHotkey2 || currentHotKey1 < currentNumforHotkey1 || currentHotKey3 < currentNumforHotkey3){
;                         MoveBackward
;                         currentX := x10
;                         currentY := y10
;                     }else if (round <4){
;                         x13able := false
;                     }
;             } 
;         }
;         While (globalDeath == 0 and currentHotKey2 < currentNumforHotkey2){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
;             currentHotKey2++ ;cộng 1 đồ đã được đặt
;             if (!x13able){
;                 MoveBackward
;                 currentX := x10
;                 currentY := y10
;                 x13able := true
;             }
;             SendEvent "1"
;             ShortWaitingTime
;             SendEvent HotKey2 ; chỉnh sang đồ thứ 2
;             MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
;             SetTimer(CloseMsgBox, 500) 
;             MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
;             oldColor := PixelGetColor(currentX, currentY)
;             currentColor := oldColor
;             While (currentColor == oldColor){
;                 SetTimer(CloseMsgBox, 500) 
;                 MsgBox("Đang đặt đặt ... " currentHotKey2 " cho " HotKey2, "Thông báo")
;                 ShortWaitingTime
;                 ;SendEvent "{Lbutton}" ;đặt đồ
;                 Click "Down"
;                 Sleep 100
;                 Click "Up"
;                 ShortWaitingTime
;                 currentColor := PixelGetColor(currentX, currentY)
;             }
;             switch currentX {
;                 case x10:
;                     currentX := x11
;                     currentY := y11
;                 case x11:
;                     currentX := x12
;                     currentY := y12
;                 case x12:
;                     currentX := x13
;                     currentY := y13
;                 case x13:
;                     if (currentHotKey2 < currentNumforHotkey2 || currentHotKey3 < currentNumforHotkey3){
;                         MoveBackward
;                         currentX := x10
;                         currentY := y10
;                     }else if (round <4){
;                         x13able := false
;                     }
;             } 
;         }
;         While (globalDeath == 0 and currentHotKey3 < currentNumforHotkey3){ ;khi mà số đồ hiện có của hotkey2 bé hơn hoặc bằng số lượng đặt được trong round đấy
;             currentHotKey3++ ;cộng 1 đồ đã được đặt
;             if (!x13able){
;                 MoveBackward
;                 currentX := x10
;                 currentY := y10
;                 x13able := true
;             }
;             SendEvent "1"
;             ShortWaitingTime
;             SendEvent HotKey3 ; chỉnh sang đồ thứ 3
;             MouseMove currentX, currentY ;chỉnh chuột đến vị trí có thể đặt đồ
;             SetTimer(CloseMsgBox, 500) 
;             MsgBox("Đặt ở vị trí x" currentX " y" currentY , "Thông báo")
;             oldColor := PixelGetColor(currentX, currentY)
;             currentColor := oldColor
;             While (currentColor == oldColor){
;                 SetTimer(CloseMsgBox, 500) 
;                 MsgBox("Đang đặt đặt ... " currentHotKey3 " cho " HotKey3, "Thông báo")
;                 ShortWaitingTime
;                 ;SendEvent "{Lbutton}" ;đặt đồ
;                 Click "Down"
;                 Sleep 100
;                 Click "Up"
;                 ShortWaitingTime
;                 currentColor := PixelGetColor(currentX, currentY)
;             }
;             switch currentX {
;                 case x10:
;                     currentX := x11
;                     currentY := y11
;                 case x11:
;                     currentX := x12
;                     currentY := y12
;                 case x12:
;                     currentX := x13
;                     currentY := y13
;                 case x13:
;                     if (currentHotKey3 < currentNumforHotkey3){
;                         MoveBackward
;                         currentX := x10
;                         currentY := y10
;                     }else if (round <4){
;                         x13able := false
;                     }
;             }
;         }
;         round++
;     }
; }

GearSetup(){
    MacroParam.PendingAct := MacroParam.PendingActList[10]
    MouseMove MacroParam.SetupInfor.CurrentX, MacroParam.SetupInfor.CurrentY ;chỉnh chuột đến vị trí có thể đặt đồ
    AvgLongWaitingTime
    AutoCloseMsgBox
    oldColor := PixelGetColor(MacroParam.SetupInfor.CurrentX, MacroParam.SetupInfor.CurrentY)
    currentColor := oldColor
    While (currentColor == oldColor){
        AutoCloseMsgBox
        ShortWaitingTime
        SendKey("LButton")
        NormalWaitingTime
        currentColor := PixelGetColor(MacroParam.SetupInfor.CurrentX, MacroParam.SetupInfor.CurrentY)
    }
    AvgLongWaitingTime
    SendKey MacroParam.SetupInfor.GearModeKey
    switch MacroParam.SetupInfor.CurrentX {
        case MacroParam.SetupInfor.xGear1:
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear2
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear2
        case MacroParam.SetupInfor.xGear2:
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear3
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear3
        case MacroParam.SetupInfor.xGear3:
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear4
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear4
        case MacroParam.SetupInfor.xGear4:
            MacroParam.SetupInfor.CurrentX := MacroParam.SetupInfor.xGear1
            MacroParam.SetupInfor.CurrentY := MacroParam.SetupInfor.yGear1
    }
    return
}

 ;di chuyển lên 1 cDis
MoveForward(){
    MacroParam.PendingAct := MacroParam.PendingActList[14]
    MacroParam.cDis++
    SendEvent("{w down}")
    totalSleepDuration := MacroParam.1Dis
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        Sleep sleepInterval
        elapsed += sleepInterval
    }
    SendEvent("{w up}")
}


 ;di chuyển xuống 1 cDis
MoveBackward(){
    MacroParam.PendingAct := MacroParam.PendingActList[15]
    MacroParam.cDis--
    SendEvent("{s down}")
    totalSleepDuration := MacroParam.1Dis
    sleepInterval := 50
    elapsed := 0
    While (elapsed < totalSleepDuration) {
        Sleep sleepInterval
        elapsed += sleepInterval
    }
    SendEvent("{s up}")
}

main(){
    SetTimer(MacroPause, 50)
    
    AutoFindRoblox()
    if WinExist(filePath.roblox){
        WinKill
    }
    RunAdmin(filePath.roblox)
    LongWaitingTime("10")

    t1:=A_TickCount, Text:=X:=Y:=""
    MacroParam.PendingAct := MacroParam.PendingActList[1]
    TF2 := FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.TF2)
    MouseMove TF2[1].1 +40, TF2[1].2
        AutoCloseMsgBox
        ShortWaitingTime("2")
        SendKey("LButton")

    Loop MacroParam.LoopCount{
        MacroParam.LoopCurrent := A_Index
        MacroParam.LoopRemaining := MacroParam.LoopCount - MacroParam.LoopCurrent
        getroundsSurvivedvalue := MacroParam.roundcount
        Bilds := [MacroParam.Bild.PlayButton, MacroParam.Bild.PrivateGame, MacroParam.Bild.Career, MacroParam.Bild.CreatePri, MacroParam.Bild.PlayGame]
        for i, currentBild in Bilds{
            MacroParam.PendingAct := MacroParam.PendingActList[i+1]
            LongWaitingTime("1")
            ; MouseMove HwID.xct, HwID.yct
            if i != 3{
                Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
            }else if (Metadata.Mode == Metadata.ModeList[2]){
                Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode1)
            }else if (Metadata.Mode == Metadata.ModeList[3]){
                Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode2)
            }else if (Metadata.Mode == Metadata.ModeList[4]){
                Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode3)
            }else{
                Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
            }
            MouseMove Image[1].1, Image[1].2
            AutoCloseMsgBox
            ShortWaitingTime("2")
            SendKey("LButton")
        }
        SetTimer(DeathDetector, 1000)
        ReadyUp
        Image:=FindText(&X := "wait1", &Y := "2000", 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.View)
        MouseMove Image[1].x, Image[1].y
        Loop 3{
            MacroParam.PendingAct := MacroParam.PendingActList[8]
            AutoCloseMsgBox
            NormalWaitingTime
            SendKey("LButton")
            NormalWaitingTime
        }
        ReadyUp("1")
        MacroParam.PendingAct := MacroParam.PendingActList[9]
        SendEvent("{w down}") 
        LongWaitingTime("3")
        SendEvent("{w up}")
        SendEvent("{d down}")
        LongWaitingTime("3") 
        SendEvent("{d up}")
        SendEvent("{a down}")
        if(Metadata.Mode == Metadata.ModeList[1]){
            sleep MacroParam.DoorTime
        }else sleep MacroParam.CusDoorTime
        SendEvent("{a up}")
        KeyTracker := false
        ShortWaitingTime
        SendEvent "F"
        SendEvent("{d down}") 
        sleep MacroParam.CenterTime  
        SendEvent("{d up}")
        if (Metadata.Mode == Metadata.ModeList[1]){ ; che do career
            Loop 30{
                MoveForward
            }
            AvgLongWaitingTime
            ; ShortWaitingTime
            ; SpecialGear1Setup
            ; global rechargeWait :=false
            ; GearSetup
            ; global rechargeWait := true
            ; global globalAutoReady := true
            ReadyUp
            ReadyUp
            ReadyUp
        }
    }

}


SendKey(key){
    Send("{Blind}{" Key " Down}") ; Nhấn phím xuống
    Sleep(MacroParam.KeyHoldDuration) ; Giữ phím trong khoảng thời gian
    Send("{Blind}{" Key " Up}") ; Nhả phím
}

AutoCloseMsgBox(time := "1000", content := Metadata.InfoMessage, title := Metadata.name, opt := "48") {
    SetTimer(CloseMsgBox , time)
    MsgBox(content, title, opt)
    SetTimer(CloseMsgBox, 0)
    CloseMsgBox(){
        WinClose("ahk_class #32770")
    }
}

DeathDetector(){
    MacroParam.DeathdetectorWork := true
    if (PixelGetColor(HwID.xQ1, HwID.yQ1) == 0x000000 and PixelGetColor(HwID.xQ2, HwID.yQ2) == 0x000000 and PixelGetColor(HwID.xQ3, HwID.yQ3) == 0x000000 and PixelGetColor(HwID.xQ4, HwID.yQ4) == 0x000000){
        MacroParam.globalDeath++
        MacroParam.roundcount--
        AutoCloseMsgBox(,"Death Detected",,16)
        LongWaitingTime("10")
        return
    }
}

AutoClickGUIFunc(*){
    Run("AutoClick.exe")
    mainGUI.Minimize()
}

full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)")){
        try{
            if A_IsCompiled
                Run '*RunAs "' A_ScriptFullPath '" /restart'
            else
                Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
        }catch{
            Msgbox "This program requires Admin rights to start.", Metadata.name
        }
        ExitApp
}
If A_IsAdmin{
    SetTimer(DevMode, 50)
    mainGUI := mainGUIcall()
    mainGUI.Show ("w623 h514")
}

DevMode(mode := "1"){
    MouseGetPos &x, &y
    Content := "Dev Mode on. `n"
        . "Mode =>" Metadata.Mode "`n"
		. "PendingAct => " MacroParam.PendingAct "`n"
        . "DeathDetector =>" MacroParam.DeathdetectorWork "`n"
        . "AutoReady =>" MacroParam.IsAutoReady "`n"
        . "Round =>" MacroParam.roundcount "`n"
        . "Current Dis => " MacroParam.cDis "`n"
		. "Deathcount => " MacroParam.globalDeath "`n" 
		. "MousePos => " x ", " y "`n"
		. "End`n"
    ToolTip(Content, 0, 0)
    DevHis(){
        WriteValueToFile(filePath.his, Content)
    }

}