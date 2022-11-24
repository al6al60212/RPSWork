//
//  Sign.swift
//  RPSWork
//
//  Created by 董禾翊 on 2022/11/24.
//

import Foundation
//定義剪刀石頭布
enum Sign {
    case rock
    case paper
    case scissors
    //用switch判斷self，回傳對應的emoji
    var emoji: String {
        switch self {
        case .rock :
            return "👊"
        case .paper :
            return "✋"
        case .scissors :
            return "✌️"
        }
    }
    //建立function判斷電腦和玩家出的拳，回傳成遊戲狀態
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }

        switch self {
        case .rock :
            if opponentSign == .scissors {
                return .win
            }
        case .paper :
            if opponentSign == .rock {
                return .win
            }
        case .scissors :
            if opponentSign == .paper {
                return .win
            }
        }
        return .lose
    }
}
//電腦隨機出拳
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else{
        return .scissors
    }
}


