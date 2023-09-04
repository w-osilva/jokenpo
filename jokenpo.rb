# frozen_string_literal: true

require './models/game'
require './models/player'

player_1 = Player.new(name: 'Player 1')
player_2 = Player.new(name: 'Player 2')

game = Game.new(player_1, player_2)
game.play
