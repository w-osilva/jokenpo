# frozen_string_literal: true

class Player
  attr_accessor :name, :input

  def initialize(name:)
    @name = name
  end

  def request_input(text='digite uma opção')
    print "#{@name}, #{text}: "
    @input = gets.strip.capitalize

    until input_valid?
      request_input(text='digite uma opção válida')
    end
  end

  def input_valid?
    Game::OPTIONS.values.include?(@input)
  end
end
