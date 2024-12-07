#Requires AutoHotkey v2.0



	

notiGUIcall(type, content)
{	
	errorGUI := Gui()
    errorGUI.BackColor := 0xFBFBFB
    errorGUI.SetFont("c484b6a")
    errorGUI.SetFont("s11", "Segoe UI")
    ButtonClicked := false
	errorGUI.Opt("-MinimizeBox -MaximizeBox +ToolWindow -Caption +AlwaysOnTop")
	if type == "Error"{
		errorGUI.Add("Picture", "x64 y16 w87 h83", Metadata.errorIcon)
	}else if type == "Success"{
		errorGUI.Add("Picture", "x64 y16 w87 h83", Metadata.successIcon)
	}
	errorGUI.Add("Text", "x16 y144 w192 h124", content)
	errorGUI.Add("Text", "x-24 y128 w275 h2 +0x10")
	ButtonOK := errorGUI.Add("Button", "x16 y288 w193 h33", "&OK")
    errorGUI.Show("w224 h332")
	; errorGUI.OnEvent('Close', (*) => ExitApp())
	errorGUI.Title := "Window"
	OnEventHandler(*)
	{
		return
	}
    ButtonOK.OnEvent("Click", (*) => ButtonClicked := true)
    while !ButtonClicked
        Sleep 50
    errorGUI.Destroy()
    return errorGUI
}
