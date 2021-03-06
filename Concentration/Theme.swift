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
        Theme(emoji:["π€©","π","π₯³","π","π€","π","π","π"],backgroundcolor:UIColor.systemCyan, buttonColor: UIColor.magenta),
        Theme(emoji: ["π","π»","π","π€‘","π½","π€", "πΎ","π§ββοΈ"],backgroundcolor:UIColor.systemBrown,buttonColor: UIColor.systemMint),
        Theme(emoji: ["π¦π©","πΊπΈ","π³","πΉπ©","π»π³","π³οΈβπ","π³οΈββ§οΈ","πΊπ³"], backgroundcolor:UIColor.systemMint,buttonColor: UIColor.systemYellow),
        Theme(emoji: ["π", "π", "π", "β", "πͺ", "π", "π", "π"],backgroundcolor:UIColor.systemGreen,buttonColor: UIColor.systemGray2),
        Theme(emoji: ["π", "π", "π", "π", "π", "π₯", "π₯₯", "π"],backgroundcolor:UIColor.systemTeal,buttonColor: UIColor.systemPurple),
        Theme(emoji: ["π‘", "π’", "π΅", "π£", "π΄", "π ", "π€", "β«οΈ"],backgroundcolor:UIColor.systemGray,buttonColor: UIColor.systemGray6)]

    static func randomTheme() -> Theme {
            return themes[Int.random(in: 0..<themes.count)]
        }
}
