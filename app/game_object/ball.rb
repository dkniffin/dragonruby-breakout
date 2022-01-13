DEGREES_TO_RADIANS = Math::PI / 180

class GameObject::Ball < GameObject::Base
  attr_accessor :x, :y, :angle

  SPEED = 5
  WIDTH = 50

  def defaults
    self.x = 615
    self.y = 200
    self.angle = 210 # degrees
  end

  def update
    move_for_velocity
    bounce

    # defaults
  end

  def render
    outputs.sprites << [self.x, self.y, WIDTH, WIDTH, "app/assets/breakout/Balls/ball_silver.png"]
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
      # TODO: loss if bottom
    end
  end

  def handle_bounce_calculation(surface_orientation)
    if surface_orientation == "vertical"
      self.angle = 180 - self.angle
    elsif surface_orientation == "horizontal"
      self.angle = 0 - self.angle
    end
  end

  def left
    x
  end

  def right
    x + WIDTH
  end

  def bottom
    y
  end

  def top
    y + WIDTH
  end
end
