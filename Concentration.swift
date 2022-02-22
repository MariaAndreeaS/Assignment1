//
//  Concentration.swift
//  Concentration
//
//  Created by Maria Andreea on 18.02.2022.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var score=0
    var flipCount=0

    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            flipCount+=1
            if let matchIndex=indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier==cards[index].identifier
                {
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                    score+=2
                }else{
                  if cards[matchIndex].seen==true{
                    score-=1
                  }
                  if cards[index].seen==true{
                    score-=1
                  }
                }
                cards[index].seen=true
                cards[matchIndex].seen=true
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 card are face up
                for fliDownIndex in cards.indices{
                    cards[fliDownIndex].isFaceUp=false
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=index
            }
        }
    }

    init(numberOfPParisOfCards: Int){
        for _ in 1...numberOfPParisOfCards
        {
            let card = Card()
            cards += [card,card]
        }
     //TODO: Shuffle the cards
        cards.shuffle()
    }
}
