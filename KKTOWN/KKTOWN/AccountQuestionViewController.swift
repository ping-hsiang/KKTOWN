//
//  AccountQuestionViewController.swift
//  KKTOWN
//
//  Created by HSU PING HSIANG on 2017/1/24.
//  Copyright © 2017年 KKTOWN. All rights reserved.
//

import UIKit
import WebKit

class AccountQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHLoadingHUD.show(Name: "SmallHead_")

        let webview = WKWebView(frame: view.frame)
        let url = URL(string: "https://support.kktown.com.tw/hc/zh-tw")
        webview.uiDelegate = self
        webview.navigationDelegate = self
        webview.load(URLRequest(url: url!))
        view.addSubview(webview)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AccountQuestionViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        PHLoadingHUD.hide()
    }
}


//返回         self.navigationController!.popViewController(animated: true)
