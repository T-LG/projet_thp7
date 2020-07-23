
class BoardCase
  
    attr_accessor :value, :name #creation position nom du tableau
    @@hash_of_cases = {}
    @@positions_left = ["x1","x2","x3","y1","y2","y3","z1","z2","z3"]

    def self.reinit
        @@hash_of_cases = {}
        @@positions_left = ["x1","x2","x3","y1","y2","y3","z1","z2","z3"]
    end

    def initialize(name)
        @name = name
        @value = " "
        @@hash_of_cases[self.name] = self.value
    end

    def self.show_board
            puts'  _______________________________________'
            puts'  |      |    X    |    Y    |    Z    |'
            puts'  |______|_________|_________|_________|'
            puts'  |      |         |         |         |'
            puts"  |  1   |    #{@@hash_of_cases["x1"]}    |    #{@@hash_of_cases["y1"]}    |    #{@@hash_of_cases["z1"]}    |"
            puts'  |______|_________|_________|_________|'
            puts'  |      |         |         |         |'
            puts"  |  2   |    #{@@hash_of_cases["x2"]}    |    #{@@hash_of_cases["y2"]}    |    #{@@hash_of_cases["z2"]}    |"
            puts'  |______|_________|_________|_________|'
            puts'  |      |         |         |         |'
            puts"  |  3   |    #{@@hash_of_cases["x3"]}    |    #{@@hash_of_cases["y3"]}    |    #{@@hash_of_cases["z3"]}    |"
            puts'  |______|_________|_________|_________|'   
    end
  
    def self.play_turn(player)
        while true
            self.show_board
            puts

            puts " Joueur: #{player.pseudo} a ton tour de jouer "
            puts " où tu veux jouer ? #{@@positions_left}"
            print ">> "
            choice_player = gets.chomp
            @@positions_left.delete(choice_player) # supprime de la liste des position restante 
            
            player.entree_du_joueur << choice_player
                  
            # Vérifier si le joueur renseigne une valeur possible
            if !["x1", "x2", "x3", "y1", "y2", "y3", "z1", "z2", "z3"].include? choice_player
                puts "Veuillez saisir une option valide (appuyez sur entrée pour choisir à nouveau)" 
                gets

            # Vérifier si la case est vide
            elsif @@hash_of_cases[choice_player] != " "
                puts "Veuillez saisir une case non occupée (appuyez sur entrée pour choisir à nouveau)"
                gets
            else
                @@hash_of_cases[choice_player] = player.symbol
                break
            end
        end
        player.game_over
        
    end 
end