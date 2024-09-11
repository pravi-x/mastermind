# frozen_string_literal: true

require_relative 'display'

class Game
  include Display
  def initialize
    puts display_intro
    @secret_code = generate_secret_code
    @move = 0
    @max_moves = 12
  end
  COLORS = %i[red blue green yellow orange purple].freeze

  def run
    loop do
      @move += 1
      puts display_move_number(@move)
      player_guess = guess_from_player

      if player_guess == @secret_code
        puts display_winning_message
        break
      elsif @move >= @max_moves
        puts display_game_over(@secret_code)
        break
      end

      exact_matches, color_matches = feedback(player_guess)
      puts display_feedback(exact_matches, color_matches)
    end
  end

  def generate_secret_code
    COLORS.sample(4)
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

  def feedback(guess)
    secret_code_copy = @secret_code.dup
    guess_copy = guess.dup

    # Check for exact matches
    exact_matches = guess_copy.each_with_index.count { |color, index| color == secret_code_copy[index] }
    # Check for color matches
    color_matches = guess_copy.count { |color| color && secret_code_copy.include?(color) }

    [exact_matches, color_matches]
  end
end
