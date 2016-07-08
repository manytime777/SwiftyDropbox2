//
//  ViewController.swift
//  p20160708
//
//  Created by 松岡泰史 on 2016/07/08.
//  Copyright © 2016年 松岡泰史. All rights reserved.
//

import UIKit
import SwiftyDropbox

//グローバル変数
var flag: Bool = true

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if let _ = Dropbox.authorizedClient {
            if (flag) {
                self.performSegueWithIdentifier("showInUDScreen", sender: self)
            }
        }
    }
    
    @IBAction func next(sender: AnyObject) {
        flag = true
        self.performSegueWithIdentifier("showInUDScreen", sender: self)
    }

    @IBAction func linkButtonPressed(sender: AnyObject) {
        if let _ = Dropbox.authorizedClient {
            //ログイン済
            return
        } else {
            //ログイン未だ
            Dropbox.authorizeFromController(self)
            flag = true
        }
    }
    
    @IBAction func signOutDropbox(sender: AnyObject) {
        if let _ = Dropbox.authorizedClient {
            Dropbox.unlinkClient() // 既にログイン済みだとクラッシュするのでログアウトする
        }
        Dropbox.authorizeFromController(self)
    }

}

