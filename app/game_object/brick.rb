class GameObject::Brick < GameObject::Base
  attr_accessor :state, :brick_x, :brick_y, :x, :y, :asset

  BRICK_GRID_LEFT = 100
  BRICK_GRID_BOTTOM = 500
  BRICK_WIDTH = 100
  BRICK_HEIGHT = 30
  BRICK_SPACING_X = 10
  BRICK_SPACING_Y = 10

  COLORS = ["blue", "green", "violet", "yellow"]

  def initialize(brick_x, brick_y)
    self.brick_x = brick_x
    self.brick_y = brick_y
    defaults
  end

  def defaults
    self.x = BRICK_GRID_LEFT + (brick_x * BRICK_WIDTH) + (brick_x * BRICK_SPACING_X)
    self.y = BRICK_GRID_BOTTOM + (brick_y * BRICK_HEIGHT) + (brick_y * BRICK_SPACING_Y)
    self.state = "unbroken"
    color = COLORS[brick_y]
    self.asset = "app/assets/breakout/Bricks/brick_#{color}_small_cropped.png"
  end

  def render
    outputs.sprites << [
      self.x,
      self.y,
      BRICK_WIDTH,
      BRICK_HEIGHT,
      self.asset
    ]
  end
end
