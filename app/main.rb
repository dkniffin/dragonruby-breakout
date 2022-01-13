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

class Game < Ticker
  def tick(args)
    super

    state.objects ||= {}
    state.objects.bat ||= Bat.new

    state.objects.bat.tick(args)
  end
end

$game = Game.new

def tick(args)
  $game.tick(args)
end
