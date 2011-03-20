class Player
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "media/player1_icon.png", true)
    @x = 150
    @y = 350
  end
  
  def draw()
    @icon.draw(@x,@y, 1)
  end
  
  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end

  def move_right
    if @x > (@game_window.width - @icon.width)
      @x = @game_window.width - @icon.width
    else
      @x = @x + 10
    end
  end

  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end

  def move_down
    if @y > (@game_window.height - @icon.width)
      @y = @game_window.height - @icon.width
    else
      @y = @y + 10
    end
  end

  def hit_by?(balls)
    balls.any? {|ball| Gosu::distance(@x, @y, ball.x, ball.y) < 15}
  end

end
