module View
  def self.display(str)
    puts
    puts str
  end

  def self.user_input
    gets.chomp
  end

  def self.clear_display
    system "clear"
  end
end
