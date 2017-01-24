//
//  SegmentedControl.swift
//  KKTOWN
//
//  Created by eye on 2016/11/14.
//  Copyright © 2016年 KKTOWN. All rights reserved.
//

import UIKit

class SegmentedControl: UISegmentedControl {

    let underlineLayer = CALayer()
    
    override func draw(_ rect: CGRect) {

        self.frame = CGRect(x:0 ,y:0,width: WIDTH,height: 50)
        self.tintColor = UIColor.clear
        self.backgroundColor = UIColor(red: 255/255, green: 49/255, blue: 81/255, alpha: 1)
        self.addTarget(self, action: #selector(tapped(_:)), for: UIControlEvents.valueChanged)

        //字Color
        let attribute = [NSForegroundColorAttributeName:UIColor.black]
        self.setTitleTextAttributes(attribute, for: .normal)
        
        //底線
        underlineLayer.backgroundColor = KKTOWNColor.cgColor
        underlineLayer.frame = CGRect(x:(WIDTH/6)*1 ,y: 46,width: WIDTH/6 ,height: 4)
        self.layer.addSublayer(underlineLayer)
    }
    

    func tapped(_ SegmentedControl:UISegmentedControl){
        
        switch SegmentedControl.selectedSegmentIndex {
        case 0:
            underlineLayer.frame.origin.x = (WIDTH/6)*1
        default:
            underlineLayer.frame.origin.x = (WIDTH/6)*4
        }
    }

}
