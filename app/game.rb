class Game
  def tick(args)
    if (args.state.tick_count == 0)
      setup(args)
    end

    if (args.inputs.keyboard.escape)
      $gtk.reset
    end

    args.state.objects.values.flatten.compact.each { |object| object.tick(args) }
  end

  def setup(args)
    args.state.objects = {
      paddle: GameObject::Paddle.new,
      bricks: [
        [GameObject::Brick.new(0, 0), GameObject::Brick.new(1, 0), GameObject::Brick.new(2, 0), GameObject::Brick.new(3, 0), GameObject::Brick.new(4, 0), GameObject::Brick.new(5, 0), GameObject::Brick.new(6, 0), GameObject::Brick.new(7, 0), GameObject::Brick.new(8, 0), GameObject::Brick.new(9, 0)],
        [GameObject::Brick.new(0, 1), GameObject::Brick.new(1, 1), GameObject::Brick.new(2, 1), GameObject::Brick.new(3, 1), GameObject::Brick.new(4, 1), GameObject::Brick.new(5, 1), GameObject::Brick.new(6, 1), GameObject::Brick.new(7, 1), GameObject::Brick.new(8, 1), GameObject::Brick.new(9, 1)],
        [GameObject::Brick.new(0, 2), GameObject::Brick.new(1, 2), GameObject::Brick.new(2, 2), GameObject::Brick.new(3, 2), GameObject::Brick.new(4, 2), GameObject::Brick.new(5, 2), GameObject::Brick.new(6, 2), GameObject::Brick.new(7, 2), GameObject::Brick.new(8, 2), GameObject::Brick.new(9, 2)],
        [GameObject::Brick.new(0, 3), GameObject::Brick.new(1, 3), GameObject::Brick.new(2, 3), GameObject::Brick.new(3, 3), GameObject::Brick.new(4, 3), GameObject::Brick.new(5, 3), GameObject::Brick.new(6, 3), GameObject::Brick.new(7, 3), GameObject::Brick.new(8, 3), GameObject::Brick.new(9, 3)]
      ],
      ball: GameObject::Ball.new
    }
  end
end
