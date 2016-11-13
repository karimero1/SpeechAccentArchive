//
//  HowToUseViewController.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/28.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import UIKit

class HowToUseViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControll: UIPageControl!
    let pageNum = 3
    let test = ["firstImage.jpg", "secondImage.jpg", "thirdImage.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.contentSize = CGSizeMake(self.view.bounds.width * CGFloat(pageNum), self.view.bounds.height)
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self;
        self.view.addSubview(self.scrollView)
        
        self.pageControll = UIPageControl(frame: CGRectMake(0, self.view.bounds.height-50, self.view.bounds.width, 50))
        self.pageControll.numberOfPages = pageNum
        self.pageControll.currentPage = 0
        self.view.addSubview(self.pageControll)
        
        
        for p in 0..<test.count {
            let v = UIImageView(frame: CGRectMake(self.view.bounds.width * CGFloat(p), self.view.bounds.height * 0.1, self.view.bounds.width, self.view.bounds.height * 0.9))
            let image = UIImage(named: test[p])
            v.image = image
            self.scrollView.addSubview(v)
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageProgress = Double(scrollView.contentOffset.x / scrollView.bounds.width)
        self.pageControll.currentPage = Int(round(pageProgress))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
