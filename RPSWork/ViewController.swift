//
//  ViewController.swift
//  RPSWork
//
//  Created by 董禾翊 on 2022/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var computerSignLable: UILabel!
    @IBOutlet weak var gameStateLable: UILabel!
    
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var againBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //玩家出石頭
    @IBAction func rock(_ sender: UIButton) {
        play(userSign: .rock)
    }
    //玩家出布
    @IBAction func paper(_ sender: UIButton) {
        play(userSign: .paper)
    }
    //玩家出剪刀
    @IBAction func scissors(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    //Play Again按鈕
    @IBAction func again(_ sender: UIButton) {
        updateUI(forState: .start)
    }
    
    //建立function，判斷遊戲狀態更新畫面
    func updateUI(forState state: GameState){
        gameStateLable.text = state.status
        
        switch state {
        //遊戲狀態為start時
        case .start :
            //背景顏色
            view.backgroundColor = .gray
            //顯示對手圖像
            computerSignLable.text = "🤖"
            //玩家三種拳的按鈕不隱藏
            rockBtn.isHidden = false
            paperBtn.isHidden = false
            scissorsBtn.isHidden = false
            //玩家三種拳的按鈕可操作
            rockBtn.isEnabled = true
            paperBtn.isEnabled = true
            scissorsBtn.isEnabled = true
            //再玩一次按鈕隱藏
            againBtn.isHidden = true
        //設定各種遊戲狀態下的背景顏色
        case .win :
            view.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        case .lose :
            view.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
        case .draw :
            view.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1)
        }
    }
    
    //建立function，傳入參數為玩家選擇的出拳
    func play(userSign: Sign){
        //電腦隨機出拳
        let computerSign = randomSign()
        computerSignLable.text = computerSign.emoji
        
        //宣告gameState為電腦和玩家PK後的遊戲狀態
        let gameState = userSign.gameState(against: computerSign)
        //呼叫更新UI，顯示遊戲狀態
        updateUI(forState: gameState)
        
        //這邊先隱藏種拳的按鈕
        rockBtn.isHidden = true
        paperBtn.isHidden = true
        scissorsBtn.isHidden = true
        //再判斷並顯示玩家出的拳
        switch userSign {
            case .rock :
                rockBtn.isHidden = false
            case .paper :
                paperBtn.isHidden = false
            case .scissors :
                scissorsBtn.isHidden = false
            }
        //將三種拳設為不可操作
        rockBtn.isEnabled = false
        paperBtn.isEnabled = false
        scissorsBtn.isEnabled = false
        
        //顯示再玩一次按鈕
        againBtn.isHidden = false
    }

}

