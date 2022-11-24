//
//  GameState.swift
//  RPSWork
//
//  Created by 董禾翊 on 2022/11/24.
//

import Foundation
//定義遊戲狀態
enum GameState {
    case start
    case win
    case lose
    case draw
    //用switch判斷self狀態，回傳對應字串
    var status: String {
        switch self {
        case .start :
            return "Rock,Paper,Scissors?"
        case .win :
            return "You Win!"
        case .lose :
            return "You Lose!"
        case .draw :
            return "It's a Draw"
        }
    }
}
