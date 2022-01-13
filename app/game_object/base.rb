module GameObject; end

class GameObject::Base
  attr_accessor :grid, :inputs, :state, :outputs

  def tick(args)
    self.grid = args.grid
    self.inputs = args.inputs
    self.state = args.state
    self.outputs = args.outputs
  end
end
