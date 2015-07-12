def get_number_to_guess
  difficulty_level = 0
  difficulty_range = 1..3
  max_possible_num = 0

  until difficulty_range.include?(difficulty_level)
    puts 'Please select a level of difficulty (1, 2, or 3):'
    difficulty_level = gets.chop.to_i
  end
  
  # A hash could make this easier:
  # levels = {1 => 10, 2 => 100, 3 => 1000}
  # levels[difficulty_level]
  
  case difficulty_level
    when 1 then
      max_possible_num = 10
    when 2 then
      max_possible_num = 100
    when 3 then
      max_possible_num = 1000
  end

  # good. An array can be shuffled too. 
  # Convert range to array, shuffle, grab first item.
  # (1..max_possible_num).to_a.shuffle.first

  random_num = Random.new
  random_num.rand(1..max_possible_num)
  
end

def show_results(guesses, number_to_guess)
  result_phrase = if guesses == 1
                    "You're a mind reader!"
                  elsif guesses >= 2 && guesses <= 3
                    'Most impressive!'
                  elsif guesses >= 4 && guesses <= 6
                    'You can do better than that.'
                  else
                    'Getter luck next time.'
                  end
  # I don't think i'm comfortable with this function printing out
  # values. I think it should return a string.
  puts "That's right! The number is #{number_to_guess}"
  puts "You got it in #{guesses} guesses! " + result_phrase
  
  # I think this question should be part of the main program.
  # Remember that since you have a puts as the last executed
  # statement, this function does return nil, as `puts` returns
  # nil. I'd move this question into main.
  puts 'Play again? (y/n)'
end

def main
  play_again = 'y'
  while play_again == 'y'
    guesses = 1
    puts "Let's play Guess the Number"
    number_to_guess = get_number_to_guess
    puts "I have my number. What's your guess? "
    player_guess = gets.chop.to_i

    until player_guess == number_to_guess
      if player_guess <= 0
        puts 'Please enter only positive numbers. Try again.'
      elsif player_guess > number_to_guess
        puts 'Too high. Guess again: '
      else
        puts 'Too low. Guess again: '
      end

      player_guess = gets.chop.to_i
      guesses += 1
    end

    show_results(guesses, number_to_guess)
    play_again = gets.chop
  end
end

main
