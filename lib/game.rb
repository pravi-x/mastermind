require_relative 'display.rb'

class Game
  include Display
  def initialize
    puts display_intro
    @secret_code = generate_secret_code()
    @move = 0
    @last_move = 3
  end

  def run
    loop do
      @move += 1
      puts display_move_number(@move)
      player_guess = get_player_guess()
      
      if player_guess == @secret_code
        puts display_winning_message
        break
      end
      
      if @move >= @last_move
        puts display_game_over(@secret_code)
        break
      end
      
      puts feedback(player_guess)
    end
  end
  
  COLORS = [:red, :blue, :green, :yellow, :orange, :purple].freeze
  # Generates a secret code for the game.
  #
  # This method randomly selects four colors from the available COLORS and returns them as the secret code.
  #
  # @return [Array] The secret code, represented as an array of four colors.
  def generate_secret_code
    result = COLORS.sample(4)
    return result
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

    ">> Feedback: you have #{exact_matches} exact matches and #{color_matches} color matches"
  end

end
