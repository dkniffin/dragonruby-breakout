module GameObject; end

class GameObject::Base
  attr_gtk

  def tick(args)
    self.args = args

    if (args.state.tick_count == 0)
      defaults
    else
      input
      update
    end

    render
  end

  ## ========================================================================
  ## tick loop methods
  ## ========================================================================

  def defaults
    # To be overriden.
    # Initializes the state of the object
  end

  def input
    # To be overriden
    # Handles any updates to this object's state, due to current user input
  end

  def update
    # To be overriden
    # Handles any updates to this object's state, due to the game simulation moving forward one step
  end

  def render
    # To be overriden
    # Handles rendering this object, based on it's current state
  end

  ## ========================================================================
  ## spatial object methods
  ## ========================================================================

  attr_accessor :x, :y, :w, :h

  def left
    x
  end

  def right
    x + w
  end

  def bottom
    y
  end

  def top
    y + h
  end
end
