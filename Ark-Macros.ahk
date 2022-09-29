; ARK Survival Evolved - Gameplay Macros for Scruffy cluster (Odium)
; -------------------------------------------------------------------
; Forked by Sigvaldr for official ScruffyGaming use

; F1 Spam Left Click
; F2 Spam Right Click
; F3 AutoRun/Fly (Holds shift + W)
; F4 Toggle Gamma (2.2 - 3 - 4)
; F5 Reboot Script / Halt running macros
; F7 /nw stats (Used on Scruffy's for checking tame base stats)
; F8 /decaytime (Used on Scruffy's for checking a base's decay timer)
; F9 Spam 'E' (User Request)

#MaxThreadsPerHotkey, 2
#NoEnv ; 			Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; 	Recommended for new scripts due to its superior speed and reliability.


; Render GUI
MsgBox,032,Ark-Macros,`nHotkeys:`n`n`nF3 - AutoRun/Fly (Holds shift + W)`n`nF4 - Toggle Gamma (2.2 - 3 - 4)`n`nF5 - Reboot Script / Halt running macros`n`nF7 - /nw stats (Used on Scruffy's for checking tame base stats)`n`nF8 - /decaytime (Used on Scruffy's for checking a base's decay timer)`n`nF9 - Spam 'E'"]



; --- VARIABLES ----

GammaToggle := 1
SprintToggle := false
SpamToggle := false
TameToggle := 0



; --- HOTKEYS ----

F1::
SpamToggle := !SpamToggle ; If SpamToggle is true, make it false.  If false, make it true.
	While (SpamToggle) {
		Click, down
		Click, up
		Sleep, 100
	}
return  



F2::
SpamToggle := !SpamToggle
	While (SpamToggle) {
		Click, right				
		Sleep, 100
	}    
return



*F3:: ; The '*' Specifies that when F3 is pressed again, to disregard the fact that shift is being held down by the script. (Shift+F3 is not the macro, so without this modifier the macro cannot trigger a second time.)
	If (!SprintToggle) {
		Send, {w Down}
		Send, {Shift Down}
		SprintToggle := true
	}
	else
	{
		Send, {w Up}
		Send, {Shift Up}
		SprintToggle := false  
	}
return



F4::
	if (GammaToggle = 0) {
		Send, {Tab}
		Send, gamma 2.2
		Send, {Enter}
		GammaToggle := 1
	}
	else if (GammaToggle = 1)
	{
		Send, {Tab}
		Send, gamma 3
		Send, {Enter}
		GammaToggle := 2
	} 
	else if (GammaToggle = 2)
	{
		Send, {Tab}
		Send, gamma 4
		Send, {Enter}
		GammaToggle := 0
	} 
return



F5::Reload ; Cease any activated macros and Restart the script.



; The Following are for Plugins running on Scruffy Cluster/Using Specific plugins Only.

F7::
	Send, {Enter}
    Sleep, 50
    Send, /nw stats
    Send, {Enter}
return  



F8::
    Send, {Enter}
    Sleep, 50
    Send, /decaytime
    Send, {Enter}
return

F9::
SpamToggle := !SpamToggle
	While (SpamToggle) {
		Send, {e Down}
		Send, {e Up}	
		Sleep, 100
	}
return