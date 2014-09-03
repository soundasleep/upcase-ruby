class Application
  def initialize
    @decks = []

    deck = Deck.new("Let's learn Japanese!")
    deck << MultipleAnswerCard.new("cat", "neko,meow")
    deck << Card.new("dog", "inu")
    deck << Card.new("snake", "hebi")
    
    @decks << deck
  end

  def play
    deck = @decks.first
    deck.shuffle

    puts "#{deck.name}"
    puts "-" * deck.name.length

    deck.cards.each do |card|
      front, back = [card.front, card.back]

      print "#{front} > "
      guess = gets.chomp

      if card.correct?(guess)
        puts "Correct"
      else
        puts "Incorrect, #{front} -> #{card.answers}"
      end
    end    
  end
end

class Card
  def initialize(a, b)
    @front = a
    @back = b
  end

  # attr_reader :front, :back
  attr_accessor :front
end

class Card
  # attr_writer :front, :back
  attr_accessor :back

  def correct?(guess)
    @back == guess
  end

  def answers
    @back
  end
end

class MultipleAnswerCard < Card
  def correct?(guess)
    @back.split(",").include?(guess)
  end

  def answers
    @back.split(",").join(", ")
  end
end

class Deck
  attr_reader :name
  attr_reader :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def <<(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle!
  end
end

app = Application.new
app.play
