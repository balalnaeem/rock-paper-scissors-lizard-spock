VALID_CHOICES = %w(r p s l k)

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  (first == 'r' && second == 's') ||
    (first == 'p' && second == 'r') ||
    (first == 's' && second == 'p') ||
    (first == 'r' && second == 'l') ||
    (first == 'l' && second == 'k') ||
    (first == 'k' && second == 's') ||
    (first == 's' && second == 'l') ||
    (first == 'l' && second == 'p') ||
    (first == 'p' && second == 'k') ||
    (first == 'k' && second == 'r')
end

def display_choice_user(user)
  if user == 'r'
    'rock'
  elsif user == 'p'
    'paper'
  elsif user == 's'
    'scissors'
  elsif user == 'l'
    'lizard'
  elsif user == 'k'
    'spock'
  end
end

def display_choice_comp(comp)
  if comp == 'r'
    'rock'
  elsif comp == 'p'
    'paper'
  elsif comp == 's'
    'scissors'
  elsif comp == 'l'
    'lizard'
  elsif comp == 'k'
    'spock'
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a draw.")
  end
end

loop do
  user_score = 0
  computer_score = 0

  loop do
    user_choice = ''

    loop do
      prompt("Choose one out of #{VALID_CHOICES.join(', ')}")
      prompt(" 1) r for rock
      2) p for paper
      3) s for scissors
      4) l for lizard
      5) k for spock")
      user_choice = gets.chomp

      if VALID_CHOICES.include?(user_choice)
        break
      else
        prompt("That's not a valid choice. Try again.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    puts "You chose #{display_choice_user(user_choice)}."
    puts "And computer chose #{display_choice_comp(computer_choice)}."

    display_results(user_choice, computer_choice)

    if win?(user_choice, computer_choice)
      user_score += 1
    elsif win?(computer_choice, user_choice)
      computer_score += 1
    end

    if user_score >= 5
      break
    elsif computer_score >= 5
      break
    end
  end
  if user_score == 5
    puts "You won 5 times. You are the grand winner!"
  elsif computer_score == 5
    puts "Computer won 5 times. Computer is the grand winner."
  end

  puts "Would you like to play again? (y/n)"
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end
puts "-------------"

prompt("Thank you for playing. Goodbye!")

promp("Just playing around with github.")
