#Object orientied

class Card
 attr_accessor :suit, :face_value

 def initialize(s, fv)
  @suit = s
  @face_value = fv  
 end

  def pretty_output
   puts "The #{face_value} of #{suit}"
  end 

  def to_s
    pretty_output
  end

  def find_suit
    ret_val = case suit
	     when 'H' then 'HEARTS'
             when 'D' then 'Diamonds'
             when 'S' then 'Spades'
             when 'C' then 'Clubs'
         end
    ret_val
   end    
end

class Player
end

class Dealer
end

class Hand
end

c1 = Card.new('H', '3.0')
c2 = Card.new('D', '4.0')

c1.pretty_output
c2.pretty_output

puts c1.suit
puts c2.suit

c1.suit = "New Suit for C1"
c2.suit = "New Suit for C2"

puts c1.suit
puts c1.suit

c3 = Card.new('D', '5')
puts c3.find_suit	      
