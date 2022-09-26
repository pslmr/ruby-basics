def game_info
  puts "
  Mastermind is a code-breaking game, where a player can either choose to be the codemaker or the codebreaker.
  The codemaker's role is to pick a set of 4 numbers that the codebreaker needs to guess, and provide feedback based on the provided guess.
  The codebreaker's role is to guess the secret combination before reaching the maximum attempts per match.

  The maximum number of attempts are 12 per match.
  There are three types of feedbacks that can be encountered per single guess in the combination.
  M - means that there is a match and in the correct position.
  P - means that there is a match but not in the correct position.
  *none - means that there is no match.

  The codemaker can only choose a combination of 4 numbers from 1-6.
  Goodluck!
  "
end

game_info
