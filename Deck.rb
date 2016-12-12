class Deck
  attr_accessor :owner, :deckSize, :cardIndex
  def initialize(owner, cardIndex = [], deckSize = cardIndex.length)
    @owner = owner
    @cardIndex = cardIndex
    @deckSize = deckSize
  end

  def play
    cardIndex.pop
  end

  def claim(pile)
    pile.each do|card|
      cardIndex.unshift(card)
    end
  end

  def war
    [cardIndex.pop, cardIndex.pop, cardIndex.pop, cardIndex.pop]
  end

  def countCards
    @deckSize = cardIndex.length
  end

  def shuffleDeck(time)
    time.times {|n|cardIndex.shuffle!}
    #tempDeck = cardIndex
    #newOrder = Array.new(deckSize)
    #deckSize.times do|n|
    #  order = rand(0..(deckSize-1))
    #  while newOrder.index(order) != nil
    #    order = rand(0..(deckSize-1))
    #  end
    #  newOrder[order] = n
    #end
    #n = 0
    #tempDeck.each do|card|
    #  cardIndex[(newOrder[n]).to_i] = card
    #  n += 1
    #end
  end

  def playOn(card)
    cardIndex.push(card)
  end

  def onTop
    cardIndex.last
  end
end
