#Requires AutoHotkey v2.0
#SingleInstance Force
#Include %A_ScriptDir%\Lib\FindImage.ahk
#Include %A_ScriptDir%\Lib\FileRead.ahk
#Include %A_ScriptDir%\mainGUI.ahk
#Include %A_ScriptDir%\Lib\FileWrite.ahk
#Include %A_ScriptDir%\ErrorGUI.ahk
#Include %A_ScriptDir%\gameGUI.ahk

CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"
SendMode ("InputThenPlay")
class Metadata {
    static name := "Game Controler Beta Test"
    static version := "v4.0"
    static InfoMessage := "Cheating"
    static StartTime := A_TickCount
    static ModeList := ["Career Macro", "TinyTask1","TinyTask2","Mode3", "AutoReady"]
    static Mode := "None"
    static Icon := A_WorkingDir "\Ico\mainIcon.ico"
    static devmode := ReadKeyWordFromFile(filePath.cus, "DevMode")
    static errorIcon := A_WorkingDir "\Ico\Error.png"
    static successIcon := A_WorkingDir "\Ico\success.png"
    static theme := ReadKeyWordFromFile(filePath.cus, "theme")
    static EstimatedTotalTime := 0 ;second
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
    static stopkey := ReadKeyWordFromFile(filePath.cus, "stop_macro")
    static TinyTaskHotkey := "0"
}

class MacroParam {
    static RespondTimeout := ReadKeyWordFromFile(filePath.cus, "command_timeout(second)") ;"180"
    static RobloxOpenTimeout := ReadKeyWordFromFile(filePath.cus, "window_search_timeout(second)")
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
    static roundsSurvived := "0"
    static IsAutoReady := false
    static rcing := false
    static IsShopUpgrade := false
    static isChangeMode := false
    static ResetRound := ReadKeyWordFromFile(filePath.cus, "ResetRound")
    static DoorTime := ReadKeyWordFromFile(filePath.cus, "doorDis")
    static CusDoorTime := ReadKeyWordFromFile(filePath.cus, "CusdoorDis")
    static CenterTime := ReadKeyWordFromFile(filePath.cus, "centerDis")
    static 1Dis := ReadKeyWordFromFile(filePath.cus, "1Dis")
    static cDis := "0"
    static maxDis := ReadKeyWordFromFile(filePath.cus, "maxDis(cDis)")
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
        static lv50 := ReadKeyWordFromFile(filePath.cus, "lv50.Bild")
        static unlock := ReadKeyWordFromFile(filePath.cus, "Unlock.Bild")
        static prestige := ReadKeyWordFromFile(filePath.cus, "Prestige.Bild")
        static perk := ReadKeyWordFromFile(filePath.cus, "Perk.Bild")
        static PrestigeButton := ReadKeyWordFromFile(filePath.cus, "PrestigeButton.Bild")
        static PerksButton := ReadKeyWordFromFile(filePath.cus, "PerksButton.Bild")
    }

    class SetupInfor{
        static RC1st := ReadKeyWordFromFile(filePath.cus, "RechargeNormalGear1st")
        static RC2nd := ReadKeyWordFromFile(filePath.cus, "RechargeNormalGear2nd")
        static RC3rd := ReadKeyWordFromFile(filePath.cus, "RechargeNormalGear3rd")
        static RC4th := ReadKeyWordFromFile(filePath.cus, "RechargeNormalGear4th")
        static RC5th := ReadKeyWordFromFile(filePath.cus, "RechargeNormalGear5th")
        static RCSpecial1 := ReadKeyWordFromFile(filePath.cus, "FirstRechargeSpecialGear1")
        static RCSpecial2 := ReadKeyWordFromFile(filePath.cus, "SecondRechargeSpecialGear1")
        static ShopUpgradeRound := ReadKeyWordFromFile(filePath.cus, "ShopUpgradeRound")
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
        static HotKey4 :="0"
        static NumforHotkey4round2 := "0"
        static NumforHotkey4round3 := "0"
        static NumforHotkey4round4 := "0"
        static HotKey5 := "0"
        static NumforHotkey5round2 := "0"
        static NumforHotkey5round3 := "0"
        static NumforHotkey5round4 := "0"
        static SHotKey1 := "0"
        static NumforSHotKey1 := "0"
        static SHotKey2 := "0"
        static NumforSHotKey2 := "0"
        static GearModeKey := "B"
        static xGear1 := Read2value("1", filePath.cus, "N_Mouse_position_1")
        static yGear1 := Read2value("2", filePath.cus, "N_Mouse_position_1")
        static xGear2 := Read2value("1", filePath.cus, "N_Mouse_position_2")
        static yGear2 := Read2value("2", filePath.cus, "N_Mouse_position_2")
        static xGear3 := Read2value("1", filePath.cus, "N_Mouse_position_3")
        static yGear3 := Read2value("2", filePath.cus, "N_Mouse_position_3")
        static xGear4 := Read2value("1", filePath.cus, "N_Mouse_position_4")
        static yGear4 := Read2value("2", filePath.cus, "N_Mouse_position_4")
    }
    class ShopUpgradeInfo{
        static Shop_MouseX1 := Read2value("1", filePath.cus, "ShopBuy_Mouse_position")
        static Shop_MouseY1 := Read2value("2", filePath.cus, "ShopBuy_Mouse_position")
        static Shop_MouseX2 := Read2value("1", filePath.cus, "ShopUpragde_Mouse_position")
        static Shop_Mousey2 := Read2value("2", filePath.cus, "ShopUpragde_Mouse_position")
        static Shop_MouseX3 := Read2value("1", filePath.cus, "Shop_Mouse_position_1")
        static Shop_Mousey3 := Read2value("2", filePath.cus, "Shop_Mouse_position_1")
        static Shop_MouseX4 := Read2value("1", filePath.cus, "Shop_Mouse_position_2")
        static Shop_Mousey4 := Read2value("2", filePath.cus, "Shop_Mouse_position_2")
        static Shop_MouseX5 := Read2value("1", filePath.cus, "Shop_Mouse_position_3")
        static Shop_Mousey5 := Read2value("2", filePath.cus, "Shop_Mouse_position_3")
        static Shop_MouseX6 := Read2value("1", filePath.cus, "Shop_Mouse_position_4")
        static Shop_Mousey6 := Read2value("2", filePath.cus, "Shop_Mouse_position_4")
        static Shop_MouseX7 := Read2value("1", filePath.cus, "Shop_Mouse_position_5")
        static Shop_Mousey7 := Read2value("2", filePath.cus, "Shop_Mouse_position_5")
        static Shop_MouseX8 := Read2value("1", filePath.cus, "Shop_Mouse_position_6")
        static Shop_Mousey8 := Read2value("2", filePath.cus, "Shop_Mouse_position_6")
        static Shop_MouseX9 := Read2value("1", filePath.cus, "Shop_Mouse_position_7")
        static Shop_Mousey9 := Read2value("2", filePath.cus, "Shop_Mouse_position_7")
        static Shop_MouseX10 := Read2value("1", filePath.cus, "Shop_Mouse_position_8")
        static Shop_Mousey10 := Read2value("2", filePath.cus, "Shop_Mouse_position_8")
        static ShopnextX := Read2value("1", filePath.cus, "Shopnext_Mouse_position")
        static ShopnextY := Read2value("2", filePath.cus, "Shopnext_Mouse_position")
    }
    class tmp{
        static currentHotKey1 := "0"
        static currentHotKey2 := "0"
        static currentHotKey3 := "0"
        static currentHotKey4 := "0"
        static currentHotKey5 := "0"
        static currentSHotKey1 := "0"
        static currentSHotKey2 := "0"
        static currentNumforHotkey1 := "0"
        static currentNumforHotkey2 := "0"
        static currentNumforHotkey3 := "0"
        static currentNumforHotkey4 := "0"
        static currentNumforHotkey5 := "0"
        static RoundtoSetupCount := "2"
        static CurrentX := "0"
        static CurrentY := "0"
        static xGear4able := true
    }
    class PrestigeInfo{
        static PrestigeDone := false
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
    static dpi := HwID.GetDpiScale()
    static GetDpiScale() { ;lấy tỉ lệ scale của màn hình
        ; Retrieve the DPI of the main screen
        hdc := DllCall("GetDC", "ptr", 0)
        dpi := DllCall("GetDeviceCaps", "ptr", hdc, "int", 88, "int") ; LOGPIXELSX
        DllCall("ReleaseDC", "ptr", 0, "ptr", hdc)
        
        ; Calculate the scaling factor based on DPI (96 is the default DPI)
        return dpi /96
    }
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
        WriteLog("Pause by User.")
        confirm := MsgBox("Are you sure to close the program? ", "Macro Stopped", 262164)
        if (confirm == 'No') {
            return true
        }else{
            WriteLog("Stop by User. Current Loop: " MacroParam.LoopCurrent ". Current Round: " MacroParam.roundcount)
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

; Giá trị out biểu diễn cho việc có nhấn nút hay không, nếu out ="1" thì chỉ đợi đến hết round và không nhấn ready
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
    While (MacroParam.globalDeath == "0") {
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
            }else if (MacroParam.roundcount >= MacroParam.ResetRound){
                break
            }
            
            if (MacroParam.roundcount == MacroParam.SetupInfor.RCSpecial1-1){
                SpecialGear1Controll("2")
            }
            if (MacroParam.roundcount == MacroParam.SetupInfor.RCSpecial2-1){
                SpecialGear1Controll("3")
            }
            if (MacroParam.roundcount == MacroParam.SetupInfor.ShopUpgradeRound-1){
                ShopUpgrade
            }
            if MacroParam.rcing == false{
                switch MacroParam.roundcount{
                    case MacroParam.SetupInfor.RC1st-1, MacroParam.SetupInfor.RC2nd-1, MacroParam.SetupInfor.RC3rd-1, MacroParam.SetupInfor.RC4th-1, MacroParam.SetupInfor.RC5th-1:
                        MoveBackward
                        NormalGearControll
                }
            }
            ; if (MacroParam.roundcount == MacroParam.SetupInfor.RC1st-1 and MacroParam.rcing == false){ 
            ;     MoveBackward
            ;     NormalGearControll
            ; }
            MouseMove Image[1].1, Image[1].2
            AutoCloseMsgBox
            NormalWaitingTime
            MacroParam.roundcount++
            SendKey("LButton")
            LongWaitingTime("2")
            if (!MacroParam.IsAutoReady || MacroParam.rcing)
                break
            else {
                continue
            }
        }
    }
}

SpecialGear1Controll(time := "1"){ ;đặt special gear 1 cách sang bên phải 2460ms
    
    saveDis := MacroParam.cDis
    ; ĐẶT FLAME TURRET
    MacroParam.PendingAct := MacroParam.PendingActList[12]
    if (MacroParam.SetupInfor.NumforSHotKey1 >0 and MacroParam.SetupInfor.SHotKey1 != 0 and MacroParam.globalDeath == 0){
        While (MacroParam.cDis < MacroParam.maxDis){
            MoveForward
        }
        SendEvent("{d down}") 
        sleep MacroParam.CenterTime
        SendEvent("{d up}")
        MacroParam.tmp.currentSHotKey1 := "0"
        if (Mod(time, 2) == "1"){
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
        }else{
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear3
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear3
        }

        ;khi mà số đồ hiện có của SHotKey1 bé hơn hoặc bằng số lượng đặt được trong round đấy
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentSHotKey1 < MacroParam.SetupInfor.NumforSHotKey1){ 
            MacroParam.tmp.currentSHotKey1++ ;cộng 1 đồ đã được đặt
            SendEvent "1"
            AvgLongWaitingTime
            SendEvent MacroParam.SetupInfor.SHotKey1 ; chỉnh sang đồ thứ 4
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

ShopUpgrade(){
    currentDis := MacroParam.cDis
    oldDis := MacroParam.cDis
    While (currentDis > 0){
        MoveBackward
        currentDis := MacroParam.cDis
    }
    ShortWaitingTime
    ;di sang phai
    SendEvent("{d down}")
    LongWaitingTime("2")
    NormalWaitingTime
    SendEvent("{d up}")
    ShortWaitingTime
    SendEvent("{s down}")
    LongWaitingTime("2")
    NormalWaitingTime
    SendEvent("{s up}")
    ShortWaitingTime
    SendEvent "F"

    currentXY := "1"
    While(currentXY <= "6"){
        ;vòng lặp chờ load này có thời gian chờ 11 phút
        if (GetKeyState("PgUp", "P")) {
            StopFlag := true
        }
        NormalWaitingTime
        MouseMove HwID.xct, HwID.yct ; di chuyển chuột ra giữa màn hình
        ShortWaitingTime
        MouseMove MacroParam.ShopUpgradeInfo.Shop_MouseX%currentXY%, MacroParam.ShopUpgradeInfo.Shop_MouseY%currentXY% ; di chuyển chuột đến vị trí mong muốn
        ShortWaitingTime
        AutoCloseMsgBox
        ShortWaitingTime
        SendKey("LButton", "4")
        currentXY++
    }
    MouseMove MacroParam.ShopUpgradeInfo.ShopnextX, MacroParam.ShopUpgradeInfo.ShopnextY
    AutoCloseMsgBox
    ShortWaitingTime
    SendKey("LButton", "3")
    currentXY := 1
    While(currentXY <= "10"){
        ;vòng lặp chờ load này có thời gian chờ 11 phút
        if (GetKeyState("PgUp", "P")) {
            StopFlag := true
        }
        NormalWaitingTime
        MouseMove HwID.xct, HwID.yct ; di chuyển chuột ra giữa màn hình
        ShortWaitingTime
        MouseMove MacroParam.ShopUpgradeInfo.Shop_MouseX%currentXY%, MacroParam.ShopUpgradeInfo.Shop_MouseY%currentXY% ; di chuyển chuột đến vị trí mong muốn
        ShortWaitingTime
        AutoCloseMsgBox
        ShortWaitingTime
        Click
        ShortWaitingTime
        Click
        ShortWaitingTime
        Click
        ShortWaitingTime
        Click
        ShortWaitingTime
        currentXY++
    }
    SendEvent "F"

    SendEvent("{w down}")
    LongWaitingTime
    AvgLongWaitingTime
    NormalWaitingTime
    ShortWaitingTime
    SendEvent("{w up}")
    ShortWaitingTime
    SendEvent("{a down}")
    LongWaitingTime("2")
    ShortWaitingTime
    SendEvent("{a up}")

    While (currentDis < oldDis){
        MoveForward
        currentDis := MacroParam.cDis
    }
}

NormalGearControll(){
    /*
    Tổ hợp lệnh phức tạp để điều khiển quá trình setup đồ
    Mặc định sẽ là 4 đồ trên mỗi cDis
    3 gear cơ bản sẽ được setup ở đây
    */
    MacroParam.PendingAct := MacroParam.PendingActList[11]
    MacroParam.tmp.xGear4able := true
    MacroParam.tmp.RoundtoSetupCount := 2
    MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
    MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
    While (MacroParam.tmp.RoundtoSetupCount <5 and MacroParam.globalDeath == 0){ ;setup đến hết round 4
        NormalWaitingTime
        SendEvent "1"
        MacroParam.tmp.currentHotKey1 := 0
        MacroParam.tmp.currentHotKey2 := 0
        MacroParam.tmp.currentHotKey3 := 0
        MacroParam.tmp.currentHotKey4 := 0
        MacroParam.tmp.currentHotKey5 := 0

        switch MacroParam.tmp.RoundtoSetupCount {
            case 2:
                MacroParam.tmp.currentNumforHotkey1 := MacroParam.SetupInfor.NumforHotkey1round2
                MacroParam.tmp.currentNumforHotkey2 := MacroParam.SetupInfor.NumforHotkey2round2
                MacroParam.tmp.currentNumforHotkey3 := MacroParam.SetupInfor.NumforHotkey3round2
                MacroParam.tmp.currentNumforHotkey4 := MacroParam.SetupInfor.NumforHotkey4round2
                MacroParam.tmp.currentNumforHotkey5 := MacroParam.SetupInfor.NumforHotkey5round2
                MacroParam.rcing := true
            case 3: 
                MacroParam.tmp.currentNumforHotkey1 := MacroParam.SetupInfor.NumforHotkey1round3
                MacroParam.tmp.currentNumforHotkey2 := MacroParam.SetupInfor.NumforHotkey2round3
                MacroParam.tmp.currentNumforHotkey3 := MacroParam.SetupInfor.NumforHotkey3round3
                MacroParam.tmp.currentNumforHotkey4 := MacroParam.SetupInfor.NumforHotkey4round3
                MacroParam.tmp.currentNumforHotkey5 := MacroParam.SetupInfor.NumforHotkey5round3
                ReadyUp("1")
            case 4: 
                MacroParam.tmp.currentNumforHotkey1 := MacroParam.SetupInfor.NumforHotkey1round4
                MacroParam.tmp.currentNumforHotkey2 := MacroParam.SetupInfor.NumforHotkey2round4
                MacroParam.tmp.currentNumforHotkey3 := MacroParam.SetupInfor.NumforHotkey3round4
                MacroParam.tmp.currentNumforHotkey4 := MacroParam.SetupInfor.NumforHotkey4round4
                MacroParam.tmp.currentNumforHotkey5 := MacroParam.SetupInfor.NumforHotkey5round4
                ReadyUp("1")
                MacroParam.rcing := false
        }
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentHotKey1 < MacroParam.tmp.currentNumforHotkey1 and MacroParam.SetupInfor.HotKey1 != "0"){
            MacroParam.tmp.currentHotKey1++
            if (MacroParam.tmp.xGear4able == false){
                MoveBackward
                MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
                MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
                MacroParam.tmp.xGear4able := true
            }
            SendEvent "1"
            AvgLongWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey1
            if MacroParam.tmp.CurrentX == MacroParam.SetupInfor.xGear4 and (MacroParam.tmp.currentHotKey2 < MacroParam.tmp.currentNumforHotkey2 || MacroParam.tmp.currentHotKey1 < MacroParam.tmp.currentNumforHotkey1 || MacroParam.tmp.currentHotKey3 < MacroParam.tmp.currentNumforHotkey3 || MacroParam.tmp.currentHotKey4 < MacroParam.tmp.currentNumforHotkey4 || MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5){
                GearSetup(true)
            }else GearSetup(false)
        }
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentHotKey2 < MacroParam.tmp.currentNumforHotkey2 and MacroParam.SetupInfor.HotKey2 != "0"){
            MacroParam.tmp.currentHotKey2++
            if (!MacroParam.tmp.xGear4able){
                MoveBackward
                MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
                MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
                MacroParam.tmp.xGear4able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey2
            if MacroParam.tmp.CurrentX == MacroParam.SetupInfor.xGear4 and (MacroParam.tmp.currentHotKey2 < MacroParam.tmp.currentNumforHotkey2 || MacroParam.tmp.currentHotKey3 < MacroParam.tmp.currentNumforHotkey3 || MacroParam.tmp.currentHotKey4 < MacroParam.tmp.currentNumforHotkey4 || MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5){
                GearSetup(true)
            }else GearSetup(false)
        }
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentHotKey3 < MacroParam.tmp.currentNumforHotkey3 and MacroParam.SetupInfor.HotKey3 != "0"){
            MacroParam.tmp.currentHotKey3++
            if (!MacroParam.tmp.xGear4able){
                MoveBackward
                MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
                MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
                MacroParam.tmp.xGear4able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey3
            ;xét điều kiện nếu chuột đang ở vị trí thứ 4 VÀ vẫn còn đồ để đặt thì lùi xuống (trả về true và lùi xuống ở hàm gearsetup)
            if MacroParam.tmp.CurrentX == MacroParam.SetupInfor.xGear4 and (MacroParam.tmp.currentHotKey3 < MacroParam.tmp.currentNumforHotkey3 || MacroParam.tmp.currentHotKey4 < MacroParam.tmp.currentNumforHotkey4 || MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5){
                GearSetup(true)
            }else GearSetup(false)
        }
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentHotKey4 < MacroParam.tmp.currentNumforHotkey4 and MacroParam.SetupInfor.HotKey4 != "0"){
            MacroParam.tmp.currentHotKey4++
            if (!MacroParam.tmp.xGear4able){
                MoveBackward
                MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
                MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
                MacroParam.tmp.xGear4able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey4
            ;xét điều kiện nếu chuột đang ở vị trí thứ 4 VÀ vẫn còn đồ để đặt thì lùi xuống (trả về true và lùi xuống ở hàm gearsetup)
            if MacroParam.tmp.CurrentX == MacroParam.SetupInfor.xGear4 and (MacroParam.tmp.currentHotKey4 < MacroParam.tmp.currentNumforHotkey4 || MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5){
                GearSetup(true)
            }else GearSetup(false)
        }
        While (MacroParam.globalDeath == 0 and MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5 and MacroParam.SetupInfor.HotKey5 != "0"){
            MacroParam.tmp.currentHotKey5++
            if (!MacroParam.tmp.xGear4able){
                MoveBackward
                MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
                MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
                MacroParam.tmp.xGear4able := true
            }
            SendEvent "1"
            ShortWaitingTime
            SendEvent MacroParam.SetupInfor.HotKey5
            ;xét điều kiện nếu chuột đang ở vị trí thứ 4 VÀ vẫn còn đồ để đặt thì lùi xuống (trả về true và lùi xuống ở hàm gearsetup)
            if MacroParam.tmp.CurrentX == MacroParam.SetupInfor.xGear4 and (MacroParam.tmp.currentHotKey5 < MacroParam.tmp.currentNumforHotkey5){
                GearSetup(true)
            }else GearSetup(false)
        }
        MacroParam.tmp.RoundtoSetupCount++
        ReadyUp
    }
}

;mặc định là không lùi xuống
GearSetup(coninute := false){
    CallFrom :=  MacroParam.PendingAct
    MacroParam.PendingAct := MacroParam.PendingActList[10]
    MouseMove MacroParam.tmp.CurrentX, MacroParam.tmp.CurrentY ;chỉnh chuột đến vị trí có thể đặt đồ
    AvgLongWaitingTime
    AutoCloseMsgBox
    oldColor := PixelGetColor(MacroParam.tmp.CurrentX, MacroParam.tmp.CurrentY)
    currentColor := oldColor
    While (currentColor == oldColor){
        AutoCloseMsgBox
        ShortWaitingTime
        SendKey("LButton")
        LongWaitingTime
        currentColor := PixelGetColor(MacroParam.tmp.CurrentX, MacroParam.tmp.CurrentY)
    }
    AvgLongWaitingTime
    if CallFrom == MacroParam.PendingActList[12] and MacroParam.isChangeMode == false{
        SendKey MacroParam.SetupInfor.GearModeKey
        MacroParam.isChangeMode := true
    }
    switch MacroParam.tmp.CurrentX {
        case MacroParam.SetupInfor.xGear1:
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear2
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear2
        case MacroParam.SetupInfor.xGear2:
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear3
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear3
        case MacroParam.SetupInfor.xGear3:
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear4
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear4
        case MacroParam.SetupInfor.xGear4:
            MacroParam.tmp.CurrentX := MacroParam.SetupInfor.xGear1
            MacroParam.tmp.CurrentY := MacroParam.SetupInfor.yGear1
            if CallFrom == MacroParam.PendingActList[12]{
                return
            }
            if coninute {
                MoveBackward
            }else if(MacroParam.tmp.RoundtoSetupCount <4){
                MacroParam.tmp.xGear4able := false
            }
        }
}

 ;di chuyển lên 1 cDis
MoveForward(){
    MacroParam.PendingAct := MacroParam.PendingActList[14]
    MacroParam.cDis++
    SendEvent("{Shift down}")
    SendEvent("{w down}")
    Sleep MacroParam.1Dis
    SendEvent("{w up}")
    SendEvent("{Shift up}")
}

 ;di chuyển xuống 1 cDis
MoveBackward(){
    MacroParam.PendingAct := MacroParam.PendingActList[15]
    MacroParam.cDis--
    SendEvent("{Shift down}")
    SendEvent("{s down}")
    Sleep MacroParam.1Dis
    SendEvent("{s up}")
    SendEvent("{Shift up}")
}

PrestigeCheck(*){
    CheckBild := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.lv50)
    if (CheckBild != "0"){
        WriteLog("Prestige detected")
        PresBilds := [MacroParam.Bild.unlock, MacroParam.Bild.prestige]
        for i, currentBild in PresBilds{
            Image := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
            try{
                if (Image == 0) 
                    throw
                MouseMove Image[1].x, Image[1].y
                AutoCloseMsgBox
                ShortWaitingTime
                SendKey("LButton")
                LongWaitingTime
            }catch {
                WriteLog("Cannot Prestige")
                return
            }
        }
        ; Image := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.PerksButton)
        ; MouseMove Image[1].x, Image[1].y
        ; AutoCloseMsgBox
        ; ShortWaitingTime
        ; SendKey("LButton")
        LongWaitingTime
        MouseMove HwID.xct, HwID.yct
        AutoCloseMsgBox
        LongWaitingTime
        perkfound := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.perk)
        count := 1
        While (perkfound == "0" and count <= 60){
            SendEvent "{WheelDown}"
            AvgLongWaitingTime
            perkfound := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.perk)
            AvgLongWaitingTime
            count++
        }
        if (count > 60){
            WriteLog("Can't find exact perk needed")
            return
        }
        MouseMove perkfound[1].x, perkfound[1].y
        AutoCloseMsgBox
        LongWaitingTime
        SendKey("LButton")
        LongWaitingTime
        PresButton := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.PrestigeButton)
        if PresButton != 0{
            MouseMove PresButton[1].x, PresButton[1].y
            AutoCloseMsgBox
            AvgLongWaitingTime
            SendKey("LButton")
        }
        MacroParam.PrestigeInfo.PrestigeDone := true
    }else if MacroParam.PrestigeInfo.PrestigeDone{
        Lv5check := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.lv50)
    }
    return
}

WriteLog(content){
    formattedTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    WriteValueToFile(filePath.his, formattedTime " : " content)
}
main(){
    WriteValueToFile(filePath.his, "`n---")
    WriteLog("Starting Macro with " MacroParam.LoopCount " loop(s)")
    SetTimer(DeathDetector, 0)
    SetTimer(MacroPause, 10)
    gameGUIcall()
    AutoFindRoblox()
    if WinExist(filePath.roblox){
        WinKill
    }
    RunAdmin(filePath.roblox)
    LongWaitingTime(MacroParam.RobloxOpenTimeout)

    t1:=A_TickCount, Text:=X:=Y:=""
    MacroParam.PendingAct := MacroParam.PendingActList[1]
    ; TF2 := FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.TF2)
    TF2 := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.TF2)
    count := 0
    While (TF2 == 0 and count <= 240){
        SendEvent "{WheelDown}"
        TF2 := FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.TF2)
        AvgLongWaitingTime
        count++
    }
    if TF2 == "0"{
        WriteLog("Error: Cannot find game. Auto Restart")
        main()
    }else{
        MouseMove TF2[1].x, TF2[1].y
        While (FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.TF2) != "0"){
            AutoCloseMsgBox
            NormalWaitingTime
            SendKey("LButton")
        }
    }


    Loop MacroParam.LoopCount{
        MacroParam.globalDeath := "0", MacroParam.cDis := "0", MacroParam.roundcount := "0", MacroParam.IsAutoReady := false, MacroParam.tmp.xGear4able := true
        MacroParam.LoopCurrent := A_Index
        MacroParam.LoopRemaining := MacroParam.LoopCount - MacroParam.LoopCurrent
        
        Bilds := [MacroParam.Bild.PlayButton, MacroParam.Bild.PrivateGame, MacroParam.Bild.Career, MacroParam.Bild.CreatePri, MacroParam.Bild.PlayGame]
        for i, currentBild in Bilds{
            MacroParam.PendingAct := MacroParam.PendingActList[i+1]
            LongWaitingTime("1")
            ; MouseMove HwID.xct, HwID.yct
            ;Nếu không phải chọn mode thì xét các ảnh liên tục
            switch currentBild {
                ;nếu đang cần chọn private game, nếu chưa thấy ảnh Career hiện lên thì nhấn liên tục
                case MacroParam.Bild.PrivateGame:
                    Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
                    While (FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Career) == "0"){
                        MouseMove Image[1].1, Image[1].2
                        AutoCloseMsgBox
                        ShortWaitingTime
                        SendKey("LButton")
                        AvgLongWaitingTime
                    }
                case MacroParam.Bild.Career:
                    switch Metadata.Mode{
                        case Metadata.ModeList[1]:
                            Goto OuterDefault
                        case Metadata.ModeList[2]:
                            currentBild := MacroParam.Bild.Mode1
                            Goto OuterDefault
                        case Metadata.ModeList[3]:
                            currentBild := MacroParam.Bild.Mode2
                            Goto OuterDefault
                        case Metadata.ModeList[4]:
                            currentBild := MacroParam.Bild.Mode3
                            Goto OuterDefault
                    }
                case MacroParam.Bild.PlayGame:
                    LoadGame := FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.PlayGame)
                    PrestigeCheck
                    Goto OuterDefault
                Default:
                    OuterDefault:
                    Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
                    MouseMove HwID.xMax, HwID.yQ1
                    While (FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild) != "0"){
                        MouseMove Image[1].1, Image[1].2
                        AutoCloseMsgBox
                        ShortWaitingTime
                        SendKey("LButton")
                        AvgLongWaitingTime
                    }   
            }
            ; if i != 3{
            ;     Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
            ;     if Image == "0"{
            ;         Msgbox
            ;     }
            ; ;chọn mode
            ; }else if (Metadata.Mode == Metadata.ModeList[2]){
            ;     Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode1)
            ; }else if (Metadata.Mode == Metadata.ModeList[3]){
            ;     Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode2)
            ; }else if (Metadata.Mode == Metadata.ModeList[4]){
            ;     Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Mode3)
            ; }else{
            ;     ;không có mode thì chọn vào mode career, theo thứ tự ảnh liên tục, không khác gì
            ;     Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild)
            ; }


        ;     MouseMove Image[1].1, Image[1].2
        ;     ShortWaitingTime("2")

        ;     ;nếu khác vị trí nhấn chọn private game
        ;     if i != "2" {
        ;         ;nếu vào đến màn hình game thì check prestige
        ;         if i == "5"{
        ;             PrestigeCheck
        ;             MouseMove Image[1].1, Image[1].2
        ;         }
        ;         ; khi vẫn còn ảnh của action hiện tại thì nhấn liên tục đến khi mất ảnh
        ;         While (FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, currentBild) != "0"){
        ;             AutoCloseMsgBox
        ;             ShortWaitingTime
        ;             SendKey("LButton")
        ;             AvgLongWaitingTime
        ;         }
        ;     ; hoặc nếu đang cần chọn private game, nếu chưa thấy ảnh Career hiện lên thì nhấn liên tục
        ;     }else {
        ;         While (FindText(&X, &Y, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.Career) == "0"){
        ;             AutoCloseMsgBox
        ;             ShortWaitingTime
        ;             SendKey("LButton")
        ;             AvgLongWaitingTime
        ;         }
        ;     }
        }
        SetTimer(DeathDetector, 1000)
        ReadyUp
        Image:=FindText(&X := "wait1", &Y := MacroParam.RespondTimeout, 0, 0, HwID.xMax, HwID.yMax, 0, 0, MacroParam.Bild.View)
        MouseMove Image[1].x, Image[1].y
        AutoCloseMsgBox
        Loop 3{
            MacroParam.PendingAct := MacroParam.PendingActList[8]
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
        ShortWaitingTime
        SendEvent "F"
        SendEvent("{d down}") 
        sleep MacroParam.CenterTime  
        SendEvent("{d up}")
        if (Metadata.Mode == Metadata.ModeList[1]){ ; che do career
            Loop MacroParam.maxDis{
                MoveForward
            }
            AvgLongWaitingTime
            SpecialGear1Controll("1")
            NormalGearControll
            MacroParam.IsAutoReady := true
            ReadyUp
        }
        if (MacroParam.globalDeath >0 || MacroParam.roundcount == MacroParam.ResetRound){
            SendEvent "{Esc}"
            sleep 1000
            SendEvent "L"
            sleep 1000
            SendEvent "{Enter}"
            sleep 1000
        }
        MacroParam.roundsSurvived := MacroParam.roundcount
        SetTimer(DeathDetector, -1)
        MacroParam.DeathdetectorWork := false
        AutoCloseMsgBox(,"complete the loop: " MacroParam.LoopCurrent "`nremaining loop : " MacroParam.LoopRemaining,,)
        WriteLog("Complete loop " MacroParam.LoopCurrent ", Rounds Survived: " MacroParam.roundcount)
    }
    WriteLog("The program has run successfully")
    notiGUIcall("Success", Metadata.name " has completed its mission. Thank you for using it.`nThis is an internal version only, please do NOT share it with anyone else.")
    ExitApp
}


SendKey(key := "LButton", time := "1"){
    Loop time{
        Send("{Blind}{" Key " Down}")
        Sleep(MacroParam.KeyHoldDuration)
        Send("{Blind}{" Key " Up}")
        ShortWaitingTime
    }
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
            notiGUI := notiGUIcall("Error", "this application requires administrator permissions to run properly")
        }
        ExitApp
}
If A_IsAdmin{
    If !FileExist(filePath.cus) || FileGetSize(filePath.cus) = 0 || ReadKeyWordFromFile(filePath.cus, "TF2.Bild") == ""{
        GenerateConfigFile
        Msgbox("Fill the config file first before open this App again", Metadata.name)
        If FileExist(filePath.cus){
            Run (filePath.cus)
        }
        ExitApp
    }
    if Metadata.devmode == "on"{
        SetTimer(DevMode, 50)
    }
    mainGUI := mainGUIcall()
    mainGUI.Show ("w623 h642")
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
        . "Recharging => " MacroParam.rcing "`n"
        . "Hotkey" MacroParam.SetupInfor.HotKey1 " => " MacroParam.tmp.currentHotKey1 "/" MacroParam.tmp.currentNumforHotkey1 "`n"
        . "Hotkey" MacroParam.SetupInfor.HotKey2 " => " MacroParam.tmp.currentHotKey2 "/" MacroParam.tmp.currentNumforHotkey2 "`n"
        . "Hotkey" MacroParam.SetupInfor.HotKey3 " => " MacroParam.tmp.currentHotKey3 "/" MacroParam.tmp.currentNumforHotkey3 "`n"
        . "Hotkey" MacroParam.SetupInfor.HotKey4 " => " MacroParam.tmp.currentHotKey4 "/" MacroParam.tmp.currentNumforHotkey4 "`n"
        . "Hotkey" MacroParam.SetupInfor.HotKey5 " => " MacroParam.tmp.currentHotKey5 "/" MacroParam.tmp.currentNumforHotkey5 "`n"
        . "Special Gear" "`n"
        . "Hotkey" MacroParam.SetupInfor.SHotKey1 " => " MacroParam.tmp.currentSHotKey1 "/" MacroParam.SetupInfor.NumforSHotKey1 "`n"
        . "Hotkey" MacroParam.SetupInfor.SHotKey2 " => " MacroParam.tmp.currentSHotKey2 "/" MacroParam.SetupInfor.NumforSHotKey2 "`n"
        . "Pos4able => " MacroParam.tmp.xGear4able "`n" 
		. "Deathcount => " MacroParam.globalDeath "`n" 
		. "MousePos => " x ", " y "`n"
		. "End`n"
    ToolTip(Content, 0, 0)
    DevHis(){
        WriteValueToFile(filePath.his, Content)
    }

}