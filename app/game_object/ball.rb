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

    defaults
  end

  def render
    outputs.sprites << [self.x, self.y, WIDTH, WIDTH, "app/assets/breakout/Balls/ball_silver.png"]
  end

  private

  def move_for_velocity
    x_offset = Math.cos(self.angle * DEGREES_TO_RADIANS) * SPEED
    y_offset = Math.sin(self.angle * DEGREES_TO_RADIANS) * SPEED

    self.x = self.x + x_offset
    self.y = self.y + y_offset
  end

  def bounce
    if right > grid.right
      self.angle = 180 - self.angle
    elsif top > grid.top
      self.angle = 180 + (90 - (self.angle - 90))
    elsif left < grid.left
      self.angle = 270 + (90 - (self.angle - 180))
    elsif bottom < grid.bottom
      self.angle = 360 + (90 - (self.angle - 270))
      # TODO: loss
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
