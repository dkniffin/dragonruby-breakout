class Game
  def tick(args)
    args.state.objects ||= {}
    args.state.objects.bat ||= GameObject::Bat.new
    args.state.objects.bricks ||= [
      [GameObject::Brick.new(0, 3), GameObject::Brick.new(1, 3), GameObject::Brick.new(2, 3), GameObject::Brick.new(3, 3), GameObject::Brick.new(4, 3), GameObject::Brick.new(5, 3), GameObject::Brick.new(6, 3), GameObject::Brick.new(7, 3), GameObject::Brick.new(8, 3), GameObject::Brick.new(9, 3)],
      [GameObject::Brick.new(0, 2), GameObject::Brick.new(1, 2), GameObject::Brick.new(2, 2), GameObject::Brick.new(3, 2), GameObject::Brick.new(4, 2), GameObject::Brick.new(5, 2), GameObject::Brick.new(6, 2), GameObject::Brick.new(7, 2), GameObject::Brick.new(8, 2), GameObject::Brick.new(9, 2)],
      [GameObject::Brick.new(0, 1), GameObject::Brick.new(1, 1), GameObject::Brick.new(2, 1), GameObject::Brick.new(3, 1), GameObject::Brick.new(4, 1), GameObject::Brick.new(5, 1), GameObject::Brick.new(6, 1), GameObject::Brick.new(7, 1), GameObject::Brick.new(8, 1), GameObject::Brick.new(9, 1)],
      [GameObject::Brick.new(0, 0), GameObject::Brick.new(1, 0), GameObject::Brick.new(2, 0), GameObject::Brick.new(3, 0), GameObject::Brick.new(4, 0), GameObject::Brick.new(5, 0), GameObject::Brick.new(6, 0), GameObject::Brick.new(7, 0), GameObject::Brick.new(8, 0), GameObject::Brick.new(9, 0)]
    ]
    args.state.objects.ball ||= GameObject::Ball.new

    args.state.objects.bat.tick(args)

    args.state.objects.bricks.each do |arr|
      arr.each do |brick|
        brick.tick(args)
      end
    end

    args.state.objects.ball.tick(args)
  end
end
