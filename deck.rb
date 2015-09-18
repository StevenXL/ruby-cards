class Deck
  attr_reader :deck, :enum

  def initialize(deck = [])
    @deck = deck
    @enum = deck.each
  end

  def get_card
    enum.next
  end
end
