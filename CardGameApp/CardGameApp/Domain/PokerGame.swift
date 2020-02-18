//
//  PokerGame.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation
extension PokerGame {
    enum GameStut: Int {
        case five = 5, seven = 7
        
        func forEach(handler : () -> (Error?)) throws {
            for _ in 0 ..< self.rawValue {
                if let error = handler() {
                    throw error
                }
            }
        }
    }
    
    enum PlayersNum: Int {
        case one = 1 , two, three, four
        func forEach(handler : () -> (Void)) {
            for _ in 0 ..< self.rawValue {
                handler()
            }
        }
    }
}

class PokerGame {
    
    private let deck = Deck()
    private let dealer = Player()
    private var players: [Player]!
    
    private var gameStut: GameStut
    private var playersNum : PlayersNum
    
    init(gameStut: GameStut , playersNum: PlayersNum){
        self.gameStut = gameStut
        self.playersNum = playersNum
        players = initPlayers(num: self.playersNum)
    }
    
    private func initPlayers(num: PlayersNum) -> [Player] {
        var players = [Player]()
        num.forEach {
            players.append(Player())
        }
        return players
    }
    
    func startNewRound() throws {
        initParticipantsCards()
        shuffle()
        try handOutCards()
    }
    
    private func initParticipantsCards() {
        initDealerCards()
        initPlayersCards()
    }
    
    private func initDealerCards() {
        dealer.initCards()
    }
    
    private func initPlayersCards() {
        _ = players.map { $0.initCards() }
    }
    
    private var generator = ANSI_C_RandomNumberGenerator()
    private func shuffle() {
        deck.shuffle(using: &generator)
    }
    
    private func handOutCards() throws {
        try gameStut.forEach { 
            do {
                try sendToDealer()
                try sendToPlayers()
                return nil
            } catch {
                return error
            }
        }
    }
    
    private func sendToDealer() throws {
        try dealer.receiveCard {
            do {
                let card = try deck.removeOne()
                return .success(card)
            } catch {
                return .failure(error)
            }
        }
    }
    
    private func sendToPlayers() throws {
        for index in 0 ..< players.count {
            try players[index].receiveCard {
                do {
                    let card = try deck.removeOne()
                    return  .success(card)
                } catch {
                    return .failure(error)
                }
            }
        }
    }
    
    func hasEnoughCards() -> Bool {
        return deck.count >= stutNum * players.count
    }
    
    private var stutNum : Int {
        var stutNum = 0
        try? gameStut.forEach {
            stutNum += 1
            return nil
        }
        return stutNum
    }
}

extension PokerGame {
    func searchDeck(handler: (Deck) -> ()) {
        handler(deck)
    }
    
    func searchDealer(handler : (Player) -> ()) {
        handler(dealer)
    }
    
    func searchPlayers(handler : (Player) -> ()) {
        for player in players {
            handler(player)
        }
    }
    
}

enum PokerGameError: Error {
    case invalidGameStutNumber
    case invalidPlayersNumber
}
