//
//  Player.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/14.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Player {
    private(set) var name: String
    private(set) var handDeck = [Card]()
    private lazy var score = Score(cardDeck: handDeck).calculateScore()
    private(set) var winGame: Bool
    
    init(name: String) {
        self.name = name
        self.winGame = false
    }
    
    func bringCard(card: Card){
        self.handDeck.append(card)
    }
}
