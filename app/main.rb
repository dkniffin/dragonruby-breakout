class Ticker
  attr_accessor :grid, :inputs, :state, :outputs

  def tick(args)
    self.grid = args.grid
    self.inputs = args.inputs
    self.state = args.state
    self.outputs = args.outputs
  end
end

class Bat < Ticker
  attr_accessor :x, :y

  SPEED = 5

  def tick(args)
    super

    self.x ||= 576
    self.y ||= 10

    if inputs.left
      self.x = self.x - SPEED
    end

    if inputs.right
      self.x = self.x + SPEED
    end

    args.outputs.sprites << [self.x, self.y, 128, 101, 'app/assets/breakout/Bats/bat_black.png']
  end
end

class Brick < Ticker
  attr_accessor :state, :x, :y, :asset

  BRICK_GRID_LEFT = 100
  BRICK_GRID_BOTTOM = 500
  BRICK_WIDTH = 100
  BRICK_HEIGHT = 30
  BRICK_SPACING_X = 10
  BRICK_SPACING_Y = 10

  COLORS = ["blue", "green", "violet", "yellow"]

  def initialize(brick_x, brick_y)
    self.x = BRICK_GRID_LEFT + (brick_x * BRICK_WIDTH) + (brick_x * BRICK_SPACING_X)
    self.y = BRICK_GRID_BOTTOM + (brick_y * BRICK_HEIGHT) + (brick_y * BRICK_SPACING_Y)
    self.state = "unbroken"
    color = COLORS[brick_y]
    self.asset = "app/assets/breakout/Bricks/brick_#{color}_small_cropped.png"
  end

  def tick(args)
    args.outputs.sprites << [
      self.x,
      self.y,
      BRICK_WIDTH,
      BRICK_HEIGHT,
      self.asset
    ]
  end
end

class Ball < Ticker
  attr_accessor :x, :y

  def tick(args)
    self.x ||= 615
    self.y ||= 200

    args.outputs.sprites << [
      self.x,
      self.y,
      50,
      50,
      "app/assets/breakout/Balls/ball_silver.png"
    ]
  end
end

class Game < Ticker
  def tick(args)
    super

    state.objects ||= {}
    state.objects.bat ||= Bat.new
    state.objects.bricks ||= [
      [Brick.new(0, 3), Brick.new(1, 3), Brick.new(2, 3), Brick.new(3, 3), Brick.new(4, 3), Brick.new(5, 3), Brick.new(6, 3), Brick.new(7, 3), Brick.new(8, 3), Brick.new(9, 3)],
      [Brick.new(0, 2), Brick.new(1, 2), Brick.new(2, 2), Brick.new(3, 2), Brick.new(4, 2), Brick.new(5, 2), Brick.new(6, 2), Brick.new(7, 2), Brick.new(8, 2), Brick.new(9, 2)],
      [Brick.new(0, 1), Brick.new(1, 1), Brick.new(2, 1), Brick.new(3, 1), Brick.new(4, 1), Brick.new(5, 1), Brick.new(6, 1), Brick.new(7, 1), Brick.new(8, 1), Brick.new(9, 1)],
      [Brick.new(0, 0), Brick.new(1, 0), Brick.new(2, 0), Brick.new(3, 0), Brick.new(4, 0), Brick.new(5, 0), Brick.new(6, 0), Brick.new(7, 0), Brick.new(8, 0), Brick.new(9, 0)]
    ]
    state.objects.ball ||= Ball.new

    state.objects.bat.tick(args)

    state.objects.bricks.each do |arr|
      arr.each do |brick|
        brick.tick(args)
      end
    end

    state.objects.ball.tick(args)
  end
end

$game = Game.new

def tick(args)
  $game.tick(args)
end
