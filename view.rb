class View
  def welcome
    puts "Welcome to Ruby Cards"
    puts "To play use the following directions:"
    puts "  1. Type \"exit\" to end the game"
    puts "  1. Press any key to start the game"
    puts "  3. Once you've started the game, type \"pass\" to skip a card"
  end

  def display(str)
    puts
    puts str
  end

  def user_input
    gets.chomp
  end

  def game_over
    puts "Thanks for playing!!"
  end
end
