function create_ripple(x,y,width,height)
	local ripple = {
		magic_circles={}
    }

    ripple.circle_maker = create_one_second_interval(
        function()
            local new_magic_circle = mk_mgk_circ(
                x,
                y,
                width,
                height
            )
            add(ripple.magic_circles, new_magic_circle )
        end
    )
		
    function ripple:update()
        self.circle_maker:update()
        
        for circle in all(self.magic_circles) do
            circle:update()
            fade_magic_circle(self.magic_circles, circle)
        end 
    end
		
	function ripple:draw()
        for circle in
        all(self.magic_circles)
        do circle:draw()
        end
    end

    return ripple

end

function fade_magic_circle(magic_circle_table, magic_circle)
    local growth_percent = magic_circle.width_lerper.t

    if(growth_percent == 1) then 
        del(magic_circle_table, magic_circle)
    elseif(growth_percent > .8) then 
        magic_circle.color = color_enum.charcoal
    elseif(growth_percent > .6)then
        magic_circle.color = color_enum.grey_purple
    end

end