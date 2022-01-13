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
