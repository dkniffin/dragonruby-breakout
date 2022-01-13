class GameObject::Ball < GameObject::Base
  attr_accessor :x, :y

  def defaults
    self.x = 615
    self.y = 200
  end

  def render
    outputs.sprites << [self.x, self.y, 50, 50, "app/assets/breakout/Balls/ball_silver.png"]
  end
end
