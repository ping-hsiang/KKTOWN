//
//  AccountMyCollectionReusableView.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/24.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import SnapKit

class AccountMyCollectionReusableView: UICollectionReusableView {
    
    var View:UIView!
    var MyView:UIView!
    
    var BackButton:UIButton!
    var Image:UIImageView!
    var NameLabel:UILabel!
    var NumberLabel:UILabel!
    
    var EditButton:UIButton!
    var ShareButton:UIButton!
    
    var TimeLabel:UILabel!
    var LinkLabel:UILabel!

    
    //var EvaluationView:UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        View = UIView()
        View.frame = CGRect(x: 0, y: 0, width: WIDTH , height: 130)
        View.backgroundColor = UIColor.clear
        addSubview(View)
        
        MyView = UIView()
        MyView.backgroundColor = UIColor.white
        addSubview(MyView)
        // MARK: - Stash
        MyView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(View.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(402-130)
        }
        
        BackButton = UIButton()
        BackButton.setImage(UIImage(named:"ic_nav_back_blk"), for:.normal)
        addSubview(BackButton)
        // MARK: - Stash
        BackButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(40)
            make.left.equalTo(self.snp.left).offset(0)
            make.height.width.equalTo(44)
        }
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
