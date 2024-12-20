#Requires AutoHotkey v2.0

WriteValueToFile(filePath, content) { ; ghi file
    FileAppend(content "`n", filePath) ; Thêm nội dung vào file
}

GenerateConfigFile(){
    If !FileExist(filePath.cus) || FileGetSize(filePath.cus) = 0 {
        if FileExist(filePath.cus)
            FileDelete(filePath.cus)
        FileAppend("### " Metadata.name " ###", filePath.cus)
        WriteValueToFile(filePath.cus, '`n---`n')
        WriteValueToFile(filePath.cus, '[General]')
        WriteValueToFile(filePath.cus, '    App_name := MacroController')
        WriteValueToFile(filePath.cus, '    App_version := ' Metadata.version)
        WriteValueToFile(filePath.cus, '    DevMode := false')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[FilePath]')
        WriteValueToFile(filePath.cus, '    ### Path to AutoHotkey.exe file')
        WriteValueToFile(filePath.cus, '    AHKfilePath := "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"')
        WriteValueToFile(filePath.cus, '    ### Path to RobloxPlayerBeta.exe file')
        WriteValueToFile(filePath.cus, '    robloxPath := auto')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[GameDetection]')
        WriteValueToFile(filePath.cus, '    window_search_timeout(second) := 10')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[MacroCommands]')
        WriteValueToFile(filePath.cus, '    stop_macro := PgDn')
        WriteValueToFile(filePath.cus, '    command_timeout(second) := 180')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[AdvancedMacroCommands]')
        WriteValueToFile(filePath.cus, "    `n *** key bind to adjust the mode for gear ***")
        WriteValueToFile(filePath.cus, "    GearModeKeyBind := B")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[InputSettings]')
        WriteValueToFile(filePath.cus, "    *** Digitized images for events ***")
        WriteValueToFile(filePath.cus, "    TF2.Bild := ")
        WriteValueToFile(filePath.cus, "    PlayButton.Bild := ")
        WriteValueToFile(filePath.cus, "    PrivateGame.Bild := ")
        WriteValueToFile(filePath.cus, "    CareerMode.Bild := ")
        WriteValueToFile(filePath.cus, "    CreatePrivate.Bild := ")
        WriteValueToFile(filePath.cus, "    PlayGame.Bild := ")
        WriteValueToFile(filePath.cus, "    ReadyUp.Bild := ")
        WriteValueToFile(filePath.cus, "    ViewChange.Bild := ")
        WriteValueToFile(filePath.cus, "    `n *** 4 desired mouse positions to set Normal gear ***")
        WriteValueToFile(filePath.cus, "    N_Mouse_position_1 := 0, 0")
        WriteValueToFile(filePath.cus, "    N_Mouse_position_2 := 0, 0")
        WriteValueToFile(filePath.cus, "    N_Mouse_position_3 := 0, 0")
        WriteValueToFile(filePath.cus, "    N_Mouse_position_4 := 0, 0")
        WriteValueToFile(filePath.cus, "    `n *** Desired mouse positions to set Special gear 2 ***")
        WriteValueToFile(filePath.cus, "    S_Mouse_position_2 := 0, 0")
        WriteValueToFile(filePath.cus, "    `n *** 11 mouse positions to upgrade shop ***")
        WriteValueToFile(filePath.cus, "    ShopBuy_Mouse_position := 0, 0")
        WriteValueToFile(filePath.cus, "    ShopUpragde_Mouse_position := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_1 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_2 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_3 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_4 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_5 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_6 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_7 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shop_Mouse_position_8 := 0, 0")
        WriteValueToFile(filePath.cus, "    Shopnext_Mouse_position := 0, 0")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[MacroSettings]')
        WriteValueToFile(filePath.cus, "    doorDis := 2310")
        WriteValueToFile(filePath.cus, "    centerDis := 2440")
        WriteValueToFile(filePath.cus, "    maxDis(cDis) := 40")
        WriteValueToFile(filePath.cus, "    RechargeNormalGear1st := 14")
        WriteValueToFile(filePath.cus, "    RechargeNormalGear2nd := 18")
        WriteValueToFile(filePath.cus, "    RechargeNormalGear3rd := 21")
        WriteValueToFile(filePath.cus, "    RechargeNormalGear4th := 26")
        WriteValueToFile(filePath.cus, "    RechargeNormalGear5th := -3")
        WriteValueToFile(filePath.cus, "    FirstRechargeSpecialGear1 := 17")
        WriteValueToFile(filePath.cus, "    SecondRechargeSpecialGear1 := 24")
        WriteValueToFile(filePath.cus, "    RoundtoSetupSpecialGear2 := 3")
        WriteValueToFile(filePath.cus, "    FirstRechargeSpecialGear2 := 20")
        WriteValueToFile(filePath.cus, "    ShopUpgradeRound := 22")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[AdvancedMacroSettings]')
        WriteValueToFile(filePath.cus, "    ResetRound := 32")
        WriteValueToFile(filePath.cus, "    1Dis := 700")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[ControlSettings]')
        WriteValueToFile(filePath.cus, '    KeyHoldDuration(ms) := 150')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[AdvancedGameControl]')
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[CustomModeControl]')
        WriteValueToFile(filePath.cus, "    Mode1_Mouse_position := 0, 0")
        WriteValueToFile(filePath.cus, "    Mode2_Mouse_position := 0, 0")
        WriteValueToFile(filePath.cus, "    CusdoorDis := 2110")
        WriteValueToFile(filePath.cus, "    Custom_Mode_Timeout(ms) := 7200000")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[PrestigeSettings]')
        WriteValueToFile(filePath.cus, "    lv50.Bild := ")
        WriteValueToFile(filePath.cus, "    lv50DetectRange := 0, 0, 0, 0")
        WriteValueToFile(filePath.cus, "    PerkBoard := 0, 0, 0, 0")
        WriteValueToFile(filePath.cus, "    Unlock.Bild := ")
        WriteValueToFile(filePath.cus, "    Prestige.Bild := ")
        WriteValueToFile(filePath.cus, "    PrestigeButton.Bild := ")
        WriteValueToFile(filePath.cus, "    PerksButton.Bild := ")
        WriteValueToFile(filePath.cus, "    PerkBoard := 0, 0, 0, 0")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild1 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild2 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild3 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild4 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild5 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild6 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild7 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild8 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild9 := ")
        WriteValueToFile(filePath.cus, "    FillPerk.Bild10 := ")
        WriteValueToFile(filePath.cus, "    Lv5.Bild := ")
        WriteValueToFile(filePath.cus, "    Lv15.Bild := ")
        WriteValueToFile(filePath.cus, "    Lv30.Bild := ")
        WriteValueToFile(filePath.cus, "    PerkSlot1 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot2 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot3 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot4 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot5 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot6 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot7 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot8 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot9 := 0, 0")
        WriteValueToFile(filePath.cus, "    PerkSlot10 := 0, 0")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[UISettings]')
        WriteValueToFile(filePath.cus, "    IngameUI := on")
        WriteValueToFile(filePath.cus, "    theme := dark")
        WriteValueToFile(filePath.cus, '---`n`n')
        WriteValueToFile(filePath.cus, '[Logging]')
        WriteValueToFile(filePath.cus, "    log_max_size(MB) := 10")
    }
}


If !FileExist(filePath.his){
    FileAppend("", filePath.his) ; Tạo file mới
}