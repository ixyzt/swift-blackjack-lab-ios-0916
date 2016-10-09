//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Bejan Fozdar on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class House: Player {
    // Add a calculated property mustHit that returns a boolean of whether the house must take a new card or not. Treat the "house rules" as staying at a score of seventeen (17)
    var mustHit: Bool { return handscore < 17 }
    
    
    override init(name: String) {
        super.init(name: name)
        tokens = 1000 }
    
}
