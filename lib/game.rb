

require_relative 'display'

# The game class
class Game
  include Display
  def initialize
    puts display_intro
    @secret_code = generate_secret_code
    @move = 0
    @max_moves = 2
  end
  COLORS = %i[red blue green yellow orange purple].freeze

  def run
    loop do
      @move += 1
      puts display_move_number(@move)
      player_guess = guess_from_player
      break if end?(player_guess)

      feedback(player_guess)
    end
  end

  def end?(guess)
    if guess == @secret_code
      puts display_winning_message
      true
    elsif @move >= @max_moves
      puts display_game_over
      puts display_secret_code(@secret_code)
      true
    else
      false
    end
  end

  def feedback(guess)
    secret_code_copy = @secret_code.dup
    guess_copy = guess.dup

    # Check for exact matches
    exact_matches = guess_copy.each_with_index.count { |color, index| color == secret_code_copy[index] }
    # Check for color matches
    color_matches = guess_copy.each_with_index.count { |color, index| color && secret_code_copy.include?(color) && !(color == secret_code_copy[index]) }

    puts display_feedback(exact_matches, color_matches)
  end

  def generate_secret_code
    #c1 = COLORS.sample(1)
   # c2 = COLORS.sample(1)
    #c3 = COLORS.sample(1)
   # c4 = COLORS.sample(1)    
    #[c1,c2,c3,c4]
    %i[red blue red red]
  end

  def guess_from_player
    puts display_guess_helper_message
    loop do
      guesses = gets.chomp.downcase.split(' ').map(&:to_sym)
      return guesses if valid_input?(guesses)

      puts display_input_warning
    end
  end

  def valid_input?(guesses)
    guesses.length == 4 && guesses.all? { |guess| COLORS.include?(guess) }
  end
end
