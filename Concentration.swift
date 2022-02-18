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

    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex=indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier==cards[index].identifier
                {
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=nil
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
