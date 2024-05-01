function mk_ball(x, origin_y, distance)
	local sprite = 1
	local sprite_width = 8
	local sprite_height = 8
	local max_speed = .2
	
	local ball = {
		y=origin_y,
		speed=.2,
		accelerator=mk_lerper(
			-.015,
            .015,
            .05,
            1),
		canReverse=false
	}
		
	function ball:draw()
		spr(
			sprite,
			x,
			self.y,
			sprite_width,
			sprite_height
		)
	end
		
	function ball:update()
		self.accelerator:update()
		self:move()
		self:reverse_if_float_distance_reached()
	end

	function ball:move()
		self.speed+=self.accelerator:val()

		if(abs(self.speed) > max_speed) then 
			self.speed = getSign(self.speed) * max_speed
		end

		self.y+=self.speed
	end

	function ball:reverse_if_float_distance_reached()
		local distance_moved = abs(origin_y - self.y)

		if( distance_moved > distance and self.canReverse ) then
			self.accelerator.r*=-1
			self.canReverse=false
		-- The ball can stil be pass the distance boundary after a single update tick after reversing.
		-- We need to make sure the ball is within its acceptable bounds before allowing it to reverse again.
		elseif( distance_moved < distance ) then
			self.canReverse=true
		end
	end

	return ball
end