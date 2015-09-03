require 'securerandom'

class Player

  attr_reader :guess
  attr_accessor :incorrect_guess_ary

  def initialize
    @incorrect_guess_ary = []
  end

  def check_dups
      if @incorrect_guess_ary.include?(@guess) == true
      puts "You have already used that number."
      else
      @incorrect_guess_ary << @guess
      end
  end

  def make_guess
    puts "The computer has chosen a number. What is your guess?"
    @guess = gets.chomp.to_i
  end
end

class Game

  attr_reader :securerandom
  attr_accessor :comp_pick

  def initialize
    @securerandom
  end

  def run_game

    def set_comp_pick(x)
      @comp_pick = x
    end

    player = Player.new
    set_comp_pick(SecureRandom.random_number(100))
    puts "#{@comp_pick}"
    player.make_guess
    # puts "#{player.incorrect_guess_ary}"


    until player.incorrect_guess_ary.length  > 4
      if player.guess == @comp_pick
        puts "You got it!"
        exit
      else player.make_guess
        player.check_dups
        puts "#{player.incorrect_guess_ary}"
          if player.guess > @comp_pick
            puts "Your guess is too high, try again"
          elsif
            player.guess < @comp_pick
            puts "Your guess is too low, try again"
          end
       end
      if player.incorrect_guess_ary.length == 5
      puts "You have reached the max # of guesses: #{player.incorrect_guess_ary}"
      exit
    end
    end
  end
end
Game.new.run_game
