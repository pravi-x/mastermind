# frozen_string_literal: true

# The dispaly module
module Display
  def display_game_intro
    ">> Welcome to the mastermind game <<\n" \
      '>> Choose the mode you want to play <<' \
      "\n\t[1] CLASIC: Try to break the secret code. You have 12 tries. The clock is ticking." \
      "\n\t[2] REVERTED: You are the code maker. Watch as the computer tries to find your secrets."
  end

  def display_start_clasic
    ">> Make a guess! Write the 4 colors that you think will break the code <<\n#{display_game_notes}"
  end

  def display_start_reverted
    '>> You are the secret keeper! Write the 4 colors of the code nad let ' \
      "the computer try to break it<<\n#{display_game_notes}"
  end

  def display_game_notes
    '>> Keep in mind <<' \
      "\n\t>> 1. Acceptable colors are red, blue, green, yellow, orange and purple" \
      "\n\t>> 2. Separate the colors by [SPACE]"
  end

  def display_input_warning
    ">> I didn't understand your code. Try again <<"
  end

  def display_answer_input_warning
    '>> Please enter 1 or 2 to play the game <<'
  end

  def display_guess
    '>>> GUESS: '
  end

  def display_code(code)
    "| #{code[0]} | #{code[1]} | #{code[2]} | #{code[3]} | "
  end

  def display_wining_message
    "\n\n>> Congratulations! You've guessed the secret code! <<"
  end

  def display_game_over
    "\n\n>> Game over! You've reached the maximum number of moves. <<\n"
  end

  def display_move_number(number)
    "\n>>> MOVE #{number} <<<"
  end

  def display_feedback(exact_matches, color_matches)
    ">> Feedback: you have #{exact_matches} exact matches and #{color_matches} color matches"
  end
end
