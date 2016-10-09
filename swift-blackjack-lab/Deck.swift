//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Bejan Fozdar on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Deck {
    private var dealt: [Card] = [] //could be a computed property that is the combination of the player.cards and house.cards.  Would avoid the need to deliver a copy to the dealt deck to keep track.
    private var unDealt: [Card] = []
    var description: String { return deckDescription() }
    
    // Write an initializer that generates the 52 unique cards required for modeling a standard 52-card deck. It should hold them in the array of cards that can be dealt.
    init() {
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                unDealt.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    // Add a description string property that can be used to print information regarding the cards to the console. This string will need to contain information about the remaining cards and dealt cards.
    func deckDescription() -> String {
        return "Cards Remaining: \(unDealt.count)\nCards Dealt: \(dealt.count)"
    }
    
    // func drawCard() = return the next card. It should remove that card from the remaining cards and add it to the dealt cards.
    func drawCard() -> Card {
        let nextCard = unDealt.removeLast()
        dealt.append(nextCard)
        return nextCard
    }
    
    
    // func shuffle() = gathers up the dealt cards and randomizes all 52 cards. These randomized cards should be returned to your array of undealt cards.   arc4random_uniform()
    func shuffle() {
        unDealt.append(contentsOf: dealt)
        for _ in 1...100 {
            unDealt.insert(unDealt.remove(at: 0), at: Int(arc4random_uniform(UInt32(unDealt.count))))
        }
    }
    
}
