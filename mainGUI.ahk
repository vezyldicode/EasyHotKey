#Requires AutoHotkey v2.0

if (!A_IsCompiled && A_LineFile=A_ScriptFullPath){
    ExitApp
}

;Main Graphical User Interface
class mainGUIattribute {
    static LoggingCheckBox := 0, AutoPrestigeCheckBox := 0, PerkEdit := 0, AlwaysSetupCheckbox := 0, ImgtoTextButton := 0, gameUI := 0
    static themeChoice := 0
    static themeList := ["white", "dark"]
    static mainGUIWidth := "623"
    static mainGUIHeight := "642"
    static Img1 := A_WorkingDir "\Ico\Perk.png"
    static TimeText := "0"
    static StartButton := "0"
    static Looprange := ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50"]
    static HotkeyNumberRange := ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    static NumberofGearRange := ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    static NumberofGearRangeLimited := ["1", "2"]
    class Tab {
        static nameTab1 := "Career Macro"
        static nameTab2 := "Custom Function"
        static nameTab3 := "Help"
        static nameTab4 := "Update"
        static Setting := "Setting"
        static Tabcount := 1
    }
    class Setting {
        static Logging := false
        static AutoPrestige := false
        static Perk := "0"
        static AlwaysSetup := false
    }
    static LoopInput := "0"
    static input1 := "0", input2 := "0", input3 := "0", input4 := "0", input5 := "0", input6 := "0", input7 := "0", input8 := "0", input9 := "0", input10 := "0", input11 := "0", input12 := "0", input13 := "0", input14 := "0", input15 := "0", input16 := "0", input17 := "0", input18 := "0", input19:= "0", input20:= "0", input21 := "0", input22 := "0", input23:= "0", input24:= "0"
    static HotkeyBox := "0"
    static Mode1 := "0", Mode2 := "0", Mode3 := "0"
    static Totalhotkey1 := "0", Totalhotkey2 := "0", Totalhotkey3 := "0", Totalhotkey4 := "0", Totalhotkey5 := "0", TotalSHotKey1 := "0", TotalSHotKey2  := "0"
}


class Spider {
    static X := "0"
    static Y := "0"
}




mainGUIcall(*){
    mainGUI := Gui()
    mainGUI.Title := Metadata.name
    mainGUI.BackColor := 0xFBFBFB
    mainGUI.SetFont("c484b6a")
    mainGUI.SetFont("s14", "Segoe UI")
    mainGUI.Opt("+AlwaysOnTop")
    ; mainGUI.OnEvent("Close", MyGui_Close)

    mainGUI.Add("Text", "x16 y16 w309 h34 +0x200", "Enter the number of loops you want:")
    mainGUIattribute.TimeText := mainGUI.Add("Text", "x400 y16 w137 h33 +0x200", "Estimated time")
    mainGUIattribute.LoopInput := mainGUI.Add("ComboBox", "x328 y16 w62 +AltSubmit", mainGUIattribute.Looprange)
    mainGUI.SetFont("s30") , mainGUIattribute.StartButton := mainGUI.Add("Button", "x544 y16 w64 h49", "▸")
    
    mainGUI.SetFont("s14")

    ; nhập thông tin số lần loop
    mainGUI.SetFont("s9"), Tab := mainGUI.Add("Tab3", "x0 y60 w623 h582", [mainGUIattribute.Tab.nameTab1, mainGUIattribute.Tab.nameTab2,"    " mainGUIattribute.Tab.Setting "    ", "     " mainGUIattribute.Tab.nameTab3 "     ", "     " mainGUIattribute.Tab.nameTab4 "     "])
    mainGUI.SetFont("s14")


    Tab.UseTab(mainGUIattribute.Tab.Tabcount)
    mainGUIattribute.Tab.Tabcount++
    ;phần chữ
    
    mainGUI.Add("Text", "x16 y87 w120 h23 +0x200", "Gear Setting")
    mainGUI.Add("Text", "x16 y464 w291 h25 +0x200", "Special Gear ")
    mainGUI.SetFont("s10")
    mainGUI.Add("Text", "x16 y112 w112 h23 +0x200", "Hotkey")
    mainGUI.Add("Text", "x160 y102 w122 h33 ", "Round 2, " MacroParam.SetupInfor.RC1st ", " MacroParam.SetupInfor.RC2nd ", " MacroParam.SetupInfor.RC3rd ", " MacroParam.SetupInfor.RC4th)
    mainGUI.Add("Text", "x304 y102 w122 h33 ", "Round 3, " Number(MacroParam.SetupInfor.RC1st) +1 ", " MacroParam.SetupInfor.RC2nd+1 ", " MacroParam.SetupInfor.RC3rd+1 ", " MacroParam.SetupInfor.RC4th+1)
    mainGUI.Add("Text", "x448 y102 w122 h33 ", "Round 4, " MacroParam.SetupInfor.RC1st+2 ", " MacroParam.SetupInfor.RC2nd+2 ", " MacroParam.SetupInfor.RC3rd+2 ", " MacroParam.SetupInfor.RC4th+2)

    mainGUI.SetFont("s10")
        mainGUI.Add("Text", "x304 y512 w257 h34", "Upper right corner (recommended: Flame turret). Round 2, " MacroParam.SetupInfor.RCSpecial1 ", " MacroParam.SetupInfor.RCSpecial2)
        mainGUI.Add("Text", "x304 y576 w257 h34", "Bottom corner (recommended: Mortar). Round " MacroParam.SetupInfor.RSpecialgear2 ", " MacroParam.SetupInfor.RCSpecialgear2)
    mainGUI.SetFont("s14")

    ;simple macro
    mainGUIattribute.input1 := mainGUI.Add("ComboBox", "x16 y136 w112 ", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input2 := mainGUI.Add("ComboBox", "x160 y136 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input3 := mainGUI.Add("ComboBox", "x304 y136 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input4 := mainGUI.Add("ComboBox", "x448 y136 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input5 := mainGUI.Add("ComboBox", "x16 y200 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input6 := mainGUI.Add("ComboBox", "x160 y200 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input7 := mainGUI.Add("ComboBox", "x304 y200 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input8 := mainGUI.Add("ComboBox", "x448 y200 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input9 := mainGUI.Add("ComboBox", "x16 y264 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input10 := mainGUI.Add("ComboBox", "x160 y264 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input11 := mainGUI.Add("ComboBox", "x304 y264 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input12 := mainGUI.Add("ComboBox", "x448 y264 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input17 := mainGUI.Add("ComboBox", "x16 y328 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input18 := mainGUI.Add("ComboBox", "x160 y328 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input19 := mainGUI.Add("ComboBox", "x304 y328 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input20 := mainGUI.Add("ComboBox", "x448 y328 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input21 := mainGUI.Add("ComboBox", "x16 y392 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input22 := mainGUI.Add("ComboBox", "x160 y392 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input23 := mainGUI.Add("ComboBox", "x304 y392 w112", mainGUIattribute.NumberofGearRange)
    mainGUIattribute.input24 := mainGUI.Add("ComboBox", "x448 y392 w112", mainGUIattribute.NumberofGearRange)

    ;advanced macro

    mainGUIattribute.input13 := mainGUI.Add("ComboBox", "x16 y512 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input14 := mainGUI.Add("ComboBox", "x160 y512 w112", mainGUIattribute.NumberofGearRangeLimited)
    mainGUIattribute.input15 := mainGUI.Add("ComboBox", "x16 y576 w112", mainGUIattribute.HotkeyNumberRange)
    mainGUIattribute.input16 := mainGUI.Add("ComboBox", "x160 y576 w112", mainGUIattribute.NumberofGearRangeLimited)

    ; thông tin total gear

    mainGUIattribute.Totalhotkey1 := mainGUI.Add("Text", "x568 y136 w48 h33 +0x200", "0")
    mainGUIattribute.Totalhotkey2 := mainGUI.Add("Text", "x568 y200 w48 h33 +0x200", "0")
    mainGUIattribute.Totalhotkey3 := mainGUI.Add("Text", "x568 y264 w48 h33 +0x200", "0")
    mainGUIattribute.Totalhotkey4 := mainGUI.Add("Text", "x568 y328 w48 h33 +0x200", "0")
    mainGUIattribute.Totalhotkey5 := mainGUI.Add("Text", "x568 y392 w48 h33 +0x200", "0")
    mainGUIattribute.TotalSHotKey1 := mainGUI.Add("Text", "x568 y512 w48 h33 +0x200", "0")
    mainGUIattribute.TotalSHotKey2 := mainGUI.Add("Text", "x568 y576 w48 h33 +0x200", "0")

    Tab.UseTab(mainGUIattribute.Tab.Tabcount)
    mainGUIattribute.Tab.Tabcount++
    ButtonAutoReadyMode := mainGUI.Add("Button", "x32 y" mainGUIattribute.mainGUIWidth - 20 " w275 h30", "Auto Ready Mode")
    ButtonAutoClick := mainGUI.Add("Button", "x317 y" mainGUIattribute.mainGUIWidth - 20 " w275 h30", "Auto Click")
    mainGUI.SetFont("s10")
    mainGUIattribute.HotkeyBox := mainGUI.Add("Hotkey", "x464 y152 w145 h34")
    mainGUI.SetFont("s14")
    mainGUI.Add("Text", "x464 y120 w144 h32 +0x200", "Tinytask Hotkey")
    mainGUIattribute.Mode1 := mainGUI.Add("Radio", "x16 y120 w200 h42", "Func 1")
    mainGUIattribute.Mode2 := mainGUI.Add("Radio", "x16 y224 w200 h42", "Func 2")
    mainGUIattribute.Mode3 := mainGUI.Add("Radio", "x16 y328 w200 h42", "Func 3")
    mainGUI.SetFont("s10")
    mainGUI.Add("Text", "x32 y160 w200 h23 +0x200", "Work with TinyTask")
    mainGUI.Add("Text", "x32 y264 w200 h23 +0x200", "Work with TinyTask")
    mainGUI.Add("Text", "x32 y368 w200 h23 +0x200", "not yet developed")

    ; mainGUI.SetFont("s20")
    ; Spider := mainGUI.Add("Text", "x150 y100 w20 h50 Center BackgroundTrans", "🕷️")
    ; Spider.OnEvent("Click", (*) => ClimbUp())
    ; SetTimer(() => MoveSpiderRandom(), 150)
    ; Spider.X := RandomPos(220, 494)
    ; Spider.Y := RandomPos(0, 494)
    ; global Climbing := false
    ; mainGUI.SetFont("s50", "Tahoma")
    ; Arrow := mainGUI.Add("Text", "x100 y100 w55 h80 c380d04 Center BackgroundTrans", "🕸️")
    ; Arrow.OnEvent("Click", (*) => ArrowBig())
    ; Arrow.Move(Spider.X, Spider.Y)

    Tab.UseTab(mainGUIattribute.Tab.Tabcount)
    mainGUIattribute.Tab.Tabcount++
    mainGUIattribute.LoggingCheckBox := mainGUI.Add("CheckBox", "x16 y104 w361 h26", "Save note to log file")
	mainGUIattribute.AutoPrestigeCheckBox := mainGUI.Add("CheckBox", "x16 y152 w361 h26", "Auto Prestige")
	mainGUI.Add("Text", "x48 y192 w64 h26 +0x200", "Perk :=")
	mainGUIattribute.PerkEdit := mainGUI.Add("Edit", "x112 y192 w488 h40 HScroll")
	mainGUIattribute.AlwaysSetupCheckbox := mainGUI.Add("CheckBox", "x16 y240 w361 h26", "Always Auto Setup Perk Before Macro")
	mainGUIattribute.ImgtoTextButton := mainGUI.Add("Button", "x416 y152 w186 h29", "Run ImgtoText")
    mainGUIattribute.gameUI := mainGUI.Add("CheckBox", "x16 y288 w361 h26", "in Game Overlay")
    mainGUI.Add("Text", "x393 y288 w64 h26 +0x200", "Theme")
    mainGUIattribute.themeChoice := mainGUI.Add("DropDownList", "x462 y288 w140", mainGUIattribute.themeList)


    Tab.UseTab(mainGUIattribute.Tab.Tabcount)
    mainGUIattribute.Tab.Tabcount++
    mainGUI.SetFont("s12", "Segoe UI")
    mainGUI.Add("Text", "x16 y104 w590 h70", "I've done some useful stuff to help you prestige `"lightning fast`" in the game the final stand 2 or more. `nHere are some recommended perks in career mode:")
    mainGUI.Add("Picture", "x16 y176 w195 h128", mainGUIattribute.Img1)
    mainGUI.Add("Text", "x16 y320 w580 h63", "You can explore more features in `"" mainGUIattribute.Tab.nameTab2 "`". Or play with the spider there.`nGood luck have fun!!!")

    mainGUI.Add("Text", "x224 y200 w380 h85 cee2a02", "Note that you should not use perks that can affect the amount of reward received in the first round,`notherwise my code will punch you in the face like I did with Shuriky.")

    Tab.UseTab(mainGUIattribute.Tab.Tabcount)
    mainGUIattribute.Tab.Tabcount++
    mainGUI.Add("Text", "x16 y104 w590 h30", "You can go to this page to download the latest version of this software.")
    mainGUI.Add("Link", "x16 y144 w120 h23", "<a href=`"https://github.com/vezyldicode/EasyHotKey/releases`">Download Here</a>")
    if CheckForUpdates() == false{
        mainGUI.Add("Text", "x16 y" mainGUIattribute.mainGUIWidth - 20 " w591 h23 +0x200", "Current Version: " Metadata.version " (Latest Version)")
    }else{
        mainGUI.Add("Text", "x16 y" mainGUIattribute.mainGUIWidth - 20 " w591 h23 +0x200", "Current Version: " Metadata.version " (An update has been released)")
    }
    
    mainGUIAutoFill()
    mainGUIattribute.StartButton.OnEvent("Click", onButtonClick)
    ButtonAutoReadyMode.OnEvent("Click", AutoReadyModeFunc)
    ButtonAutoClick.OnEvent("Click", AutoClickGUIFunc)
    mainGUIattribute.LoopInput.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input1.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input2.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input3.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input4.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input5.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input6.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input7.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input8.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input9.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input10.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input11.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input12.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input13.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input14.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input15.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input16.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input17.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input18.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input19.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input20.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input21.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input22.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input23.OnEvent("Change", OnEventHandler)
    mainGUIattribute.input24.OnEvent("Change", OnEventHandler)
    mainGUIattribute.LoggingCheckBox.OnEvent("Click", OnEventHandler)
	mainGUIattribute.AutoPrestigeCheckBox.OnEvent("Click", OnEventHandler)
	mainGUIattribute.PerkEdit.OnEvent("Change", OnEventHandler)
	mainGUIattribute.AlwaysSetupCheckbox.OnEvent("Click", OnEventHandler)
	mainGUIattribute.ImgtoTextButton.OnEvent("Click", ImgTool)
    OnEventHandler()
    mainGUI.OnEvent('Close', (*) => ExitApp())
    mainGUI.Show("w" mainGUIattribute.mainGUIWidth " h" mainGUIattribute.mainGUIHeight)
    return mainGUI
}


mainGUIAutoFill(*){
    vars := [
        mainGUIattribute.input1, mainGUIattribute.input2, mainGUIattribute.input3, mainGUIattribute.input4, mainGUIattribute.input5, mainGUIattribute.input6, mainGUIattribute.input7, mainGUIattribute.input8, mainGUIattribute.input9, mainGUIattribute.input10, mainGUIattribute.input11, mainGUIattribute.input12, mainGUIattribute.input13, mainGUIattribute.input14, mainGUIattribute.input15, mainGUIattribute.input16, mainGUIattribute.input17, mainGUIattribute.input18, mainGUIattribute.input19, mainGUIattribute.input20, mainGUIattribute.input21, mainGUIattribute.input22, mainGUIattribute.input23, mainGUIattribute.input24
    ]
    i :=1
    for var in vars{
        var.value := ReadKeyWordFromFile(filePath.data, "input" i)
        i++
    }
    mainGUIattribute.LoggingCheckBox.value := ReadKeyWordFromFile(filePath.setting, "Logging") != 0 ? ReadKeyWordFromFile(filePath.setting, "Logging") : 1
    mainGUIattribute.AutoPrestigeCheckBox.value := ReadKeyWordFromFile(filePath.setting, "AutoPrestige")
    mainGUIattribute.PerkEdit.value := ReadKeyWordFromFile(filePath.setting, "PerkEdit")
    mainGUIattribute.AlwaysSetupCheckbox.value := ReadKeyWordFromFile(filePath.setting, "AlwaysSetup")
    mainGUIattribute.gameUI.value := ReadKeyWordFromFile(filePath.setting, "gameGUI") != 0 ? ReadKeyWordFromFile(filePath.setting, "gameGUI") : 1
    mainGUIattribute.themeChoice.value := ReadKeyWordFromFile(filePath.setting, "theme") != 0 ? ReadKeyWordFromFile(filePath.setting, "theme") : 2
}





; ;lệnh điều khiển và chuyển trạng thái




; global HotkeyBox











OnEventHandler(*){ ;gán các giá trị người dùng vào biến xử lý khi các giá trị thay đổi
    global isContinuePressed  ; Sử dụng biến toàn cục


    vars := [
        mainGUIattribute.input1, mainGUIattribute.input2, mainGUIattribute.input3, mainGUIattribute.input4, mainGUIattribute.input5, mainGUIattribute.input6, mainGUIattribute.input7, mainGUIattribute.input8, mainGUIattribute.input9, mainGUIattribute.input10, mainGUIattribute.input11, mainGUIattribute.input12, mainGUIattribute.input13, mainGUIattribute.input14, mainGUIattribute.input15, mainGUIattribute.input16
    ]
    for var in vars {
        if (!IsNumber(var.text) and var.text != "") {
            shakeButton(var)
        }
    }
    mainGUIattribute.Totalhotkey1.text := mainGUIattribute.input2.Value + mainGUIattribute.input3.Value + mainGUIattribute.input4.Value
    mainGUIattribute.Totalhotkey2.text := mainGUIattribute.input6.Value + mainGUIattribute.input7.Value + mainGUIattribute.input8.Value
    mainGUIattribute.Totalhotkey3.text := mainGUIattribute.input10.Value + mainGUIattribute.input11.Value + mainGUIattribute.input12.Value
    mainGUIattribute.Totalhotkey4.text := mainGUIattribute.input18.Value + mainGUIattribute.input19.Value + mainGUIattribute.input20.Value
    mainGUIattribute.Totalhotkey5.text := mainGUIattribute.input22.Value + mainGUIattribute.input23.Value + mainGUIattribute.input24.Value
    mainGUIattribute.TotalSHotKey1.text := mainGUIattribute.input14.value
    mainGUIattribute.TotalSHotKey2.text := mainGUIattribute.input16.value
    mainGUIattribute.TimeText.Text := EstimatedTimeCal()
}

; global tinytaskHotkey
onButtonClick(*) {
    global isContinuePressed  ; Sử dụng biến toàn cục
    MacroParam.LoopCount := mainGUIattribute.LoopInput.Value
    MacroParam.SetupInfor.HotKey1 := mainGUIattribute.input1.Value
    MacroParam.SetupInfor.NumforHotkey1round2 := mainGUIattribute.input2.Value
    MacroParam.SetupInfor.NumforHotkey1round3 := mainGUIattribute.input3.Value
    MacroParam.SetupInfor.NumforHotkey1round4 := mainGUIattribute.input4.Value
    MacroParam.SetupInfor.HotKey2 := mainGUIattribute.input5.Value
    MacroParam.SetupInfor.NumforHotkey2round2 := mainGUIattribute.input6.Value
    MacroParam.SetupInfor.NumforHotkey2round3 := mainGUIattribute.input7.Value
    MacroParam.SetupInfor.NumforHotkey2round4 := mainGUIattribute.input8.Value
    MacroParam.SetupInfor.HotKey3 := mainGUIattribute.input9.Value
    MacroParam.SetupInfor.NumforHotkey3round2 := mainGUIattribute.input10.Value
    MacroParam.SetupInfor.NumforHotkey3round3 := mainGUIattribute.input11.Value
    MacroParam.SetupInfor.NumforHotkey3round4 := mainGUIattribute.input12.Value
    MacroParam.SetupInfor.HotKey4 := mainGUIattribute.input17.Value
    MacroParam.SetupInfor.NumforHotkey4round2 := mainGUIattribute.input18.Value
    MacroParam.SetupInfor.NumforHotkey4round3 := mainGUIattribute.input19.Value
    MacroParam.SetupInfor.NumforHotkey4round4 := mainGUIattribute.input20.Value
    MacroParam.SetupInfor.HotKey5 := mainGUIattribute.input21.Value
    MacroParam.SetupInfor.NumforHotkey5round2 := mainGUIattribute.input22.Value
    MacroParam.SetupInfor.NumforHotkey5round3 := mainGUIattribute.input23.Value
    MacroParam.SetupInfor.NumforHotkey5round4 := mainGUIattribute.input24.Value
    MacroParam.SetupInfor.SHotKey1 := mainGUIattribute.input13.Value
    MacroParam.SetupInfor.NumforSHotKey1 := mainGUIattribute.input14.Value
    MacroParam.SetupInfor.SHotKey2 := mainGUIattribute.input15.Value
    MacroParam.SetupInfor.NumforSHotKey2 := mainGUIattribute.input16.Value
    HotKey.tinytaskHotkey := mainGUIattribute.HotkeyBox.Value
    switch mainGUIattribute.themeChoice.value{
        case 1:
            Metadata.theme := "white"
        case 2:
            Metadata.theme := "dark"
        default:
            Metadata.theme := "dark"
    }
    if FileExist(filePath.data)
        FileDelete(filePath.data) ;xóa file data cũ
    FileAppend("", filePath.data) ; Tạo file mới
    vars := [
        mainGUIattribute.input1, mainGUIattribute.input2, mainGUIattribute.input3, mainGUIattribute.input4, mainGUIattribute.input5, mainGUIattribute.input6, mainGUIattribute.input7, mainGUIattribute.input8, mainGUIattribute.input9, mainGUIattribute.input10, mainGUIattribute.input11, mainGUIattribute.input12, mainGUIattribute.input13, mainGUIattribute.input14, mainGUIattribute.input15, mainGUIattribute.input16, mainGUIattribute.input17, mainGUIattribute.input18, mainGUIattribute.input19, mainGUIattribute.input20, mainGUIattribute.input21, mainGUIattribute.input22, mainGUIattribute.input23, mainGUIattribute.input24
    ]
    i := 1
    for var in vars{
        WriteValueToFile(filePath.data, "input" i " := " var.Value)
        i++
    }
    if FileExist(filePath.setting)
        FileDelete(filePath.setting) ;xóa file data cũ
    FileAppend("", filePath.setting) ; Tạo file mới
    WriteValueToFile(filePath.setting, "Logging := " mainGUIattribute.LoggingCheckBox.Value)
    WriteValueToFile(filePath.setting, "AutoPrestige := " mainGUIattribute.AutoPrestigeCheckBox.Value)
    WriteValueToFile(filePath.setting, "PerkEdit := " mainGUIattribute.PerkEdit.Text)
    WriteValueToFile(filePath.setting, "AlwaysSetup := " mainGUIattribute.AlwaysSetupCheckbox.Value)
    WriteValueToFile(filePath.setting, "gameGUI := " mainGUIattribute.gameUI.Value)
    WriteValueToFile(filePath.setting, "theme := " mainGUIattribute.themeChoice.Value)

    if (!IsNumber(MacroParam.LoopCount) || MacroParam.LoopCount == 0) {
        shakeButton(mainGUIattribute.StartButton)
        return
    }
    if (mainGUIattribute.Mode3.Value ==1) {
        shakeButton(mainGUIattribute.Mode3)
        return
    }
    if HotKey.tinytaskHotkey == "" and (mainGUIattribute.Mode1.Value ==1 || mainGUIattribute.Mode2.Value ==1) {
        shakeButton(mainGUIattribute.HotkeyBox)
        return
    }

    confirm := MsgBox("Run the program with the number of loops is " MacroParam.LoopCount "`nEstimated time :" EstimatedTimeCal(), "Macro by Vezyl - Press Pgup Key to force Stop", 262212)
    if (confirm == 'No') {
        ; ExitApp  ; Nếu người dùng chọn "No", kết thúc
        isContinuePressed := false
    }else{
        isContinuePressed := true
        mainGUI.Hide()
        if (mainGUIattribute.Mode1.Value == "1"){
            Metadata.Mode := Metadata.ModeList[2]
        }else if (mainGUIattribute.Mode2.Value == "1"){
            Metadata.Mode := Metadata.ModeList[3]
        }else if (mainGUIattribute.Mode3.Value == "1"){
            Metadata.Mode := Metadata.ModeList[4]
        }else {
            Metadata.Mode := Metadata.ModeList[1]
        }
        main()
    }
}


; if (!isContinuePressed) {
;     return
; }
EstimatedTimeCal(){
    totalMinutes := mainGUIattribute.LoopInput.Value * MacroParam.EstimatedTime
    Metadata.EstimatedTotalTime := totalMinutes*60
    hours := totalMinutes // 60
    minutes := Mod(totalMinutes, 60)
    result := " " hours "h" minutes "m"
    return result
}


shakeButton(button) {
    button.GetPos(&x, &y)
    loop 4 {
        button.Move(x + 5, y)
        Sleep(50)
        button.Move(x - 5, y)
        Sleep(50)
    }
    button.Move(x, y)
}

; global NetMove := 0

; MoveSpiderRandom() {
;     global Spider, Spider.X, Spider.Y, Climbing
;     if (Climbing) ; Nếu đang bò lên thì không đi lung tung
;         return

;     ; Sinh giá trị ngẫu nhiên để thay đổi vị trí
;     oldX := Spider.X
;     oldY := Spider.Y
    
;     Spider.Y += RandomPos(-5, 15)
;     if (Spider.X >550){
;         Spider.X += RandomPos(-30, 5)
;     }else if (Spider.X < 250){
;         Spider.X += RandomPos(-5, 30)
;     }else Spider.X += RandomPos(-30, 30)

;     if (Spider.Y > 350){
;         Spider.Y += RandomPos(-30, 5)
;     }else if (Spider.Y <100){
;         Spider.Y += RandomPos(-5, 30)
;     }else Spider.Y += RandomPos(-15, 15)

;     ; Giới hạn vị trí trong phạm vi của GUI
;     Spider.X := Clamp(Spider.X, 220, 583) ; 300 (GUI rộng) - 20 (kích thước nhện)
;     Spider.Y := Clamp(Spider.Y, 0, 424) ; 300 (GUI cao) - 20 (kích thước nhện)
;     Spider.Move(Spider.X, Spider.Y)
;     ; Di chuyển nhện
;     NetMove := RandomPos(-5, 5)
;     Arrow.Text := "🕸️"
;     if (Spider.X > oldX) {
;         Direction := "right"
;         Spider.Text := "🕷️" ; Nhện di chuyển sang phải
;         if NetMove ==1
;             ; Arrow.Move(RandomPos(Spider.X-50, Spider.X+50), RandomPos(Spider.Y-50, Spider.Y+50))
;             Arrow.Move(Spider.X -20, Spider.Y-20)
;     }
;     else if (Spider.X < oldX) {
;         Direction := "left"
;         Spider.Text := "🕷️" ; Nhện di chuyển sang trái
;         if NetMove ==1
;             ; Arrow.Move(RandomPos(Spider.X-50, Spider.X+50), RandomPos(Spider.Y-50, Spider.Y+50))
;             Arrow.Move(Spider.X-20, Spider.Y-20)
;     }
;     else if (Spider.Y > oldY) {
;         Direction := "down"
;         Spider.Text := "🕷️" ; Nhện di chuyển xuống dưới
;     }
;     else if (Spider.Y < oldY) {
;         Direction := "up"
;         Spider.Text := "🕷️" ; Nhện di chuyển lên trên
;     }
    
; }

; RandomPos(min, max) {
;     result := Random(min, max)
;     return result
; }

; Clamp(value, min, max) {
;     return value < min ? min : value > max ? max : value
; }

; ClimbUp() {
;     global Climbing
;     if (Climbing){ ; Nếu đang bò lên rồi thì không lặp lại
;         return
;     }
;     Climbing := true
;     Arrow.Text := ""
    
;     Loop 50 {
;         Spider.Text := "🕷️"
;         Spider.Y -= 2
        
;         Spider.Move(Spider.X, Spider.Y)
;         Spider.BackgroundColor := "BackgroundTrans"
;         Sleep(20)
;     }
    
;     Climbing := false
; }

; ArrowBig(*){
;     Tab.UseTab(2)
;     mainGUI.SetFont("s350", "Tahoma")
;     ArrowBig := mainGUI.Add("Text", "x0 y0 w623 h514 cff0000 Center Background0x000000", "🕸️")
;     sleep (500)
;     ArrowBig.Opt("Hidden")
; }
; isContinuePressed := false
; global roundcount