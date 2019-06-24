#include <Array.au3>
WinActivate("Wizard101")
HotKeySet("q", "_Exit")
Local $Loop = 1
Local $Times = InputBox("Games to play", "Please enter current energy")
$Times = Floor($Times/8)
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")
While $Loop <= $Times
   Send("x")
   Sleep(300)
   ;Dragonspyre
   MouseClick("Left", $ClientPos[0] + 590, $ClientPos[1] + 470)
   MouseClick("Left", $ClientPos[0] + 590, $ClientPos[1] + 545)
   Local $MoveArray[7] = []
   While PixelGetColor($ClientPos[0] + 595, $ClientPos[1] + 593) <> 0x40382E
	  Sleep(20)
   WEnd
   ConsoleWrite("Game Starting... ")
   Sleep(1300)
   For $Round = 2 to 6
	  Local $Moves = 0
	  While $Moves <= $Round
		 PixelSearch($ClientPos[0] + 403, $ClientPos[1] + 560, $ClientPos[0] + 403, $ClientPos[1] + 560, 0xF4E940, 15)
		 If Not(@error) Then
			;Up or Down
			PixelSearch($ClientPos[0] + 409, $ClientPos[1] + 568, $ClientPos[0] + 409, $ClientPos[1] + 568, 0xCCBD17, 15)
			If Not(@Error) Then
			   ConsoleWrite("UP, ")
			   _ArrayInsert($MoveArray, $Moves, "Up")
			Else
			   ConsoleWrite("DOWN, ")
			   _ArrayInsert($MoveArray, $Moves, "Down")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
		 PixelSearch($ClientPos[0] + 415, $ClientPos[1] + 571, $ClientPos[0] + 415, $ClientPos[1] + 571, 0xF1E516, 15)
		 If Not(@error) Then
			;Left or Right
			PixelSearch($ClientPos[0] + 400, $ClientPos[1] + 582, $ClientPos[0] + 400, $ClientPos[1] + 582, 0x978917, 15)
			If Not(@Error) Then
			   ConsoleWrite("LEFT, ")
			   _ArrayInsert($MoveArray, $Moves, "Left")
			Else
			   ConsoleWrite("RIGHT, ")
			   _ArrayInsert($MoveArray, $Moves, "Right")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
	  WEnd
	  ;Execute Moves
	  Sleep(500)
	  For $i = 0 to $Moves
		 If $MoveArray[$i] == "Down" Then
			ConsoleWrite("Sending Down, ")
			Send("s")
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Up" Then
			ConsoleWrite("Sending Up, ")
			Send("w")
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Right" Then
			ConsoleWrite("Sending Right, ")
			Send("d")
			Sleep(150)
		 ElseIf $MoveArray[$i] == "Left" Then
			ConsoleWrite("Sending Left, ")
			Send("a")
			Sleep(150)
		 EndIf
	  Next
   Next
   Sleep(2500)
   MouseClick("Left", $ClientPos[0] + 582, $ClientPos[1] + 536)
   Sleep(100)
   MouseClick("Left", $ClientPos[0] + 219, $ClientPos[1] + 465)
   MouseClick("Left", $ClientPos[0] + 584, $ClientPos[1] + 536)
   MouseClick("Left", $ClientPos[0] + 224, $ClientPos[1] + 537)
   $Loaded = False
   While $Loaded == False
	  PixelSearch($ClientPos[0] + 279, $ClientPos[1] + 556, $ClientPos[0] + 279, $ClientPos[1] + 556, 0xEE76B4, 5)
	  If Not(@Error) Then
		 $Loaded = True
	  Else
		 Sleep(50)
	  EndIf
   WEnd
   $Loop = $Loop + 1
WEnd

Func _Exit()
   ProcessClose("DanceBot.au3")
   Exit
EndFunc
