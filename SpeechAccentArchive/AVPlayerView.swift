//
//  AVPlayerView.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/20.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import AVFoundation
import UIKit

// レイヤーをAVPlayerLayerにする為のラッパークラス.
// UIViewのclassを継承してAVPlayerViewを生成
class AVPlayerView : UIView{
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override class func layerClass() -> AnyClass{
        // AVPlayerLayerの型そのものだけを返す
        return AVPlayerLayer.self
    }
    
}
