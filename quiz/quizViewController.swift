//
//  quizViewController.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/21.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit

class quizViewController: UIViewController {
    
    //パーツの宣言
    @IBOutlet var selectedNameLabel : UILabel!
    @IBOutlet var quizTextView : UITextView!
    @IBOutlet var option1Button : UIButton!
    @IBOutlet var option2Button : UIButton!
    @IBOutlet var option3Button : UIButton!
    @IBOutlet var option4Button : UIButton!
    
    @IBOutlet var answerLabel : UILabel!
    @IBOutlet var answerLabel2 : UILabel!
    
    
    
    //変数の宣言と初期化
    var selectedName : String = ""
    var quizArray : [quiz] = []
    var point : Int = 0
    var quizNumber : Int = 0
    var answer : String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //クイズのセットアップ
        setUpQuiz()
        
        //クイズ選択肢の表示
        showQuiz()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //クイズのセットアップ
    func setUpQuiz() {
        let quiz1 = quiz(text: "日本の三大うどん", option1: "讃岐うどん（香川県）", option2: "伊勢うどん（三重県）", option3: "稲庭うどん（秋田県）", option4: "水沢うどん（群馬県）",answer: "伊勢うどん（三重県）")
        let quiz2 = quiz(text: "日本の三大ラーメン", option1: "札幌ラーメン", option2: "喜多方ラーメン", option3: "博多ラーメン", option4: "横浜ラーメン",answer: "横浜ラーメン")
        let quiz3 = quiz(text: "日本の三大珍味に", option1: "あんこうの肝", option2: "ウニ（塩ウニ）", option3: "カラスミ（ボラの卵巣の塩漬け）", option4: "このわた（なまこの腸の塩から）",answer: "あんこうの肝")
        let quiz4 = quiz(text: "日本三大和牛", option1: "神戸牛", option2: "仙台牛", option3: "米沢牛", option4: "松阪牛",answer: "仙台牛")
        let quiz5 = quiz(text: "日本三大銘茶", option1: "狭山茶", option2: "静岡茶", option3: "宇治茶", option4: "美濃茶",answer: "美濃茶")
        let quiz6 = quiz(text: "日本三大温泉", option1: "熱海温泉", option2: "下呂温泉", option3: "別府温泉", option4: "白浜温泉",answer: "下呂温泉")
        let quiz7 = quiz(text: "日本の三大美林", option1: "青森のヒバ", option2: "秋田のスギ", option3: "木曽のヒノキ", option4: "",answer: "")
        let quiz8 = quiz(text: "日本三代三景", option1: "三保の松原", option2: "天橋立", option3: "宮島", option4: "松島",answer: "三保の松原")
        let quiz9 = quiz(text: "日本三大夜景", option1: "函館山（北海道）", option2: "摩耶山掬星台（兵庫県）", option3: "", option4: "稲佐山（長崎県）",answer: "")
        let quiz10 = quiz(text: "日本三大秘境", option1: "岐阜県白川郷", option2: "徳島県祖谷", option3: "宮崎県椎葉村", option4: "",answer: "")
        let quiz11 = quiz(text: "日本三大鍾乳洞", option1: "岩手県の龍泉洞", option2: "高知県の龍河洞", option3: "", option4: "山口県の秋芳洞",answer: "")
        let quiz12 = quiz(text: "日本三大河川", option1: "信濃川", option2: "利根川", option3: "石狩川", option4: "最上川",answer: "最上川")
        let quiz13 = quiz(text: "日本三大花火大会", option1: "全国花火競技大会・大曲の花火（秋田県）", option2: "土浦全国花火競技大会（茨城県）", option3: "長岡まつり大花火大会（新潟県）", option4: "",answer: "")
        let quiz14 = quiz(text: "日本三大鳥居", option1: "", option2: "", option3: "", option4: "",answer: "")
        let quiz15 = quiz(text: "関東三大イルミネーション", option1: "東京ドイツ村", option2: "江の島 湘南の宝石", option3: "よみうりランド", option4: "あしかがフラワーパーク",answer: "よみうりランド")
        let quiz16 = quiz(text: "日本三大大仏", option1: "", option2: "", option3: "", option4: "",answer: "")
        let quiz17 = quiz(text: "日本三大名園", option1: "後楽園（岡山）", option2: "偕楽園（水戸）", option3: "兼六園（金沢）", option4: "龍安寺の石庭（京都）",answer: "龍安寺の石庭（京都）")
        let quiz18 = quiz(text: "日本三大がっかり名所", option1: "札幌の時計台", option2: "高知の播磨屋吊り橋", option3: "長崎のオランダ坂", option4: "",answer: "")
        let quiz19 = quiz(text: "美人が多いと言われている県", option1: "秋田県", option2: "京都府", option3: "福岡", option4: "",answer: "")
        let quiz20 = quiz(text: "日本三大芸能", option1: "能", option2: "歌舞伎", option3: "人形浄瑠璃", option4: "狂言",answer: "狂言")
        let quiz21 = quiz(text: "日本三大湖沼", option1: "十和田湖（とわだこ）", option2: "富士五湖（ふじごこ）", option3: "琵琶湖（びわこ）です。", option4: "",answer: "")
        let quiz22 = quiz(text: "都道府県面積大きいベスト３", option1: "北海道", option2: "岩手県", option3: "長野県", option4: "福島県",answer: "長野県")
        let quiz23 = quiz(text: "都道府県面積小さいベスト３", option1: "東京都", option2: "沖縄県", option3: "大阪府", option4: "香川県",answer: "沖縄県")
        let quiz24 = quiz(text: "日本三大瀑布", option1: "袋田の滝", option2: "那智の滝", option3: "華厳の滝", option4: "白糸の滝",answer: "")
        let quiz25 = quiz(text: "日本三大ダム", option1: "奥只見ダム（福島県）", option2: "黒部ダム（富山県）", option3: "御母衣ダム（岐阜県）", option4: "佐久間ダム（静岡県）",answer: "佐久間ダム（静岡県）")
        let quiz26 = quiz(text: "日本三大霊山", option1: "富士山", option2: "白山", option3: "立山", option4: "恐山",answer: "恐山")
        let quiz27 = quiz(text: "日本三大焼き鳥の町", option1: "北海道室蘭市", option2: "埼玉県東松山市", option3: "愛媛県今治市", option4: "福岡県飯塚市",answer: "福岡県飯塚市")
        let quiz28 = quiz(text: "日本江戸の三大改革", option1: "天保の改革", option2: "寛政の改革", option3: "享保の改革", option4: "慶応の改革",answer: "慶応の改革")
        let quiz29 = quiz(text: "日本三大阿波踊り", option1: "高円寺（東京都）", option2: "南越谷（埼玉県）", option3: "徳島", option4: "",answer: "")
        let quiz30 = quiz(text: "日本三大古湯", option1: "道後温泉（愛媛県）", option2: "白浜温泉（和歌山県）", option3: "有馬温泉（兵庫県）", option4: "",answer: "")
            
        
        
        
        
        
        // quizArray配列に問題を追加
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        quizArray.append(quiz6)
        quizArray.append(quiz7)
        quizArray.append(quiz8)
        quizArray.append(quiz9)
        quizArray.append(quiz10)
        quizArray.append(quiz11)
        quizArray.append(quiz12)
        quizArray.append(quiz13)
        quizArray.append(quiz14)
        quizArray.append(quiz15)
        quizArray.append(quiz16)
        quizArray.append(quiz17)
        quizArray.append(quiz18)
        quizArray.append(quiz19)
        quizArray.append(quiz20)
        quizArray.append(quiz21)
        quizArray.append(quiz22)
        quizArray.append(quiz23)
        quizArray.append(quiz24)
        quizArray.append(quiz25)
        quizArray.append(quiz26)
        quizArray.append(quiz27)
        quizArray.append(quiz28)
        quizArray.append(quiz29)
        quizArray.append(quiz30)
        
        
        
        
        


    }
    
    // クイズを各パーツに表示
    func showQuiz() {
        // クイズ、各選択肢の表示
        quizTextView.text = quizArray[quizNumber].text
        option1Button.setTitle(quizArray[quizNumber].option1, for: .normal)
        option2Button.setTitle(quizArray[quizNumber].option2, for: .normal)
        option3Button.setTitle(quizArray[quizNumber].option3, for: .normal)
        option4Button.setTitle(quizArray[quizNumber].option4, for: .normal)
        
    }
    
        
    
    // 選択肢1が押されたときの処理
    @IBAction func selectOption1() {
        //一度ボタンを押したら無効化
        self.option1Button.isEnabled = false
        self.option2Button.isEnabled = false
        self.option3Button.isEnabled = false
        self.option4Button.isEnabled = false
        
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option1Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            answerLabel.text = "正解！"
            
            //udに保存
            let ud = UserDefaults.standard
            //取り出す
            var savestarArray = ud.array(forKey: "starArray")
            //savestarArrayの値を変更
            savestarArray?[quizNumber] = 1
            //キーを指定して保存
            ud.set(savestarArray, forKey: "starArray")
            //即時保存
            ud.synchronize()
            
            
        } else {
            print("不正解！")
            answerLabel.text = "不正解！"
            answerLabel2.text = "正解は\(quizArray[quizNumber].answer)です"
        }
        
        
        
    }
    
    // 選択肢2が押されたときの処理
    @IBAction func selectOption2() {
        //一度ボタンを押したら無効化
        self.option1Button.isEnabled = false
        self.option2Button.isEnabled = false
        self.option3Button.isEnabled = false
        self.option4Button.isEnabled = false
        
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option2Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            answerLabel.text = "正解！"
            
            
            //udに保存
            let ud = UserDefaults.standard
            //取り出す
            var savestarArray = ud.array(forKey: "starArray")!
            //savestarArrayの値を変更
            savestarArray[quizNumber] = 1
            //キーを指定して保存
            ud.set(savestarArray, forKey: "starArray")
            //即時保存
            ud.synchronize()
            print(savestarArray)
        } else {
            print("不正解！")
            answerLabel.text = "不正解！"
            answerLabel2.text = "正解は\(quizArray[quizNumber].answer)です"
        }
        
       
    }
    
    // 選択肢3が押されたときの処理
    @IBAction func selectOption3() {
        
        //一度ボタンを押したら無効化
        self.option1Button.isEnabled = false
        self.option2Button.isEnabled = false
        self.option3Button.isEnabled = false
        self.option4Button.isEnabled = false
        
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            answerLabel.text = "正解！"
            
            //udに保存
            let ud = UserDefaults.standard
            //取り出す
            var savestarArray = ud.array(forKey: "starArray")
            //savestarArrayの値を変更
            savestarArray?[quizNumber] = 1
            //キーを指定して保存
            ud.set(savestarArray, forKey: "starArray")
            //即時保存
            ud.synchronize()
            
        } else {
            print("不正解！")
            answerLabel.text = "不正解！"
            answerLabel2.text = "正解は\(quizArray[quizNumber].answer)です"
        }
        
    }
    
    // 選択肢4が押されたときの処理
    @IBAction func selectOption4() {
        
        //一度ボタンを押したら無効化
        self.option1Button.isEnabled = false
        self.option2Button.isEnabled = false
        self.option3Button.isEnabled = false
        self.option4Button.isEnabled = false
        
        // ボタン内の文言と、もともと設定していた答えが一致しているか確認
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            // 正解ポイント追加
            point = point + 1
            answerLabel.text = "正解！"
            
            //udに保存
            let ud = UserDefaults.standard
            //取り出す
            var savestarArray = ud.array(forKey: "starArray")
            //savestarArrayの値を変更
            savestarArray?[quizNumber] = 1
            //キーを指定して保存
            ud.set(savestarArray, forKey: "starArray")
            //即時保存
            ud.synchronize()
            
        } else {
            print("不正解！")
            answerLabel.text = "不正解！"
            answerLabel2.text = "正解は\(quizArray[quizNumber].answer)です"
        }
        
        
    }


        
    
    

    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
