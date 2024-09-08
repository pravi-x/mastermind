require_relative 'display.rb'

class Game
  include Display
  def initialize
    @secret_code = generate_secret_code
  end

  
  def run
    # input guess from user
    #player_guess = get_player_guess() 
    # feedback
    
  end
  
  COLORS = [:red, :blue, :green, :yellow, :orange, :purple].freeze
  def generate_secret_code
    result = COLORS.sample(4)
    puts result
    return result
  end

  def get_player_guess
    puts display_guess_helper_message
    loop do
      guesses = gets.chomp.split(" ").map(&:to_sym)
      return guesses if valid_input?(guesses)
      
      puts display_input_warning
    end
  end

  def valid_input?(guesses)
    guesses.length == 4 && guesses.all? { |guess| COLORS.include?(guess) }
  end

end
