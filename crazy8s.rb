require './Deck'
require './Card'
require './scan'
# :(
value = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
cards = []
value.each do|n|
  cards.push(Card.new("Hearts", n))
  cards.push(Card.new("Spades", n))
  cards.push(Card.new("Dimonds", n))
  cards.push(Card.new("Clubs", n))
end
deck = Deck.new('game', cards)
puts "how many shuffles"
deck.shuffleDeck(scan.chomp.to_i)
player1 = Deck.new('Player')
7.times {|n|player1.claim([deck.play])}
player1.countCards
player2 = Deck.new('Computer')
7.times {|n|player2.claim([deck.play])}
player2.countCards
discard = Deck.new('discard', [deck.play])
# :(
def turn(player, hand, discardTop)
  puts "\n#{discardTop.cardNum} of #{discardTop.suit} on top."
  playable = []
  puts "\n#{player.owner}: "
  hand.each do|card|
    if player.owner == "Player"
      print "#{card.cardNum} of #{card.suit}\n"
    end
    if card.value == discardTop.value || card.suit == discardTop.suit || card.value == 8
      playable.push(card)
      if player.owner == "Player"
        print "type #{playable.length} to play this card.\n"
      end
    end
  end
  playable
end
  # :)
count = 0 
playable = []
tempCard = nil
while player1.countCards > 0 && player2.countCards > 0 && deck.countCards > 0
  if count == 0
    playable = turn(player1, player1.cardIndex, discard.onTop)
    if !playable.empty?
      input = scan.chomp.to_i
      input += -1
      if playable[input].value == 8
      #if tempCard == 8
        puts "Name suit"
        newSuit = scan.chomp
        discard.playOn(Card.new(newSuit, 8))
      else
        discard.playOn(playable[input])
      end
      player1.cardIndex.delete(playable[input])
    else
      puts "No playable cards ... Drawing ..."
      newCard = deck.play
      player1.claim([newCard])
      puts "Drew the #{newCard.cardNum} of #{newCard.suit}"
      count += 1
    end
  else
    playable = turn(player2, player2.cardIndex, discard.onTop)
    if !playable.empty?
      input = rand(0..(playable.length-1))
      print "played the #{playable[input].cardNum} of #{playable[input].suit}\n"
      player2.cardIndex.delete(playable[input])

      if playable[input].value == 8
	suit = ["Hearts","Spades","Dimonds","Clubs"]
        discard.playOn(Card.new(suit[rand(3)], 8))
      else
        discard.playOn(playable[input])
      end
    else
      puts "No playable cards ... Drawing ..."
      newCard = deck.play
      player2.claim([newCard])
      count += 1
    end
  end
  count+=1
  count = count%2
end
  # :)
if player1.counCards <= 0
  print "#{player1.owner} wins"
else
  print "#{player2.owner} wins"
end 
#while player1.countCards > 0 && player2.countCards > 0 && deck.countCards > 0
#  discard.playOn(turn(player1, player1.cardIndex, discard.onTop))
#  discard.playOn(turn(player2, player2.cardIndex, discard.onTop))
  

#end
