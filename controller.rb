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
      break if input == "exit"

      if input == "pass"
        next
      end

      until check?(input, card.term)
        view.display("Incorrect. Try again")
        view.display(card.definition)
      end

      view.display("Nice job!")
    end
  end

  def check?(input, term)
    input == term
  end
end
