require 'csv'

module CardParser
  def self.parse(filename)
    CSV.read(filename, headers: true, header_converters: :symbol, converters: :all, quote_char: "%").map do |row|
      Card.new(row.to_hash)
    end
  end
end
