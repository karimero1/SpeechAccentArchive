//
//  ViewController.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/07.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

// 実機でビルドする時に発生する警告(The provision profile...)の理由↓
// https://teratail.com/questions/47666

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションを透明にする処理
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
}

