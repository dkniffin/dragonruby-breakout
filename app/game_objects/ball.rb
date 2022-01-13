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
