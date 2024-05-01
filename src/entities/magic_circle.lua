-- We should probably rename this to growing circle
function mk_mgk_circ(x,y,width,height)
    local magic_circle = {
        color= color_enum.grey,
        width_lerper = mk_lerper(0, width, .015, 0),
        height_lerper = mk_lerper(0, height, .015, 0)
    }

    function magic_circle:draw()
        local origin_x = x-self.width_lerper:val()/2
        local origin_y = y-self.height_lerper:val()/2
        local end_x = x+self.width_lerper:val()/2
        local end_y = y+self.height_lerper:val()/2

        oval(
            origin_x,
            origin_y,
            end_x,
            end_y,
            self.color
        )
    end

    function magic_circle:update()
        self.width_lerper:update()
        self.height_lerper:update()
    end

    return magic_circle
end