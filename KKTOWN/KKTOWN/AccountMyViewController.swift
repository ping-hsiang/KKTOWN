//
//  AccountMyViewController.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/21.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import SnapKit

class AccountMyViewController: UIViewController {

    fileprivate var CollectionView: UICollectionView!
    fileprivate var NavigationView:UIView!
    fileprivate var ImageView:UIImageView!
    fileprivate var ImageViewW:CGFloat!
    fileprivate var ImageViewH:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        
        ImageViewSettings()
        
        CollectionViewSetting()
        
        NavigationViewSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - ImageView/NavigationView Settings
extension AccountMyViewController {

    func NavigationViewSettings() -> Void {
        
        let navibarHeight:CGFloat = navigationController!.navigationBar.bounds.height
        let statusbarHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height
        NavigationView = UIView()
        NavigationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: navibarHeight + statusbarHeight)
        NavigationView.backgroundColor = KKTOWNColor
        NavigationView.alpha = 0.0
        view.addSubview(NavigationView)
    }
    
    func ImageViewSettings() -> Void {
        
        ImageView = UIImageView()
        ImageView.image = UIImage(named: "bg_profile_cover")
        ImageView.contentMode = .scaleAspectFill
        ImageView.frame = CGRect(x: 0, y: 0, width: WIDTH , height: 130)
        view.addSubview(ImageView)

        ImageViewW = ImageView.frame.width
        ImageViewH = ImageView.frame.height
    }
}

// MARK: - ScrollView
extension AccountMyViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollOffset:CGFloat = scrollView.contentOffset.y
        
        // MARK: - ImageView Update
        if scrollOffset < 0 {
            ImageView.frame = CGRect(x: scrollOffset, y: 0, width: ImageViewW - (scrollOffset * 2) , height: ImageViewH - scrollOffset)
        } else {
            ImageView.frame = CGRect(x: 0, y: 0, width: ImageViewW, height: ImageViewH)
        }
        
        // MARK: - Navigation Alpha Update
        if (scrollOffset > 50) {
            let alpha : CGFloat = min(CGFloat(1), CGFloat(1) - (CGFloat(50) + (NavigationView.frame.height) - scrollOffset) / (NavigationView.frame.height))
            NavigationView.alpha = CGFloat(alpha)
        } else {
            NavigationView.alpha = 0.0
        }
    }
}

// MARK: - CollectionViewSettings
extension AccountMyViewController {
    
    func CollectionViewSetting(){
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (WIDTH/2), height: HEIGHT/6.3)
        
        CollectionView = UICollectionView(frame: CGRect(x: 0.0, y: -20.0, width:WIDTH, height:HEIGHT+20), collectionViewLayout: layout)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.backgroundColor = UIColor.clear
        CollectionView.register(AccountMyCollectionViewCell.self,forCellWithReuseIdentifier: "Cell")
        CollectionView.register(AccountMyCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ReusableView")
        view.addSubview(CollectionView)
    }
}

// MARK: - CollectionViewDelegate
extension AccountMyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - MyCollectionReusableView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionReusableView, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: WIDTH, height: 402)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let HeaderCell = CollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ReusableView", for: indexPath) as! AccountMyCollectionReusableView
        
        HeaderCell.backgroundColor = UIColor.clear
        
        
//        HeaderCell.Image.layer.masksToBounds = true
//        HeaderCell.Image.layer.cornerRadius = 42
//        
//        HeaderCell.ShareButton.layer.borderColor = UIColor.gray.cgColor
//        HeaderCell.ShareButton.layer.borderWidth = 1
//        HeaderCell.ShareButton.layer.masksToBounds = true
//        HeaderCell.ShareButton.layer.cornerRadius = 3
//        HeaderCell.ShareButton.addTarget(self, action:#selector(ShareTapped), for:.touchUpInside)
//        
//        HeaderCell.EditButton.layer.borderColor = UIColor.gray.cgColor
//        HeaderCell.EditButton.layer.borderWidth = 1
//        HeaderCell.EditButton.layer.masksToBounds = true
//        HeaderCell.EditButton.layer.cornerRadius = 3
//        HeaderCell.EditButton.addTarget(self, action:#selector(EditTapped), for:.touchUpInside)
//        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(titleLabelClicked(tap:)))
//        HeaderCell.EvaluationView.addGestureRecognizer(tap)
//        //陰影
//        HeaderCell.EvaluationView.layer.shadowColor = UIColor.black.cgColor
//        HeaderCell.EvaluationView.layer.shadowOpacity = 40
//        HeaderCell.EvaluationView.layer.shadowRadius = 1
//        HeaderCell.EvaluationView.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
//        
        return HeaderCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->  UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AccountMyCollectionViewCell
        
        //
        
        return cell
    }
}
