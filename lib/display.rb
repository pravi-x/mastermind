# frozen_string_literal: true

require 'colorize'

# The display module
module Display
  def display_game_intro
    <<~HEREDOC
      #{'>> Welcome to the Mastermind game <<'.colorize(:cyan)}
      #{'>> Choose the mode you want to play <<'.colorize(:cyan)}
      \t#{colorize_mode('[1] CLASIC', :cyan)}: Try to break the secret code. You have 12 tries. The clock is ticking.
      \t#{colorize_mode('[2] REVERTED', :light_green)}: You are the code maker. Watch as the computer tries to find your secrets.
    HEREDOC
  end

  def display_start_clasic
    <<~HEREDOC
      #{'>> Make a guess! Write the 4 colors that you think will break the code <<'.colorize(:cyan)}
      #{display_game_notes}
    HEREDOC
  end

  def display_start_reverted
    <<~HEREDOC
      #{'>> You are the secret keeper! Write the 4 colors of the code and let the computer try to break it <<'.colorize(:light_green)}
      #{display_game_notes}
    HEREDOC
  end

  def display_game_notes
    <<~HEREDOC
      #{'>> Keep in mind <<'.colorize(:cyan)}
      \t#{'>> 1. Acceptable colors are:'.colorize(:cyan)} #{display_available_colors}
      \t#{'>> 2. Separate the colors by [SPACE]'.colorize(:cyan)}
    HEREDOC
  end

  def display_input_warning
    '>> I didn\'t understand your code. Try again <<'.colorize(:red)
  end

  def display_answer_input_warning
    '>> Please enter 1 or 2 to play the game <<'.colorize(:cyan)
  end

  def display_guess
    '>>> GUESS: '.colorize(:cyan)
  end

  def display_code(code)
    code.map { |color| "  #{color}  ".colorize(color.to_sym).on_light_white }.join
  end

  def display_winning_message
    "\n\n#{'>> Congratulations! You\'ve guessed the secret code! <<'.colorize(:green)}"
  end

  def display_game_over
    "\n\n#{'>> Game over! You\'ve reached the maximum number of moves. <<'.colorize(:red)}\n"
  end

  def display_move_number(number)
    "\n#{'>>> MOVE '.colorize(:cyan)}#{number.to_s.colorize(:cyan)}#{'<<<'.colorize(:cyan)}"
  end

  def display_feedback(exact, color)
    ">> Feedback: #{'●'.colorize(:red) * exact}#{'○'.colorize(:white) * color}"
  end

  private

  def display_available_colors
    Game::COLORS.map { |color| color.to_s.colorize(color.to_sym) }.join(', ')
  end

  def colorize_mode(text, color)
    text.colorize(color).bold
  end
end
