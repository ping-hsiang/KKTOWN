//
//  UIViewControllerExtension.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/21.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func ViewControllerStatus() -> UIView {
        
        let StatusView:UIView = UIView()
        StatusView.backgroundColor = KKTOWNColor
        StatusView.frame = CGRect(x: 0 , y: 0, width: WIDTH, height: 20)
        
        return StatusView
    }
    
    
    
}
