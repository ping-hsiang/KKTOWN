//
//  AccountCollectionViewCell.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/21.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import SnapKit

class AccountCollectionViewCell: UICollectionViewCell {
    
    var titleImage:UIImageView!
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = UIColor.white
        
        titleSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - titleImage
extension AccountCollectionViewCell {
    
    func titleSettings() {
        
        titleImage = UIImageView()
        titleImage.contentMode = .scaleAspectFit
        addSubview(titleImage)
        titleImage.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(36)
            make.center.equalTo(self)
        }

        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.textColor = UIColor.black
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.bottom.equalTo(snp.bottom).offset(-13)
            make.top.equalTo(titleImage.snp.bottom).offset(0)
        }
    }
}

