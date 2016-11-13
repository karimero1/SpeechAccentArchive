//
//  CustomButton.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/23.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // プライベートなメンバー
//    private var times: Double!
    
    var times: Double!
    var speed: Double!
    
//    // UIButtonのコンストラクタを上書きする
//    override init(frame: CGRect) {
//        // UIButtonのコンストラクタを呼んできている
//        super.init(frame: frame)
//    }
    
    init(frame: CGRect, times: Double, speed: Double) {
        super.init(frame: frame)
        self.times = times
        self.speed = speed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // プライベートなメンバーにアクセスするための関数
    // この場合
    // timesがprivateになっていた時、CustomButton.times = というふうに使うことができないから、
    // CustomButton.setTimes() など関数を用いてtimeを扱う。
    // public をつけるということは外部からアクセスする関数ということが予想できる。
//    public func setTimes(times: [Double]) {
//        self.times = times
//    }
//    
//    public func getTimes() -> [Double] {
//        return self.times
//    }
    
    
    func motionButtonCreate (name: String, color: UIColor){
        self.setTitle(name, forState: .Normal)
        self.setTitleColor(color, forState: .Normal)
        self.backgroundColor = UIColor.blackColor()
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.greenColor().CGColor
        self.layer.borderWidth = 1.5
        self.addTarget(VideoViewController(), action: #selector(VideoViewController.changeMotion(_:)), forControlEvents: .TouchUpInside)
    }
    
}
