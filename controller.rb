class GameController
  attr_reader :deck

  def initialize(deck)
    @deck = Deck.new(deck)
    run
  end

  def run
    View.display(welcome)
    input = View.user_input
    start_game(input)
  end

  def welcome
    "Welcome to Ruby Cards!\n  1. Press any key to start the game.\n  2. Once the game has started, type 'exit' exit the game or 'pass' to skip a card."
  end

  def start_game(input)
    loop do
      card = deck.get_card
      View.display(card.definition)
      input = View.user_input

      until check?(input, card.term) || exit?(input) || pass?(input)
        View.display("Incorrect. Try again")
        View.display(card.definition)
        input = View.user_input
      end

      break if exit?(input)

      if pass?(input)
        View.display("The correct term was #{card.term}.")
        sleep(0.3)
        next
      end

      View.display("Nice job!")
    end
  end

  def check?(input, term)
    input == term
  end

  def pass?(input)
    input == 'pass'
  end

  def exit?(input)
    input == "exit"
  end
end
