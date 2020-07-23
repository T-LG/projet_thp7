class Player

    attr_accessor :pseudo, :symbol, :entree_du_joueur, :victory

  
    def initialize(pseudo,symbol)
      @pseudo = pseudo
      @symbol = symbol
      @entree_du_joueur = []
      @victory = false
    end

    def game_over
        wins = [["x1","x2","x3"],["y1","y2","y3"],["z1","z2","z3"],["x1","y1","z1"],["x2","y2","z2"],["x3","y3","z3"],["x1","y2","z3"],["z1","y2","x3"]]
    
        wins.each do |small_tableau|
            # vérifier que les choix du joueur correspondent à un tableau gagnant
            compteur = 0
            
            @entree_du_joueur.each do |boardcase|
                compteur += 1 if small_tableau.include? boardcase
            end

            if compteur == 3
                print "="*15 + " Bravo, #{@pseudo} a gagné ! " 
                puts "="*15
                puts
                BoardCase.show_board
                puts
                @victory = true
                break
            end
        end
    end    
end

# LISTE DE CHOIX DE JEUX
# choise_pseudo1=0

# position_game_play = ["x1","x2","x3","y1","y2","y3","z1","z2","z3"]

#     puts " joueur: #{player.pseudo} a ton tour de jouer "
#     puts " ou tu veux jouer ? #{position_game_play}"
#     print ">> "
#     result_position = gets.chomp
#     position_game_play.delete(result_position)
#     puts position_game_play # supprime de la liste des position restante 


