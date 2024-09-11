require_relative 'display.rb'

class Game
  include Display
  def initialize
    puts display_intro
    @secret_code = generate_secret_code()
    @move = 0
    @max_moves = 10
  end
  COLORS = [:red, :blue, :green, :yellow, :orange, :purple].freeze

  def run
    loop do
      @move += 1
      puts display_move_number(@move)
      player_guess = get_player_guess()
      
      if player_guess == @secret_code
        puts display_winning_message;break
      elsif @move >= @max_moves
        puts display_game_over(@secret_code);break
      end
      
      puts display_feedback(feedback(player_guess))
    end
  end
  
  def generate_secret_code
    COLORS.sample(4)
  end

  def get_player_guess
    puts display_guess_helper_message
    loop do
      guesses = gets.chomp.downcase.split(" ").map(&:to_sym)
      return guesses if valid_input?(guesses)      
      puts display_input_warning
    end
  end

  def valid_input?(guesses)
    guesses.length == 4 && guesses.all? { |guess| COLORS.include?(guess) }
  end

  def feedback(guess)
    exact_matches = 0
    color_matches = 0

    secret_code_copy = @secret_code.dup
    guess_copy = guess.dup

    # Check for exact matches
    exact_matches = guess_copy.each_with_index.count { |color, index| color == secret_code_copy[index] }
    # Check for color matches
    color_matches = guess_copy.count { |color| color && secret_code_copy.include?(color) }

    return exact_matches,color_matches
  end
end
