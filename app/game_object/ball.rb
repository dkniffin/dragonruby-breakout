DEGREES_TO_RADIANS = Math::PI / 180

class GameObject::Ball < GameObject::Base
  attr_accessor :angle

  SPEED = 5

  def defaults
    self.x = 615
    self.y = 200
    self.w = 50
    self.h = 50

    self.angle = 23 # degrees
  end

  def update
    move_for_velocity
    bounce

    # defaults
  end

  def render
    outputs.sprites << [self.x, self.y, w, w, "app/assets/breakout/Balls/ball_silver_cropped.png"]
  end

  def move_for_velocity
    x_offset = Math.cos(self.angle * DEGREES_TO_RADIANS) * SPEED
    y_offset = Math.sin(self.angle * DEGREES_TO_RADIANS) * SPEED

    self.x = self.x + x_offset
    self.y = self.y + y_offset
  end

  def bounce
    if right > grid.right || left < grid.left
      handle_bounce_calculation("vertical")
    elsif top > grid.top || bottom < grid.bottom
      handle_bounce_calculation("horizontal")
      # TODO: game over if bottom
    else
      # Bricks
      state.objects.bricks.flatten.each do |brick|
        if bouncing_off?(brick)
          handle_bounce_calculation(bounce_surface_orientation(brick))
          return
        end
      end

      # Paddle
      if bouncing_off?(state.objects.paddle)
        handle_bounce_calculation(bounce_surface_orientation(state.objects.paddle))
        return
      end
    end
  end

  def handle_bounce_calculation(surface_orientation)
    if surface_orientation == "vertical"
      self.angle = 180 - self.angle
    elsif surface_orientation == "horizontal"
      self.angle = 0 - self.angle
    end
  end


  def bouncing_off?(object)
    geometry.intersect_rect?(self, object)
  end

  def bounce_surface_orientation(object)
    if (object.left - right).abs() < SPEED || (object.right - left).abs() < SPEED
      "vertical"
    elsif (object.top - bottom).abs() < SPEED || (object.bottom - top).abs() < SPEED
      "horizontal"
    end
  end
end
