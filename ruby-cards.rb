require_relative 'deck'
require_relative 'card'
require_relative 'parser'
require_relative 'view'
require_relative 'controller'
require 'csv'


GameController.new(CardParser.parse('flashcard_samples.csv'))
