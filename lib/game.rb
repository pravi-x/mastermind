require_relative 'display'

# The game class
class Game
  include Display
  def initialize
    puts display_game_intro
    @secret_code = nil
    @move = 0
    @max_moves = 12
  end
  COLORS = %i[red blue green yellow orange purple].freeze

  def main_menu
    case answer_from_terminal
    in '1'
      run_clasic_game
    in '2'
      run_reverted
    end
  end

  def answer_from_terminal
    loop do
      answer = gets.chomp
      return answer if %w[1 2].include?(answer)

      puts display_answer_input_warning
    end
  end

  def run_clasic_game
    puts display_start_clasic
    @secret_code = generate_secret_code
    loop do
      @move += 1
      player_guess = four_colors_from_terminal
      break if end?(player_guess)

      puts display_move_number(@move)
      feedback(player_guess)
    end
  end

  def end?(guess)
    if guess == @secret_code
      puts display_winning_message
      true
    elsif @move > @max_moves
      puts display_game_over
      puts display_code(@secret_code)
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
    color_matches = guess_copy.each_with_index.count do |color, index|
      color && secret_code_copy.include?(color) && color != secret_code_copy[index]
    end
    puts display_guess + display_code(guess)
    puts display_feedback(exact_matches, color_matches)
  end

  def generate_secret_code
    c1 = COLORS.sample(1)
    c2 = COLORS.sample(1)
    c3 = COLORS.sample(1)
    c4 = COLORS.sample(1)
    [c1, c2, c3, c4]
  end

  def four_colors_from_terminal
    loop do
      guesses = gets.chomp.downcase.split.map(&:to_sym)
      return guesses if valid_input?(guesses)

      puts display_input_warning
    end
  end

  def valid_input?(guesses)
    guesses.length == 4 && guesses.all? { |guess| COLORS.include?(guess) }
  end

  def run_reverted
    puts display_start_reverted
    @secret_code = four_colors_from_terminal # TODO: refactor    bundle install
    loop do
      @move += 1
      puts display_move_number(@move)
      sleep(1, 5)
      computer_guess = COLORS.sample(4)
      break if end?(computer_guess)

      feedback(computer_guess)
    end
  end
end
