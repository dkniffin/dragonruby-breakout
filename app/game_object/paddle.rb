class GameObject::Paddle < GameObject::Base
  SPEED = 10

  def defaults
    self.x = 576
    self.y = 20
    self.w = 120
    self.h = 30
  end

  def input
    if inputs.left
      self.x = x - SPEED
    end

    if inputs.right
      self.x = x + SPEED
    end
  end

  def render
    outputs.sprites << [self.x, self.y, self.w, self.h, 'app/assets/breakout/Bats/bat_black_cropped.png']
  end
end
