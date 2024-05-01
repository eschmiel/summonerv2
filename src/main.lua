--life cycle
function _init()
	x=1
	game_state = title_st()
	import '../assets/sheets/init.png'
end

function _update()
	game_state:update()
end

function _draw()
	cls()
	
	rect(0,0,127,127,1)
	game_state:draw()
end