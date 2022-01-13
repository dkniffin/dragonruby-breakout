class GameObject::Bat < GameObject::Base
  attr_accessor :x, :y

  SPEED = 5

  def defaults
    self.x = 576
    self.y = 10
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
    outputs.sprites << [x, y, 128, 101, 'app/assets/breakout/Bats/bat_black.png']
  end
end
