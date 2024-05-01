function title_st()
	--music(0)
	ball=mk_ball(34,25,2)
	--ripple effect
	rip=create_ripple(66,97,50,20)
	return {
		update=function()
			rip:update()
			ball:update()
			if(btnp(❎))
			then game_state=act_st()
			end
		end,
		
		draw=function()
			print('summoner 🐱',43,15,12)
			print('❎ to start',40,112,9)
		rip:draw()
			ball:draw()
		end
	}
end