//
//  AccountViewController.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/19.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import SnapKit

class AccountViewController: UIViewController {
    
    fileprivate var AccountView:UIView!
    fileprivate var AccountCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = KKTOWNColor
        
        // MARK: - AccountView
        AccountViewSettings()
        
        // MARK: - AccountCollectionView
        AccountCollectionViewSettings()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - AccountView
extension AccountViewController {
   
    func AccountViewSettings(){
        
        AccountView = UIView()
        AccountView.backgroundColor = KKTOWNColor
        view.addSubview(AccountView!)
        AccountView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.width.equalTo(WIDTH)
            make.height.equalTo(117)
            make.left.right.equalTo(0)
        }
        
        let AccountViewImage = UIImageView()
        AccountViewImage.contentMode = .scaleAspectFit
        AccountViewImage.image = UIImage(named: "ic_avatar")
        AccountViewImage.layer.borderColor = UIColor.black.cgColor
        AccountViewImage.layer.borderWidth = 3
        AccountViewImage.layer.masksToBounds = true
        AccountViewImage.layer.cornerRadius = 24
        AccountView?.addSubview(AccountViewImage)
        AccountViewImage.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(48)
            make.top.equalTo(AccountView).offset(12)
            make.centerX.equalTo(AccountView)
        }
        
        let AccountViewName = UILabel()
        AccountViewName.font = UIFont.boldSystemFont(ofSize: 16)
        AccountViewName.text = "歡迎!"
        AccountViewName.textAlignment = .center
        AccountView?.addSubview(AccountViewName)
        AccountViewName.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(AccountView)
            make.top.equalTo(AccountViewImage.snp.bottom).offset(4)
        }
        
        let AccountViewNumber = UILabel()
        AccountViewNumber.font = UIFont.boldSystemFont(ofSize: 14)
        AccountViewNumber.text = "登入 / 註冊"
        AccountViewNumber.textAlignment = .center
        AccountView?.addSubview(AccountViewNumber)
        AccountViewNumber.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(AccountView)
            make.top.equalTo(AccountViewName.snp.bottom).offset(8)
        }
        
        let AccountViewButton = UIButton()
        AccountViewButton.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        AccountView.addSubview(AccountViewButton)
        AccountViewButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(AccountViewNumber.snp.width)
            make.centerX.equalTo(AccountView)
            make.height.equalTo(100)
            make.top.equalTo(view).offset(20)
        }
    }
    
    func tapped(){
        print("touch")
    }
    
}

// MARK: - AccountCollectionView
extension AccountViewController {
    
    func AccountCollectionViewSettings(){
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (WIDTH/3), height: HEIGHT/6.3)
        
        AccountCollectionView = UICollectionView(frame: CGRect(x: 0.0, y:137.0, width:WIDTH, height:HEIGHT-137), collectionViewLayout: layout)
        AccountCollectionView.backgroundColor = UIColor.white
        AccountCollectionView.dataSource = self
        AccountCollectionView.delegate = self
        AccountCollectionView.register(AccountCollectionViewCell.self,forCellWithReuseIdentifier: "AccountCell")
        view.addSubview(AccountCollectionView)

    }
}

// MARK: - AccountCollectionViewDelegate
extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->  UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCollectionViewCell
        
        cell.titleImage.image = UIImage(named: "ic_account_\(indexPath.row+1)")
        cell.titleLabel.text = "個人檔案"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        
        navigationController?.pushViewController(Account_My_ViewController(), animated: true)
        
    }
    
}





