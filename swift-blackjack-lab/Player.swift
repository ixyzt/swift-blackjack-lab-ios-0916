//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Bejan Fozdar on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation



class Player {
    
    var name: String
    var cards = [Card]()
    var stayed: Bool = false
    // handscore = a calculated property that evaluates the cards array. It may use one Ace as a value of 11 if doing so will not bust the hand.
    var handscore: UInt {
        var score: UInt = 0
        var aces: [Card] = []
        
        for card in cards {
            if card.rank == "A" { aces.append(card) }
            score += card.cardValue
        }
        if !aces.isEmpty {
            let wouldBust = (score + 10) > 21
            if !wouldBust {
                score += 10
            }
        }
        return score
    }
    
    
    
    //  blackjack = a calculated property that determines whether the hand is a blackjack (a score of 21 with only two cards).
    var blackjack: Bool {
        if cards.count == 2 {
        return handscore == 21
        }
        return false
    }
    
    var busted: Bool {
        return handscore > 21
    }
    
    
    // mayhit = a calculated property that determines whether the player may take a new card (if the hand is not busted, is not a blackjack, and if the player has not stayed)
    var mayHit: Bool {
        return !stayed && handscore < 21
    }
    var tokens: UInt = 100
    // description = a calculated property which returns a string detailing the object's current state ????
    var description: String {
        var cardList: String = ""
        for card in cards {
            cardList += card.cardLabel
            cardList += " "
        }
        return "\(name) has \(cards.count) cards are: (\(cardList)) which totals a handscore of \(handscore). They have \(tokens) tokens remaining. \nBusted: \(busted) \nBlackjack: \(blackjack) \nStayed: \(stayed)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    
    
    // func canPlaceBet = returns a boolean of whether or not the player can afford the submitted bet.
    func canPlace(bet: UInt) -> Bool {
        return bet <= tokens
    }
    // func didWin = take an unsigned integer for the value of the bet and appropriately update the value of tokens.
    func didWin( bet: UInt) {
        tokens += bet
    }
    
    // func didWin = take an unsigned integer for the value of the bet and appropriately update the value of tokens.
    func didLose(bet: UInt) {
        tokens -= bet
    }
}
