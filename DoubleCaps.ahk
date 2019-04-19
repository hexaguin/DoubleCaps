; DoubleCaps
; A simple AHK script to only enable CapsLock when double tapped, and disable on single tap.
; Allows CapsLock to still be used when desired (unlike remapping), but prevents accidental activation.

beep    := true  ; Enable beeping on capslock toggle?
timeout := 300   ; Double tap timeout (in ms)

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetCapsLockState, AlwaysOff  ; Start with caps disabled

CapsLock::
	if (GetKeyState("CapsLock", "T")) {  ; Check if we're disabling caps
		SetCapsLockState, AlwaysOff
		if (beep = true) {
			SoundBeep, 523, 150
		}
		return
	} else if (A_PriorHotkey = "CapsLock" and A_TimeSincePriorHotkey < timeout) {  ; Check if this is a double press
		SetCapsLockState, AlwaysOn
		if (beep = true) {
			SoundBeep, 587, 100
			Sleep, 25
			SoundBeep, 587, 100
		}
	} 
return