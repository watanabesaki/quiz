//
//  quiz.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/23.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit
//クイズオブジェクトの設計図
class quiz: NSObject {
    
    //クイズひとつの問題がどんな値を扱うか宣言
    var text = String()
    var option1 = String()
    var option2 = String()
    var option3 = String()
    var option4 = String()
    var answer = String()

    //Initializer(イニシャライザ) = 初期化処理
    init (text : String,option1 : String, option2 : String, option3 : String, option4 : String, answer : String){
        self.text = text
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
        
    }
    
    
}
