require './Deck'
require './Card'
value = [2,3,4,5,6,7,8,9,10,"J","Q","K","A"]
cards = []
value.each do|n|
  cards.push(Card.new("Hearts", n))
  cards.push(Card.new("Spades", n))
  cards.push(Card.new("Dimonds", n))
  cards.push(Card.new("Clubs", n))
end
deck = Deck.new('game', cards)
deck.shufle
deck.shufle
deck.shufle
#deck.cardIndex.each do|n|
#  puts n.value
#  puts n.suit
#end
player1 = Deck.new('Player')
26.times {|n|player1.claim([deck.play])}
player1.countCards
player2 = Deck.new('Computer')
26.times {|n|player2.claim([deck.play])}
player2.countCards


def compair(player1, player2, play1, play2, pile=[])
  pile += [play1, play2]
  puts "#{player1.owner}: #{play1.cardNum} of #{play1.suit}"
  puts "#{player2.owner}: #{play2.cardNum} of #{play2.suit}"
  if play1.value > play2.value
    player1.claim(pile)
    puts "#{player1.owner} wins #{pile}"
    $stdout.flush
  elsif play1.value < play2.value
    player2.claim(pile)
    puts "#{player2.owner} wins #{pile}"
    $stdout.flush
  else
    puts "WAR!!!"
    $stdout.flush
    warComp(player1, player2, player1.war, player2.war, pile)
    
  end
end

def warComp(player1, player2, play1, play2, pile)
  warPlay1 = play1.shift
  warPlay2 = play2.shift
  
  pile += play1 + play2
  compair(player1, player2, warPlay1, warPlay2, pile) 
  return
end

while player1.countCards > 5 && player2.countCards > 5
  compair(player1, player2, player1.play, player2.play)
  if player1.countCards <=5
    puts "#{player2.owner} wins the game!"
  end
  if player2.countCards <=5
    puts "#{player1.owner} wins the game!"
  end
  $stdout.flush
end
