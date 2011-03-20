require 'rubygems'
require 'gosu'
require './player'
require './ball'

class Game < Gosu::Window
  def initialize
    super(600, 500, false)
    @player1 = Player.new(self)
    @balls = 4.times.map {Ball.new(self)}
    @song = Gosu::Song.new(self, 'media/varsenal_02.mp3')
    @song.volume = 0.5
    @running = true
  end
  
  def update
    
    if @running 
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end
    
      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end
    
      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end
    
      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
    
      @balls.each {|ball| ball.update}
    
      if @player1.hit_by? @balls
        stop_game!
      end
    else
      #game is stopped
      if button_down? Gosu::Button::KbEscape
        start_game
      end
    end
  end
  
  def draw
    @player1.draw
    @balls.each {|ball| ball.draw}
    @song.play unless @song.playing?
  end
  
  def stop_game!
    @running = false
  end
  
  def start_game
    @running = true
    @balls.each {|ball| ball.reset!}
  end
  
end

window = Game.new
window.show