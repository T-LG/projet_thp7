require 'pry'
require 'rspec'
require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'tableau_de_bord'
require 'player'

#Début du jeu

while true

    x1 = BoardCase.new("x1")
    x2 = BoardCase.new("x2")
    x3 = BoardCase.new("x3")
    y1 = BoardCase.new("y1")
    y2 = BoardCase.new("y2")
    y3 = BoardCase.new("y3")
    z1 = BoardCase.new("z1")
    z2 = BoardCase.new("z2")
    z3 = BoardCase.new("z3")

    symbol = ["X", "O"]

    print "="*15 + " MORPION " 
    puts "="*15
    
    puts "Player 1, entrez votre pseudo"
    pseudo_1 = gets.chomp

    puts "Player 2, entrez votre pseudo"
    pseudo_2 = gets.chomp

    puts "#{pseudo_1}, choisissez votre symbole (X ou O)"
    symbol_1 = gets.chomp.capitalize

    while not ["X", "O"].include?(symbol_1)
        puts "Vous devez choisir un symbole entre X et O uniquement !"
        symbol_1 = gets.chomp.capitalize
    end

    symbol.delete(symbol_1)
    symbol_2 = symbol[0]
        
    player_1 = Player.new(pseudo_1, symbol_1)
    player_2 = Player.new(pseudo_2, symbol_2)

    i = 0
    while true
        BoardCase.play_turn(player_1)
        break if player_1.victory == true
        i += 1
        break if i == 9

        BoardCase.play_turn(player_2)
        break if player_2.victory == true
        i += 1
    end

    if player_1.victory == false && player_2.victory == false
        puts
        puts "Match nul"
        puts
        BoardCase.show_board
        puts
    end

    new_game = ""
    while new_game != "oui"
        puts "Voulez-vous refaire une partie ? (oui/non)"
        print "> "
        new_game = gets.chomp

        break if new_game == "non" || new_game == "oui"
        puts "Veuillez saisir oui ou non"
        puts
    end

    break if new_game == "non"
    BoardCase.reinit
    puts
end