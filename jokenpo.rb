OPTIONS = {
    1 => 'Pedra',
    2 => 'Papel',
    3 => 'Tesoura'
}.freeze

player_1 = { 
    name: 'Player 1',
    input: nil 
}

player_2 = { 
    name: 'Player 2',
    input: nil 
}

def intro
    <<~HEREDOC
    
    Jokempo!!!
    
    ------------------------------------------------------------------------
    Instruções: 
    Para jogar, basta digitar uma das opções [ #{OPTIONS.values.join(' | ')} ]. 
    ------------------------------------------------------------------------
    
    HEREDOC
end

def player_input(player, text='digite uma opção')
    print "#{player[:name]}, #{text}: "
    player[:input] = (gets.strip).capitalize
end

def input_valid?(player)
    OPTIONS.values.include?(player[:input])
end

def game_preview(player_1, player_2)
    <<~HEREDOC

    [#{player_1[:name]}] #{player_1[:input]}  (VS)  #{player_2[:input]} [#{player_2[:name]}]

    HEREDOC
end

def game(player_1, player_2)
    result = ( OPTIONS.key(player_1[:input]) - OPTIONS.key(player_2[:input]) ) % 3
    case result 
        when 1 then "#{player_1[:name]} Ganhou!!!"
        when 2 then "#{player_2[:name]} Ganhou!!!"
        else "Deu empate!"
    end
end


# The game
# ------------------------------------------------------------------------
puts intro

player_input(player_1)
while !input_valid?(player_1) do
    player_input(player_1, 'digite uma opção válida')
end

player_input(player_2)
while !input_valid?(player_2) do
    player_input(player_2, 'digite uma opção válida')
end

puts game_preview(player_1, player_2)

puts game(player_1, player_2)