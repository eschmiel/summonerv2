function act_st()
	import 'sheets/reorg2.png'
	p=mk_player(20,20)
	p_am=mk_p_am()--player animation manager
	cont=mk_act_cont()
	cur_r=rooms[1]--current room
	info=mk_info_box()
	return{
		update=function()
			p:update()
			cont:update()
			hand_phys_col()
			hand_doors()
			info:update()
		end,
		draw=function()
			draw_room()
			p:draw()
			info:draw()
			cont:draw()
			--draw_boxes({p:sel_col()})
		--	for k,v in pairs(p_am:c())
		--	do print(k)
		--				print(v)
		--	end
		end
	}