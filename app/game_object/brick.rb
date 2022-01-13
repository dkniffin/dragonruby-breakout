class GameObject::Brick < GameObject::Base
  attr_accessor :brick_state, :brick_x, :brick_y, :asset

  BRICK_GRID_LEFT = 100
  BRICK_GRID_BOTTOM = 500
  BRICK_SPACING_X = 10
  BRICK_SPACING_Y = 10

  COLORS = ["blue", "green", "violet", "yellow"]

  def initialize(brick_x, brick_y)
    self.brick_x = brick_x
    self.brick_y = brick_y
  end

  def defaults
    self.w = 100
    self.h = 30
    self.x = BRICK_GRID_LEFT + (brick_x * self.w) + (brick_x * BRICK_SPACING_X)
    self.y = BRICK_GRID_BOTTOM + (brick_y * self.h) + (brick_y * BRICK_SPACING_Y)
    self.brick_state = "pristine"
  end

  def render
    outputs.sprites << [
      self.x,
      self.y,
      self.w,
      self.h,
      asset
    ]
  end

  def asset
    color = COLORS[brick_y]

    if self.brick_state == "pristine"
      "app/assets/breakout/Bricks/brick_#{color}_small_cropped.png"
    elsif self.brick_state == "cracked"
      "app/assets/breakout/Bricks/brick_#{color}_small_cracked_cropped.png"
    end
  end

  def hit
    if self.brick_state == "pristine"
      self.brick_state = "cracked"
    elsif self.brick_state == "cracked"
      # destroy this brick
      state.objects.bricks[self.brick_y][self.brick_x] = nil
    end
  end
end
