require_relative 'deck'
require_relative 'card'
require_relative 'parser'
require_relative 'view'
require_relative 'controller'
require 'csv'


file = 'flashcard_samples.csv'

file = ARGV[0] if ARGV[0]

GameController.new(CardParser.parse(file))
