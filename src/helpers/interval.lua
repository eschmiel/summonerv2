function create_one_second_interval(callback)
    local interval = {
        timer = 0,
        callback=callback
    }

    function interval:update()
        if(self.timer % ticksPerSecond == 0) then 
            self.callback()
        end
        self.timer += 1
    end
    
    return interval
end


ticksPerSecond = 30