
class Card

  attr_accessor :suit, :cardNum 
  def initialize(suit, cardNum)
    @suit = suit
    @cardNum = cardNum
  end

  def value
    if cardNum == "A"
      return 14
    elsif cardNum == "K"
      return 13
    elsif cardNum == "Q"
      return 12
    elsif cardNum == "J"
      return 11
    elsif cardNum == nil
      return nil
    end
    return cardNum.to_i
  end
   
end
