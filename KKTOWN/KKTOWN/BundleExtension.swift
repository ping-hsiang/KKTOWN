//
//  BundleExtension.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/19.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// 获取默认命名空间
    var namespace: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
