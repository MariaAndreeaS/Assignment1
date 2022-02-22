//
//  Theme.swift
//  Concentration
//
//  Created by Maria Andreea on 21.02.2022.
//


import Foundation
import UIKit


struct Theme{
    var emoji:[String]
    var backgroundcolor: UIColor
    var buttonColor: UIColor


    init(emoji:[String],backgroundcolor:UIColor,buttonColor: UIColor)
    {
        self.emoji=emoji
        self.backgroundcolor=backgroundcolor
        self.buttonColor=buttonColor
    }

    static let themes = [
        Theme(emoji:["🤩","😍","🥳","😅","🤓","😎","😚","😏"],backgroundcolor:UIColor.systemCyan, buttonColor: UIColor.magenta),
        Theme(emoji: ["💀","👻","🎃","🤡","👽","🤖", "👾","🧛‍♀️"],backgroundcolor:UIColor.systemBrown,buttonColor: UIColor.systemMint),
        Theme(emoji: ["🇦🇩","🇺🇸","🏳","🇹🇩","🇻🇳","🏳️‍🌈","🏳️‍⚧️","🇺🇳"], backgroundcolor:UIColor.systemMint,buttonColor: UIColor.systemYellow),
        Theme(emoji: ["👍", "👎", "👉", "✊", "💪", "👏", "👋", "👊"],backgroundcolor:UIColor.systemGreen,buttonColor: UIColor.systemGray2),
        Theme(emoji: ["🍏", "🍎", "🍊", "🍉", "🍌", "🥝", "🥥", "🍇"],backgroundcolor:UIColor.systemTeal,buttonColor: UIColor.systemPurple),
        Theme(emoji: ["🟡", "🟢", "🔵", "🟣", "🔴", "🟠", "🟤", "⚫️"],backgroundcolor:UIColor.systemGray,buttonColor: UIColor.systemGray6)]

    static func randomTheme() -> Theme {
            return themes[Int.random(in: 0..<themes.count)]
        }
}
