module Display
    def display_intro
      ">> Welcome to the mastermind game <<\n" \
      
    end

    def display_guess_helper_message
      ">> Make a guess! Write the 4 colors that you think will break the code <<" \
      ">> Acceptable colors are red, blue, green, yellow, orange and purple <<"
    end

    def display_input_warning
      ">> I didn't understand your guess. Try again <<" 
    end

    def display_secret_code(code)
      ">>> SECRET CODE | #{code[0]} | #{code[1]} | #{code[2]} | #{code[3]} | <<<"
    end

    def display_wining_message
      "\n\n>> Congratulations! You've guessed the secret code! <<"
    end

    def display_game_over(code)
      "\n\n>> Game over! You've reached the maximum number of moves. <<\n" << display_secret_code(code)
    end

    def display_move_number(number)
      "\n>> MOVE #{number} <<"
    end

    def display_feedback(exact_matches,color_matches)
      ">> Feedback: you have #{exact_matches} exact matches and #{color_matches} color matches"
    end

end