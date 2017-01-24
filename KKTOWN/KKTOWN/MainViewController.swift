//
//  MainViewController.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/19.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewControllers()
        delegate = self
        tabBar.barTintColor = UIColor.black
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - TabBarItem
extension MainViewController {
    
    /// 设置所有子控制器
    fileprivate func setupChildViewControllers() {
        
        let array = [
            [
                "clsName" : "HomeViewController",
                "title" : "首頁",
                "imageName" : "home"
            ],
            
            [
                "clsName" : "ExploreViewController",
                "title" : "搜尋",
                "imageName" : "explore"
            ],
            
            [
                "clsName" : "PhotoViewController",
                "title" : "上架",
                "imageName" : "photo"
            ],
            
            [
                "clsName" : "NoticeViewController",
                "title" : "通知",
                "imageName" : "notice"
            ],
            
            [
                "clsName" : "AccountViewController",
                "title" : "我的",
                "imageName" : "account"
            ]
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict as [String : AnyObject]))
        }
        viewControllers = arrayM
    }
    
    fileprivate func controller(dict: [String: AnyObject]) -> UIViewController {
        
        guard let clsName = dict["clsName"] as? String,
            let _ = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController()
        }
        
        let vc = cls.init()
        if let baseVc = vc as? PhotoViewController {
            baseVc.tabBarItem.tag = 1
        }
        vc.tabBarItem.image = UIImage(named: "ic_tab_a_" + imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "ic_tab_n_" + imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let nav = NavigationController(rootViewController: vc)
        return nav
    }
}

// MARK: - UITabBarControllerDelegate
extension MainViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == 1 {
            
            print("photoAdd")
            
            return false
        } else {
            return true
        }
    }
}
