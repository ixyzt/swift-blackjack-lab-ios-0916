//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Bejan Fozdar on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

//
//let aceOfSpades : Card = Card(suit: "♠︎", rank: "A")
//let queenOfHearts : Card = Card(suit: "♥︎", rank: "Q")
//let tenOfDiamonds : Card = Card(suit: "♦︎", rank: "10")
//let twoOfClubs : Card = Card(suit: "♣︎", rank: "2")

import Foundation


class Card {
    var suit: String
    var rank: String
    var cardLabel: String
    var cardValue: UInt = 0
    var description: String {
        return cardLabel
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        cardLabel = suit + rank
        cardValue = determineCardValue()
    }
    
    static func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    static func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
//    Write a function called determineCardValue(_:) which takes a card's rank as a string and returns a unsigned integer. Change your initializer to use this function in setting the value for the card being initialized.
//    Hint: Use a switch statement to return the right value based on rank.
    func determineCardValue() -> UInt {
        switch rank {
        case "A":
            return 1
        case "J", "Q", "K":
            return 10
        default:
            return UInt(rank)!
        }
    }
}

// This should take in an array of Card objects and return a single string of all the cardLabels in the array, sorted by suit and rank, with each suit on a new line.
func descriptionFor(cardArray cards: [Card]) -> String {
    var description: String = ""
    for (index, card) in cards.enumerated() {
        description += "\(card.cardLabel)"
    if index + 1 % 13 == 0 { description += "n" }
}
    return description
}




