//
//  AccountSellingViewController.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/24.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import SnapKit

class AccountSellingViewController: UIViewController {

    fileprivate var Menu:SegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        Menu = SegmentedControl(items: ["未售出","交易中","已售出"])
        view.addSubview(Menu)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
