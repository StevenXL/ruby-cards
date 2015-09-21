class GameController
  attr_reader :deck

  def initialize(deck)
    @deck = Deck.new(deck)
    run
  end

  def run
    View.display(welcome)
    run_game
  end

  def welcome
    "Welcome to Ruby Cards!\n  1. Press any key to start the game.\n  2. Once the game has started, type 'exit' exit the game or 'pass' to skip a card."
  end

  def run_game(card = nil)
    card = deck.get_card if card.nil?
    View.display(card.definition)
    input = View.user_input

    parse_input(input, card)
  end

  def parse_input(input, card)
    case input
    when "exit"
      exit_game
    when "pass"
      pass(card)
    else
      check?(input, card)
    end
  end

  def exit_game
    #TODO
    # View.display(score)
    View.display("Goodbye!")
    exit
  end

  def pass(card)
    View.display("The correct answer was #{card.term}")
    run_game
  end

  def check?(input, card)
    if input == card.term
      View.display("That's correct!")
      run_game
    else
      View.display("Try again!")
      run_game(card)
    end
  end
end
