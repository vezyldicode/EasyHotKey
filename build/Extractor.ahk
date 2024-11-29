#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "Mouse", "Screen"
CoordMode "Pixel", "Screen"

cusFilePath := A_WorkingDir "\MacroCustomization.ini"
If !FileExist(cusFilePath) || FileGetSize(cusFilePath) = 0 {
    if FileExist(cusFilePath) ; Kiểm tra sự tồn tại trước khi xóa
        FileDelete(cusFilePath) ; Xóa file nếu có nhưng trống

    FileAppend("", cusFilePath) ; Tạo file mới
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, 'path to AutoHotkey.exe file')
    WriteValueToFile(cusFilePath, 'AHKfilePath := "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"')
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, 'path to RobloxPlayerBeta.exe file')
    WriteValueToFile(cusFilePath, 'robloxPath := auto')
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
    WriteValueToFile(cusFilePath, "Mouse position at the white text in the Ready button (recommended to choose the letter R to avoid being recognized as counting kills)")
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
    WriteValueToFile(cusFilePath, "11 mouse positions to upgrade shop")
    WriteValueToFile(cusFilePath, "xshop1 := ")
    WriteValueToFile(cusFilePath, "yshop1 := ")
    WriteValueToFile(cusFilePath, "xshop2 := ")
    WriteValueToFile(cusFilePath, "yshop2 := ")
    WriteValueToFile(cusFilePath, "xshop3 := ")
    WriteValueToFile(cusFilePath, "yshop3 := ")
    WriteValueToFile(cusFilePath, "xshop4 := ")
    WriteValueToFile(cusFilePath, "yshop4 := ")
    WriteValueToFile(cusFilePath, "xshop5 := ")
    WriteValueToFile(cusFilePath, "yshop5 := ")
    WriteValueToFile(cusFilePath, "xshop6 := ")
    WriteValueToFile(cusFilePath, "yshop6 := ")
    WriteValueToFile(cusFilePath, "xshop7 := ")
    WriteValueToFile(cusFilePath, "yshop7 := ")
    WriteValueToFile(cusFilePath, "xshop8 := ")
    WriteValueToFile(cusFilePath, "yshop8 := ")
    WriteValueToFile(cusFilePath, "xshop9 := ")
    WriteValueToFile(cusFilePath, "yshop9 := ")
    WriteValueToFile(cusFilePath, "xshop10 := ")
    WriteValueToFile(cusFilePath, "yshop10 := ")
    WriteValueToFile(cusFilePath, "xshopnext := ")
    WriteValueToFile(cusFilePath, "yshopnext := ")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "Position the mouse on the screen at the position of special gear 2 (recommended in the middle of the character)")
    WriteValueToFile(cusFilePath, "xs2 := 0")
    WriteValueToFile(cusFilePath, "ys2 := 0")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "doorDis := 2310")
    WriteValueToFile(cusFilePath, "CusdoorDis := 2110")
    WriteValueToFile(cusFilePath, "centerDis := 2440")
    WriteValueToFile(cusFilePath, "maxDis(cDis) := 30")
    WriteValueToFile(cusFilePath, "Robloxopentimeoutvar := 15000")
    WriteValueToFile(cusFilePath, "CustomModetimeoutvar := 7200000")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "GearModeKeyBind := B")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "RechargeNormalGear1st := 10")
    WriteValueToFile(cusFilePath, "RechargeNormalGear2nd := 14")
    WriteValueToFile(cusFilePath, "RechargeNormalGear3rd := 18")
    WriteValueToFile(cusFilePath, "RechargeNormalGear4th := 21")
    WriteValueToFile(cusFilePath, "RechargeNormalGear5th := 26")
    WriteValueToFile(cusFilePath, "RechargeSpecialGear1 := 17")
    WriteValueToFile(cusFilePath, "ShopUpgradeRound := 21")
    WriteValueToFile(cusFilePath, '---')
    WriteValueToFile(cusFilePath, "xMode1 := 0")
    WriteValueToFile(cusFilePath, "yMode1 := 0")
    WriteValueToFile(cusFilePath, "xMode2 := 0")
    WriteValueToFile(cusFilePath, "yMode2 := 0")
}

WriteValueToFile(filePath, content) { ; ghi file
FileAppend(content "`n", filePath) ; Thêm nội dung vào file
}
Ghi := FileRead(cusFilePath)
TraySetIcon(A_WorkingDir "\Ico\Setting.ico")
myGui := Constructor()
myGui.Opt("-MaximizeBox +AlwaysOnTop -DPIScale")
myGui.Show("w457 h887")

    
    Constructor()
    {	
        myGui := Gui()
        myGui.BackColor := 0xFBFBFB
        myGui.SetFont("c484b6a")
        
        global Edit2, Edit3
        myGui.SetFont("s12", "Segoe UI")
        ButtonOK := myGui.Add("Button", "x9 y45 w440 h23", "SAVE")
        Edit1 := myGui.Add("Edit", "x8 y72 w440 h801", Ghi)
        myGui.SetFont("s11", "Segoe UI")
        myGui.Add("Text", "x8 y0 w104 h26 +0x200", "Mouse Position:")
        Edit2 := myGui.Add("Edit", "x112 y0 w115 h25 +ReadOnly")
        myGui.Add("Text", "x248 y0 w73 h27 +0x200", "Color:")
        Edit3 := myGui.Add("Edit", "x320 y0 w115 h25 +ReadOnly")
        myGui.SetFont("s7", "Segoe UI")
        myGui.Add("Text", "x8 y24 w439 h23 +0x200", "Press ↑ to save the mouse position value to the Clipboard and press ↓ to save the color code")
        
        
        myGui.OnEvent('Close', (*) => ExitApp())
        myGui.Title := "Setting"
        Edit1.OnEvent("Change", OnEventHandler)
        ButtonOK.OnEvent("Click", OnEventHandler)
        SetTimer(GetVar, 50)

        OnEventHandler(*)
        {
            global save := Edit1.value
            FileDelete(cusFilePath)
            FileAppend("", cusFilePath) ; Tạo file mới
            WriteValueToFile(cusFilePath, save)
        }
        return myGui
    }
    GetVar(*){
        global Edit2, Edit3
        MouseGetPos &xpos, &ypos 
        color := PixelGetColor(xpos, ypos)
        Edit2.Value := xpos " " ypos
        Edit3.Value := color
        if (GetKeyState("Up", "P")) {
            MousePos := Edit2.Value
            A_Clipboard := MousePos
            ToolTip( "Mouse Position Saved")
            SetTimer () => ToolTip(), -3000
        }        
        if (GetKeyState("Down", "P")) {
            ColorPos := Edit3.Value
            A_Clipboard := ColorPos
            ToolTip( "Color Code Saved")
            SetTimer () => ToolTip(), -3000
        }
    }