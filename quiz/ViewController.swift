//
//  ViewController.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/21.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //セルサイズ
    
    @IBOutlet var maincollectinview : UICollectionView!
    
    //udを入れるため
    var savestarArray: [Int] = []
    
    
    var menu : [String] = ["うどん",
                           "ラーメン",
                           "珍味",
                           "牛",
                           "茶",
                           "温泉",
                           "美林",
                           "三景",
                           "夜景",
                           "秘境",
                           "鍾乳洞",
                           "河川",
                           "花火大会",
                           "鳥居",
                           "光",
                           "大仏",
                           "名園",
                           "がっかり",
                           "美人県",
                           "芸能",
                           "湖沼",
                           "都道府県１",
                           "都道府県２",
                           "瀑布",
                           "ダム",
                           "霊山",
                           "焼き鳥",
                           "江戸改革",
                           "阿波踊り",
                           "古湯",
                           ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //プロトコル宣言後
        maincollectinview.dataSource = self
        maincollectinview.delegate = self
        
        
        //カスタムセルの登録
        //xibファイルに取得
        let nib = UINib(nibName: "mainCollectionViewCell", bundle: Bundle.main)
        
        //取得したファイルの登録
        maincollectinview.register(nib, forCellWithReuseIdentifier: "mainCell")
        
    
            }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //udの保存領域を確保
        let ud = UserDefaults.standard
        
        
        
        
        //udに保存されている値があるなし場合分け
        if ud.array(forKey: "starArray") != nil{
            //udに保存されている値があったら
            //udを取り出す
            savestarArray = ud.array(forKey: "starArray") as! [Int]
            
            print(savestarArray)
            
            
        }else{
            //udに保存されている値がなかったら
            
            //配列を作る
            var newstarArray : [Int] = []
            
            //セルの数だけ０を入れる
            for _ in 0..<(self.menu.count){
                newstarArray.append(0)
            }
            
            ud.set(newstarArray,forKey: "starArray")
            
            newstarArray = savestarArray
            
            print(savestarArray)
            
            
            
        }//即時保存
        ud.synchronize()
        
        maincollectinview.reloadData()

    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //セルのサイズの自動固定
    //func collectionView(collectionView: UICollectionView, layout collectionViewLayout:
    //UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //let width: CGFloat = view.frame.width / 3 - 2
    //let height: CGFloat = width
    //return CGSize(width: width, height: height)
    //}
    
    
    //データの個数のメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    //データの内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //セルの取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! mainCollectionViewCell
        
        //表示内容を決める
        //cell.backgroundColor = UIColor(red: CGFloat(drand48()),green: CGFloat(drand48()),blue: CGFloat(drand48()),alpha: 1.0)
        
        cell.backgroundColor = UIColor(red: 0.4627, green: 0.6257, blue: 0.5647, alpha: 1.0)
        cell.mainLabel.font =  UIFont(name:"Hiragino Mincho ProN" ,size: 18)
        
        cell.mainLabel.text = menu [indexPath.row]
        
        if savestarArray[indexPath.row] == 1 {

            cell.mainimage.image = UIImage(named: "hakase.png")
            
            
        }
        
        //cellを返す
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //画面遷移
        self.performSegue(withIdentifier: "toquiz", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toquiz" {
            //画面取得
            let quizviewcontroller = segue.destination as! quizViewController
            
            //選択されているセルの取得
            let selectedIndexes = maincollectinview.indexPathsForSelectedItems!
            
            //値を取得して値渡し
            quizviewcontroller.selectedName = menu [(selectedIndexes.first?.row)!]
            
            quizviewcontroller.quizNumber = Int((selectedIndexes.first?.row)!)
            
            
        }
        
    }
}

/*
 func star(){
 //udの保存領域を確保
 let ud = UserDefaults.standard
 
 
 //udに保存されている値があるなし場合分け
 if ud.array(forKey: "starArray") != nil{
 //udに保存されている値があったら
 //udを取り出す
 var savestarArray: [Int] = []
 
 savestarArray = ud.array(forKey: "starArray") as! [Int]
 
 for i in 0..<savestarArray.count {
 if savestarArray[i] == 0 {
 cell.mainimage.image = UIImage(named: "")
 
 
 }else{
 cell.mainimage.image = UIImage(named: "")
 
 }
 
 
 }else{
 //udに保存されている値がなかったら
 //配列を作る
 var newstarArray : [Int] = []
 
 //セルの数だけ０を入れる
 for _ in 0..<(self.menu.count){
 newstarArray.append(0)
 }
 
 }//即時保存
 ud.synchronize()
 }
 
 }*/

    
