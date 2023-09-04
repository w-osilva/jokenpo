# frozen_string_literal: true

class Game
  OPTIONS = {
    1 => 'Pedra',
    2 => 'Papel',
    3 => 'Tesoura'
  }.freeze

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play
    print_intro

    @player_1.request_input

    @player_2.request_input

    print_preview

    compare_inputs

    print_result
  end

  private

  def print_intro
    puts <<~TEXT

    JOKEMPO!!!

    ------------------------------------------------------------------------
    Instruções: 
    Para jogar, basta digitar uma das opções [ #{OPTIONS.values.join(' | ')} ]. 
    ------------------------------------------------------------------------

    TEXT
  end

  def compare_inputs
    @result = (OPTIONS.key(@player_1.input) - OPTIONS.key(@player_2.input)) % 3
  end

  def print_preview
    puts <<~TEXT

    [#{ @player_1.name }] #{ @player_1.input }  (VS)  #{ @player_2.input } [#{ @player_2.name }]

    TEXT
  end

  def print_result
    puts case @result
           when 1 then "#{ @player_1.name } Ganhou!!!"
           when 2 then "#{ @player_2.name } Ganhou!!!"
           else "Deu empate!"
         end
  end
end