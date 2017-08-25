#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Hacked Together from
;https://hackerspace.kinja.com/removing-the-windows-title-bar-with-autohotkey-1015709275
;and
;https://autohotkey.com/boards/viewtopic.php?p=123166#p123166

;-Caption
#w::
WinSet, Style, -0xC00000, A
WinSet, Style, -0x40000, A
WinSet, ExStyle, -0x00000200, A
return
;

;+Caption
#Enter::
WinSet, Style, +0xC00000, A
WinSet, Style, +0x40000, A
WinSet, ExStyle, +0x00000200, A
return
;