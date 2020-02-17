//
//  PokerGame.swift
//  CardGameApp
//
//  Created by delma on 10/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class PokerGame {
    private let dealer = Dealer()
    private var players = Players()
    private var studNumber: Stud
    
    enum Stud: Int {
        case five = 5
        case seven = 7
        
        func foreach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    enum PlayerCount: Int {
        case one = 1, two, three, four
        
        func foreach(_ transform : () -> ()) {
            for _ in 0..<self.rawValue {
                transform()
            }
        }
    }
    
    init(playerCount: PlayerCount, stud: Stud) {
        self.studNumber = stud
        playerCount.foreach {
            self.players.append(player: Player())
        }
    }
      
    func allocateCards() {
        dealer.shuffle()
        studNumber.foreach {
            players.forEachPlayer { (player) in
                guard let card = dealer.removeOne() else { return }
                player.appendCard(card)
            }
            guard let card = dealer.removeOne() else { return }
            dealer.appendCard(card)
        }
    }
    
    func leftCards() -> Int {
        return dealer.leftCards()
    }
    
    func playersCardInfo() -> [[Card]]{
        var allPlayersCards: [[Card]] = []

        players.forEachPlayer { (player) in
                        allPlayersCards.append(player.cardsInfo())

        }
       return allPlayersCards
    }
    
    func dealerCardInfo() -> [Card]{
        return dealer.cardsInfo()
    }
    
    func forEachPlayer(handler: (Player) -> ()) {
        players.forEachPlayer { (player) in
            handler(player)
        }
    }
}
