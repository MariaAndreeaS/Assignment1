//
//  ViewController.swift
//  Concentration
//
//  Created by Maria Andreea on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game  = Concentration(numberOfPParisOfCards: (cardButtons.count+1)/2)


    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel!


    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Chosen card was not in cardButtons")
        }
    }

    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button=cardButtons[index]
            let card=game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor=UIColor.white
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor=card.isMatched ? UIColor.white.withAlphaComponent(0) : UIColor.orange
            }
        }
    }

    var emojiChoices = ["🤩","😍","🥳","👻","🎃","😎","😚","😇"]

    var emoji = [Int:String]()

    func emoji(for card: Card)-> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
               let randomIndex  = Int( arc4random_uniform(UInt32(emojiChoices.count)))
              emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
           }
        return emoji[card.identifier] ?? "?"
    }

}

