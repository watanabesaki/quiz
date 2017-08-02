//
//  PageViewController.swift
//  quiz
//
//  Created by 渡辺早紀 on 2017/07/23.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit




class PageViewController: UIPageViewController{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setviewcontrollerメソッドで初期画面に設定
        self.setViewControllers([getfirst()], direction: .forward, animated: true, completion: nil)

        //複数のviewcontrollerはdatasourceメソッドを使う
        self.dataSource = self
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //1画面目インスタンス化
    func getfirst() -> ViewController{
        //storyboardからviewcontrollerを読み込む
        return storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    }

    
    
    
    //2画面目インスタンス化
    func getSecond() -> worldViewController {
        return storyboard!.instantiateViewController(withIdentifier: "worldViewController") as! worldViewController
    }
}

    extension PageViewController :UIPageViewControllerDataSource{
        //ページ戻る　左へ
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if viewController.isKind(of: worldViewController.self) {
                //2->1
                return getfirst()
            }else{
                //2->end of load
                return nil
                
            }
            }
        
            //ページ進む　右へ
            func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
                
                if viewController.isKind(of: ViewController.self) {
                    //1->2
                    return getSecond()
                }else{
                    //1-> end　of load
                    return nil
                }
            }
            
        }

