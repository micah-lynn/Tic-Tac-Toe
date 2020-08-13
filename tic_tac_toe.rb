class Player
    attr_accessor :name, :player_sym
    @@one = " "
    @@two = " "
    @@three = " "
    @@four = " "
    @@five = " "
    @@six = " "
    @@seven = " "
    @@eight = " "
    @@nine = " "

    def initialize(name)
        @name = name
        @player_sym = "N"
    end

    def draw_grid
        puts " #{@@one} | #{@@two} | #{@@three} "
        puts "–––––––––––"
        puts " #{@@four} | #{@@five} | #{@@six} "
        puts "–––––––––––"
        puts " #{@@seven} | #{@@eight} | #{@@nine} "
    end

    def endgame
        (@@one == @@two && @@two == @@three && @@one != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@four == @@five && @@five == @@six && @@four != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@seven == @@eight && @@eight == @@nine && @@seven != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@one == @@four && @@four == @@seven && @@one != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@two == @@five && @@five == @@eight && @@two != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@three == @@six && @@six == @@nine && @@three != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@one == @@five && @@five == @@nine && @@one != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        (@@seven == @@five && @@five == @@three && @@seven != " ") ? (p "#{self.name.upcase} WINS!"; $gameon = true) : nil
        draw_grid if $gameon
    end

    def illegal
        puts "---------------"
        puts "!!!Cannot make that move!!!"
        puts "#{self.name} try again."
        puts "---------------"
        self.play_round
    end

    def play_round
        puts " "
        self.draw_grid
        puts " "
        print "#{self.name}'s move: "
        choice = gets.chomp.to_i
        case choice
        when 1 then @@one == " " ? @@one = self.player_sym : illegal
        when 2 then @@two == " " ? @@two = self.player_sym : illegal
        when 3 then @@three == " " ? @@three = self.player_sym : illegal
        when 4 then @@four == " " ? @@four = self.player_sym : illegal
        when 5 then @@five == " " ? @@five = self.player_sym : illegal
        when 6 then @@six == " " ? @@six = self.player_sym : illegal
        when 7 then @@seven == " " ? @@seven = self.player_sym : illegal
        when 8 then @@eight == " " ? @@eight = self.player_sym : illegal
        when 9 then @@nine == " " ? @@nine = self.player_sym : illegal
        else
            illegal
        end
        endgame
    end
end

class Player1 < Player

end

class Player2 < Player

end


# Initialize game
print 'Player 1: '
player1 = Player1.new(gets.chomp)
print 'Player 2: '
player2 = Player2.new(gets.chomp)

puts "---------------"
puts "Player 1 is #{player1.name}. Player 2 is #{player2.name}."

puts "---------------"
puts "Game Rules"
puts "Use numbers 1-9 to place moves on the board. Numbers are counted left to right and top to bottom."
puts "---------------"

# Parameters
player1.player_sym = "X"
player2.player_sym = "O"

$gameon = false

while true
    player1.play_round
    puts "---------------"
    break if $gameon
    player2.play_round
    puts "---------------"
    break if $gameon
end