
library Utility
	public function DisplayMessageToPlayer takes string msg, integer playerid returns nothing
		call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, msg )
	endfunction


	public function DisplayMessageToAllPlayers takes string msg returns nothing
		local integer i = 0
		loop
		exitwhen i > 12
			call DisplayMessageToPlayer(msg, i)
		set i = i + 1
		endloop
	endfunction

	public function DrawGrid takes nothing returns nothing
		local integer i = 0
		local integer j = 0
		local real minX = GetRectMinX(GetWorldBounds())
		local real minY = GetRectMinY(GetWorldBounds())
		local real maxX = GetRectMaxX(GetWorldBounds())
		local real maxY = GetRectMaxY(GetWorldBounds())
		local real width = RAbsBJ(minX - maxX)
		local real height = RAbsBJ(minY - maxY)
		local integer tileWidth = 128
		local string model = "Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl"

		set j = R2I(minY)
		loop
			exitwhen j > R2I(maxY)
			set i = R2I(minX)
			loop
				exitwhen i > R2I(maxX)
					call AddSpecialEffect(model, I2R(i), I2R(j))
				set i = i + 32
			endloop
			set j = j + 128
		endloop

		set j = R2I(minX)
		loop
			exitwhen j > R2I(maxX)
			set i = R2I(minY)
			loop
				exitwhen i > R2I(maxY)
					call AddSpecialEffect(model, I2R(j), I2R(i))
				set i = i + 32
			endloop
			set j = j + 128
		endloop
	endfunction

	public function DrawRectangle takes real x1, real y1, real x2, real y2 returns nothing

		local integer i = 0
		local integer j = 0
		local string model = "Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl"
		call DisplayMessageToAllPlayers(R2S(x1))
		call DisplayMessageToAllPlayers(R2S(y1))
		call DisplayMessageToAllPlayers(R2S(x2))
		call DisplayMessageToAllPlayers(R2S(y2))
		call DisplayMessageToAllPlayers(R2S(RAbsBJ(x1 - x2)))


		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call AddSpecialEffect(model, I2R(i), y1)
			set i = i + 16
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call AddSpecialEffect(model, x2, I2R(j))
			set j = j + 16
		endloop
		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call AddSpecialEffect(model, I2R(i), y2)
			set i = i + 16
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call AddSpecialEffect(model, x1, I2R(j))
			set j = j + 16
		endloop
	endfunction

	public function DrawTempRectangle takes real x1, real y1, real x2, real y2 returns nothing
		local integer i = 0
		local integer j = 0
		local string model = "Abilities\\Weapons\\SerpentWardMissile\\SerpentWardMissile.mdl"
		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call DestroyEffect(AddSpecialEffect(model, I2R(i), y1))
			set i = i + 16
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call DestroyEffect(AddSpecialEffect(model, x2, I2R(j)))
			set j = j + 16
		endloop
		set i = R2I(x1)
		loop
			exitwhen i > R2I(x2)
				call DestroyEffect(AddSpecialEffect(model, I2R(i), y2))
			set i = i + 16
		endloop
		set j = R2I(y1)
		loop
			exitwhen j > R2I(y2)
				call DestroyEffect(AddSpecialEffect(model, x1, I2R(j)))
			set j = j + 16
		endloop
	endfunction
	
	


	public function DrawRect takes rect rectangle returns nothing
		call DrawRectangle(GetRectMinX(rectangle),GetRectMinY(rectangle),GetRectMaxX(rectangle),GetRectMaxY(rectangle))
		set rectangle = null
	endfunction

	public function DrawTempRect takes rect rectangle returns nothing
		call DrawTempRectangle(GetRectMinX(rectangle),GetRectMinY(rectangle),GetRectMaxX(rectangle),GetRectMaxY(rectangle))
		set rectangle = null
	endfunction


endlibrary




