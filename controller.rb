class GameController
  attr_reader :view, :deck

  def initialize(deck)
    @view = View.new
    @deck = Deck.new(deck)
    run
  end

  def run
    view.welcome
    input = view.user_input
    start_game(input)
  end

  def start_game(input)
    loop do
      card = deck.get_card
      view.display(card.definition)
      input = view.user_input

      until check?(input, card.term) || exit?(input) || pass?(input)
        view.display("Incorrect. Try again")
        view.display(card.definition)
        input = view.user_input
      end

      break if exit?(input)

      if pass?(input)
        view.display("The correct term was #{card.term}.")
        sleep(0.3)
        next
      end

      view.display("Nice job!")
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
