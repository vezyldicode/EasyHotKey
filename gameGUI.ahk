#Requires AutoHotkey v2.0

class gameGUIattribute{
    static gameGUIWidth := 405
    static gameGUIHeight := 147
    static gameGUIX := ((HwID.xMax - gameGUIattribute.gameGUIWidth * HwID.dpi) / 2)/HwID.dpi ; X tại giữa màn hình
    static gameGUIY := HwID.yMax /18 ; Y tại 1/12 chiều rộng màn hình
    static loopEdit := 0, roundSurvived := 0, roundEdit := 0, timeEdit := 0, Progressvar := 0, gameProgress := 0
    static changeText := true
}


gameGUIcall(*){
    global changeText := false
    gameGUI := Gui()
    
    gameGUI.SetFont(, "Segoe UI")
    gameGUI.Opt("+AlwaysOnTop -Caption")
    if Metadata.theme == "dark"{
        gameGUI.BackColor := "0x000040"
        gameGUI.SetFont("cWhite")
    }else if Metadata.theme == "white"{
        gameGUI.BackColor := "0x00ACC1"
        gameGUI.SetFont("c0xF3FBFC")
    }
	gameGUI.SetFont("s16")
	gameGUI.Add("Text", "x0 y8 w405 h42 +0x200 +Center", Metadata.name)

	gameGUI.SetFont("s14")
	gameGUIattribute.loopEdit := gameGUI.Add("Text", "x8 y96 w96 h26 +0x200", "Loop" MacroParam.LoopCurrent "/" MacroParam.LoopCount)
	gameGUIattribute.roundsSurvived := gameGUI.Add("Text", "x8 y64 w389 h23 +0x200", "Rounds survived last time: 0")
	gameGUI.Add("Text", "x-8 y56 w493 h1 +0x10")
	gameGUIattribute.roundEdit := gameGUI.Add("Text", "x104 y96 w176 h26 +0x200", "Current Round: 0")
	gameGUIattribute.timeEdit := gameGUI.Add("Text", "x288 y96 w106 h26 +0x200", "Time")
    gameGUIattribute.Progressvar :=  0 ;loopCurrent / userInput *100
	gameGUIattribute.gameProgress := gameGUI.Add("Progress", "x0 y128 w407 h20 -Smooth +Background0x000040 +C0x006A67", gameGUIattribute.Progressvar)
	gameGUI.Title := "Press Pgup Key to cancel"
    gameGUI.Show
    gameGUI.Move(gameGUIattribute.gameGUIX, gameGUIattribute.gameGUIY, gameGUIattribute.gameGUIWidth, gameGUIattribute.gameGUIHeight)
    ; Sử dụng SetTimer để cập nhật GUI
    
    SetTimer(UpdateTimer, 1000)

    ; Hàm cập nhật thời gian trong GUI
    return gameGUI
}

UpdateTimer() {
        ElapsedTime := Round((A_TickCount - Metadata.StartTime) / 1000) ; Tính thời gian đã trôi qua bằng giây
        mins := ElapsedTime //60
        hours := mins //60
        mins := Mod(mins, 60)
        seconds := Mod(ElapsedTime, 60)
        if (!gameGUIattribute.changeText){
            gameGUIattribute.changeText := true
            gameGUIattribute.loopEdit.Text := "Loop" MacroParam.LoopCurrent "/" MacroParam.LoopCount
            gameGUIattribute.timeEdit.Text := hours "h " mins "m " seconds "s"
            gameGUIattribute.roundEdit.Text := Metadata.Mode
            if Metadata.Mode == Metadata.ModeList[1]{
                closest := 0
                if (MacroParam.SetupInfor.ShopUpgradeRound >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.ShopUpgradeRound < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Upgrade shop on round: " MacroParam.SetupInfor.ShopUpgradeRound
                    closest := MacroParam.SetupInfor.ShopUpgradeRound
                }
                if (MacroParam.SetupInfor.RCSpecial1 >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RCSpecial1 < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Special Gear 1st time on round: " MacroParam.SetupInfor.RCSpecial1
                    closest := MacroParam.SetupInfor.RCSpecial1
                }
                if (MacroParam.SetupInfor.RCSpecial2 >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RCSpecial2 < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Special Gear 2nd time on round: " MacroParam.SetupInfor.RCSpecial2
                    closest := MacroParam.SetupInfor.RCSpecial2
                }
                if (MacroParam.SetupInfor.RC1st >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RC1st < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Normal Gear 1st time on round: " MacroParam.SetupInfor.RC1st
                    closest := MacroParam.SetupInfor.RC1st
                }
                if (MacroParam.SetupInfor.RC2nd >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RC2nd < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Normal Gear 2nd time on round: " MacroParam.SetupInfor.RC2nd
                    closest := MacroParam.SetupInfor.RC2nd
                }
                if (MacroParam.SetupInfor.RC3rd >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RC3rd < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Normal Gear 3rd time on round: " MacroParam.SetupInfor.RC3rd
                    closest := MacroParam.SetupInfor.RC3rd
                }
                if (MacroParam.SetupInfor.RC4th >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RC4th < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Normal Gear 4th time on round: " MacroParam.SetupInfor.RC4th
                    closest := MacroParam.SetupInfor.RC4th
                }
                if (MacroParam.SetupInfor.RC5th >= MacroParam.roundcount && (closest == 0 || MacroParam.SetupInfor.RC5th < closest)){
                    gameGUIattribute.roundsSurvived.Text := "Recharge Normal Gear 5th time on round: " MacroParam.SetupInfor.RC5th
                    closest := MacroParam.SetupInfor.RC5th
                }
            }
        }else {
            gameGUIattribute.changeText := false
            gameGUIattribute.roundEdit.Text := "Current Round: " MacroParam.roundcount
            gameGUIattribute.timeEdit.Text := "Dis: " MacroParam.cDis
            gameGUIattribute.roundsSurvived.Text := "Rounds survived last time: " MacroParam.roundsSurvived
            
        }
        ; roundEdit.Text := "Me cha may hien lein" roundcount
        If Metadata.Mode == Metadata.ModeList[1]{
            gameGUIattribute.Progressvar := ElapsedTime / Metadata.EstimatedTotalTime * 100
        }
        gameGUIattribute.gameProgress.Value := gameGUIattribute.Progressvar
}