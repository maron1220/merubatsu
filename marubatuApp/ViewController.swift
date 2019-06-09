//
//  ViewController.swift
//  marubatuApp
//
//  Created by 細川聖矢 on 2019/06/08.
//  Copyright © 2019 Seiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //関数のままだと読み込まれないので､viewdidLoadに入れる
        showQuestion()
    }
    
    var currentQuestionNum:Int = 0
    //問題を格納↓｡二重配列｡辞書型｡array型＝番号｡dictionary型=キー｡Any=型は何でも良いよ｡
    let questions:[[String:Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである"/*String型*/,
            "answer": false/*nil型*//*今後の場合分けのためにfalse,trueを使用している*/
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    
    ]
    
    //問題の配列を取り出すための関数
    func showQuestion(){
        let question = questions[currentQuestionNum]/*配列の0番目にある問題をとってくる*/
        
        /*0番目にある問題のうち､キーがquestionのものをもってくる↓*/
        if let que = question["question"] as? String{
            questionLabel.text = que
        }
    }
    
    //答えの配列を取り出すための関数
    //true,falseなのでBool型
    func checkAnswer(yourAnswer:Bool){
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans{
               // せいかい
                currentQuestionNum += 1
                showAlert(message:"正解")
            }else{
                //ふせいかい
                showAlert(message:"不正解")
            }
        }else{
            print("答えがありません")
            return
        }
        
        //配列は0から始まるので >= を使用している｡
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        
        //次の問題を表示するためにshowQuestion()を呼び出す｡
        showQuestion()
        
        
    }
    
    func showAlert(message:String){
        
        //alertは型を覚えるだけ
        let alert = UIAlertController(title: nil, message:message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "とじる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert,animated: true,completion: nil)
        //↑ここまで型
    }

    @IBAction func batuButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    @IBAction func maruButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
}

