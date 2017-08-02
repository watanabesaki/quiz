//
//  worldViewController.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/23.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit

class worldViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var maincollectinview2 : UICollectionView!
    
    var menu2 : [String] = ["珍味",
                            "河川",
                            "山",
                            "食べ物",
                            "空港",
                            "世界遺産",
                            "瀑布",
                            "ダム",
                            "霊山",
                            "美林",
                            "三景",
                            "島",
                            "国",
                            "大陸",
                            "文化",
                            ]

    override func viewDidLoad() {
        super.viewDidLoad()

        //プロトコル宣言後
        maincollectinview2.dataSource = self
        maincollectinview2.delegate = self
        
        
        //カスタムセルの登録
        //xibファイルに取得
        let nib = UINib(nibName: "mainCollectionViewCell", bundle: Bundle.main)
        
        //取得したファイルの登録
        maincollectinview2.register(nib, forCellWithReuseIdentifier: "mainCell")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //データの個数のメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu2.count
    }
    
    //データの内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //セルの取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! mainCollectionViewCell
        
        //表示内容を決める
        
        cell.backgroundColor = UIColor(red: 0.4627, green: 0.6257, blue: 0.5647, alpha: 1.0)
        cell.mainLabel.font =  UIFont(name:"Hiragino Mincho ProN" ,size: 18)
        
        cell.mainLabel.text = menu2 [indexPath.row]
        
        //cellを返す
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //画面遷移
        self.performSegue(withIdentifier: "toquiz", sender: nil)
    }


    
}
