//
//  answerViewController.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/21.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit

class answerViewController: UIViewController {
    
    //パーツの宣言
    @IBOutlet var answerTexView : UITextView!
    
    //変数の宣言
    var answertext : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    //クイズの更新
    //func updatequiz(){
        //問題番号更新
        //quizNumber = quizNumber + 1
        
        //showQuiz()
    //}

}
