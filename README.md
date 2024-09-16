# Mastermind Game

This is a Ruby implementation of the classic Mastermind game. The game offers two modes: a classic mode where the player tries to guess the secret code, and a reversed mode where the computer tries to guess the player's secret code.

## Features

- Classic Mastermind gameplay
- Reversed mode where the computer guesses
- Colorful console output #TODO
- Input validation

## Requirements

- Ruby (version 2.0 or higher recommended)

## How to Play

1. Clone this repository or download the source files.
2. Navigate to the game directory in your terminal.
3. Run the game with the command:

   ```
   ruby mastermind.rb
   ```

4. Choose game mode:
   - Enter '1' for Classic mode
   - Enter '2' for Reversed mode

5. Follow the on-screen instructions to play the game.

### Classic Mode

In Classic mode, you'll try to guess the secret code. The code consists of four colors chosen from: red, blue, green, yellow, orange, and purple. After each guess, you'll receive feedback on how many colors are correct and in the right position, and how many colors are correct but in the wrong position.

### Reversed Mode

In Reversed mode, you'll create the secret code, and the computer will try to guess it. The computer will make random guesses, and you'll need to provide feedback after each guess.

## Game Rules

- The secret code consists of 4 colors.
- Available colors are: red, blue, green, yellow, orange, purple.
- You have 12 attempts to guess the correct code.
- After each guess, feedback is provided:
  - Number of colors in the correct position
  - Number of correct colors in the wrong position

## Files

- `main.rb`: Main game file
- `game.rb`: Game logic
- `display.rb`: Display methods for console output

## Contributing

Feel free to fork this project and submit pull requests with improvements or bug fixes.

## License

This project is open source and available under the [MIT License](LICENSE).