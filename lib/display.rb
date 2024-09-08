module Display
    def display_intro
      ">> Welcome to the mastermind game <<"
    end

    def display_guess_helper_message
      ">> Make a guess! Write the 4 colors that you think will break the code\n
       >> Acceptable colors are red, blue, green, yellow, orange and purple"
    end

    def display_input_warning
      ">> I didn't understand your guess. Try again <<" 
    end
end