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
