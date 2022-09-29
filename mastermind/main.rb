require_relative 'game'

def game_info
  puts "
  ============================================= MASTERMIND ===================================================

  Mastermind is a code-breaking game, where a player can either choose to be the codemaker or the codebreaker.
  The codemaker's role is to pick a set of 4 numbers that the codebreaker needs to guess,
  and provide feedback based on the provided guesses.
  The codebreaker's role is to guess the secret combination before reaching the maximum attempts per match.

  =============================================== RULES ======================================================

  The maximum number of attempts are 12 per match.

  There are three types of feedbacks that can be encountered per single guess in the combination.
  Match - means that there is a match and it's in the correct position.
  Partial - means that the guessed number exists but it's not in the correct position.
  *none - means that there is no match and the guessed number doesnt exist in the secret code.

  Example:
    Secret code = 5, 4, 3, 1. *this will be hidden in the actual game.
    Guess code  = 5, 4, 1, 6.

    Match: 2 Partial: 1
      - Match having 2 values becuase 5 and 4 in the guess combination matches with the secret code's number and
        position. While Partial having 1 value becuase the number 1 in the guess combination exists in the secret
        code albeit in a different position.
      - Accumulating 4 matches before the end of the 12th round will result in a win.

  The codemaker can only choose a combination of 4 numbers from 1-6.

  Goodluck Player!

  ============================================================================================================
  "
end

game_info
Game.new.start
