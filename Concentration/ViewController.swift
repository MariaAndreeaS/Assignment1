//
//  ViewController.swift
//  Concentration
//
//  Created by Maria Andreea on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game  = Concentration(numberOfPParisOfCards: (cardButtons.count+1)/2)

    //Setting theme
    override func viewDidLoad() {
          setTheme()
        }

    var theme=Theme.randomTheme()
    var emojiChoices = [String]()
    var emoji = [Int:String]()

    @IBOutlet weak var match: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!

    //start a new game
    @IBAction func startGame(_ sender: UIButton) {
        game=Concentration(numberOfPParisOfCards: (cardButtons.count+1)/2)
        setTheme()
        updateViewFromModel()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
          }else{
             print("Chosen card was not in cardButtons")
             }
    }
    //set theme for the game
    func setTheme(){
      theme=Theme.randomTheme()
      for index in cardButtons.indices{
          _=cardButtons[index].backgroundColor=theme.buttonColor
          view.backgroundColor=theme.backgroundcolor
          emojiChoices=theme.emoji
      }
    }

    func updateViewFromModel(){
        flipCountLabel.text = "Flips: \(game.flipCount)"
        match.text = "Score: \(game.score)"

        for index in cardButtons.indices{
            let button=cardButtons[index]
            let card=game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor=theme.buttonColor
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor=card.isMatched ? UIColor.white.withAlphaComponent(0) : theme.buttonColor
            }
        }
    }

    func emoji(for card: Card)-> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier]=emojiChoices.remove(at: randomIndex)
               }
            return emoji[card.identifier] ?? "?"
        }
}

