//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Bejan Fozdar on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Dealer {
    var deck: Deck =  Deck()
    var house = House(name: "House")
    var player = House(name: "Player")
    var bet: UInt = 0
    
    
    
    // func place(bet:) = takes an unsigned integer argument and returns a boolean of whether or not the house and the player can both afford the submitted bet. If they can, this method should record the value of the bet being placed.
    func place(bet amount: UInt) -> Bool {
        if house.canPlace(bet: amount) && player.canPlace(bet: amount) {
            bet = amount
            return true
        } else {
            return false
        }
    }
    // func deal() = that deals a new round, giving two new cards each to the player and to the house.
    func deal() {
        player.cards.removeAll()
        house.cards.removeAll()
        player.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        house.cards.append(deck.drawCard())
        player.stayed = false
        house.stayed = false
    }
    
    // func turn() = which takes a House argument (since in this console version both the house and the player will be used with this method). If the House object is allowed to take a card, it should be asked if it wishes to hit or stay. If the House object wishes to hit, the dealer should then give it a card. If the House object wishes to stay, then the decision to stay should be recorded.
    func turn(house: House) {
        if !house.busted  && !house.stayed {
            if house.mustHit {
                house.cards.append(deck.drawCard())
            } else {
                house.stayed = true
            }
        }
    }
    
    // func winner() = return"player" if the player wins, return "house" if the house wins, and return "no" if there is not yet a winner.  a bust is an immediate victory for the other player, the house wins ties, and the player can win by holding five cards that are not a bust.
    func winner() -> String {
        if player.blackjack || house.busted || player.cards.count >= 5 || ((player.handscore > house.handscore) && (house.mustHit == false)) {
            return "player"
        } else if house.blackjack || player.busted || ((player.handscore <= house.handscore) && (player.stayed == true)) {
            return "house"
        } else {
            return "no"
        }
    }
    
    // func award() = that uses the result of the winner() method to award the bet to the winner of the round. It should add the value of the bet to the winning player and subtract the value of the bet from the losing player. The award() method should also return a string message expressing the result of the round in a phrase or sentence.
    func award() -> String{
        let win = winner()
        if win == "player" {
            player.didWin(bet: bet)
            house.didLose(bet: bet)
            return "\(win) wins"
        } else if win == "house" {
            house.didWin(bet: bet)
            player.didLose(bet: bet)
            return "\(win) wins"
        } else {
            return "\(win) winner"
        }
        
    }
    
    
}

