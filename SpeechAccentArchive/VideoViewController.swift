//
//  VideoViewController.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/10.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//


import UIKit
import AVFoundation
import CoreMedia

class VideoViewController: UIViewController {
    
    // 再生動画
    var playerItem: AVPlayerItem!
    // AVPlayer.
    var videoPlayer: AVPlayer!

    // 「◯◯秒後」といった時間経過後に何かしらのアクションを組み込むための変数
    var timer: NSTimer = NSTimer()
    // 再生時間
    var playingTime: Double = 0
    // 動画の再生速度
    var movieSpeedRate: Double = 1.0
    
    // 選択されたセルの中身
    var wordsContent: WordsContents!
    // ワードフラグ
    var wordFrag: Int!
    // スローモーションボタンの作成
    var testButton3: [CustomButton]! = [CustomButton]()
    // 単語間の距離の生成
    var wordSpace: [Double] = [0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 動画のビューの作成のための準備
        // パスからassetを生成
        let path = NSBundle.mainBundle().pathForResource("teacher", ofType: "mov")
        let fileURL = NSURL(fileURLWithPath: path!)
        let avAsset = AVURLAsset(URL: fileURL, options: nil)
        
        // AVPlayerに再生させるアイテムを生成
        playerItem = AVPlayerItem(asset: avAsset)
        
        // AVPlayerを生成
        videoPlayer = AVPlayer(playerItem: playerItem)
        
        // Viewを生成
        let videoPlayerView = AVPlayerView(frame: self.view.bounds)
        
        // UIViewのレイヤーをAVPlaeyLayerにする
        let layer = videoPlayerView.layer as! AVPlayerLayer
        
        // プレイヤーの表示サイズを指定( 縦横とも収まるサイズ )
        layer.videoGravity = AVLayerVideoGravityResizeAspect
        
        // レイヤーのプレイヤーをvideoPlayerにする
        layer.player = videoPlayer
        
        // レイヤーを追加する
        self.view.layer.addSublayer(layer)
        
        
        // ビューの最大x座標y座標を取得
        let maxX = self.view.frame.width
        let maxY = self.view.frame.height
        
        self.view.backgroundColor = UIColor.whiteColor()
        
//        for m in 0..<3 {
//            let slowMotionButton = UIButton(frame: CGRect(x: maxX * 0.065 * CGFloat(m+1),
//                y: 0, width: maxY*0.085, height: maxY*0.085))
//            slowMotionButton.center.y = self.view.center.y + (maxY * 0.085)
//            slowMotionButton.backgroundColor = UIColor.blackColor()
////            slowMotionButton.
//            self.view.addSubview(slowMotionButton)
//        }
        
        let halfMotionButton = CustomButton(frame: CGRect(x: maxX * 0.065 * 1, y: 0, width: maxY*0.085, height: maxY*0.085), times: 0, speed: 0.5)
        halfMotionButton.center.y = self.view.center.y + maxY*0.09
        halfMotionButton.motionButtonCreate("x1/2", color: UIColor.greenColor())
        testButton3.append(halfMotionButton)
        
        let threeQuartersMotionButton = CustomButton(frame: CGRect(x: maxX * 0.065 * 4, y: 0, width: maxY*0.085, height: maxY*0.085), times: 0, speed: 0.75)
        threeQuartersMotionButton.center.y = self.view.center.y + maxY*0.09
        threeQuartersMotionButton.motionButtonCreate("x3/4", color: UIColor.greenColor()) 
        testButton3.append(threeQuartersMotionButton)
        
        let normalMotionButton = CustomButton(frame: CGRect(x: maxX * 0.065 * 7, y: 0, width: maxY*0.085, height: maxY*0.085), times: 0, speed: 1)
        normalMotionButton.center.y = self.view.center.y + maxY*0.09
        normalMotionButton.motionButtonCreate("x1", color: UIColor.orangeColor())
        testButton3.append(normalMotionButton)

        
        for m in 0..<3 {
            self.view.addSubview(testButton3[m])
        }
        
        
//        self.view.addSubview(testButton3[0])
//        self.view.addSubview(testButton3[1])
//        self.view.addSubview(testButton3[2])

        
        // 再生ボタンの作成
        for l in 0..<wordsContent.words {
            // 動画の再生位置の変数が受け入れられない謎のエラーの対処
//            let wordStartPosition = wordsContent.startPositions[l]
            let playWordButton =  CustomButton(frame: CGRect(x: maxX * 0.065 * CGFloat(l+1) + CGFloat(wordSpace.reduce(0, combine: {$0 + $1})),
                y: 0, width: CGFloat(Double(wordsContent.character[wordFrag][l])*12), height: maxY*0.085), times: wordsContent.startPositions[l], speed: 0)
            print(playWordButton.times)
            playWordButton.center.y = self.view.center.y
            playWordButton.layer.cornerRadius = 5
//            playWordButton.layer.borderColor = UIColor.blueColor().CGColor
            playWordButton.layer.borderColor = UIColor.whiteColor().CGColor

            playWordButton.layer.borderWidth = 1.5
            playWordButton.setTitle(wordsContent.sentence[wordFrag][l], forState: .Normal)
//            playWordButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            playWordButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)


            // ボタンを押した時
            // 第1引数に指定したオブジェクト( target )の、
            // 第2引数で指定した名前のメソッド( action )が、
            // 第3引数の条件( ControlEvent )で実行される
            playWordButton.addTarget(self, action: #selector(VideoViewController.onTest(_:)), forControlEvents: .TouchUpInside)
            self.view.addSubview(playWordButton)
            
            // 次の単語の場所の確保のために単語間の距離を測り、次単語のCGRectに使用
            wordSpace.append(Double(wordsContent.character[wordFrag][l])*11)
        }
    }
    
    
    // ViewController/viewWillDisappear/別の画面に遷移する直前
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // 動画の強制終了
        timer.invalidate()
        videoPlayer.pause()
        print("ViewController/viewWillDisappear/別の画面に遷移する直前")
    }
    
    
    
    
    // 再生ボタンが押された時の動作
    func onTest(sender: CustomButton){
        print(sender.times)
        if (timer.valid) {
            timer.invalidate()
        }
        playingTime = sender.times
        // scheduledTimerWithTimeInterval(ti: NSTimeInterval, target: AnyObject, selector: Selector, userInfo: AnyObject?, repeats: Bool)
        // メソッドを使用します。引数は5つあります。
        // ti・・・何秒後に実行するかの秒数を指定します。
        // target・・・ここに指定されたオブジェクトに対して、次のselectorのメッセージを送ります。
        // selector・・・targetに送るメッセージを指定します。
        // userInfo・・・タイマーに付加するユーザー情報を指定します。
        // repeats・・・繰り返し行うかどうかを指定します。trueは繰り返し行い、falseは1回きりです。
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01 * 1/movieSpeedRate, target: self, selector: #selector(VideoViewController.videoCount(_:)), userInfo: nil, repeats: true)
        
        // 任意のタイミングでタイマーに登録したターゲットのメソッドを呼ぶ
        timer.fire()
        
        // videoPlayerのスタート時間を設定する
        // toleranceBefore, toleranceAfterに関しては以下ページ参照
        // https://sites.google.com/site/rubymotionmemo/avfoundation/mediafairuno-xii-2---avplayeritem
        videoPlayer.seekToTime(CMTimeMakeWithSeconds(sender.times, Int32(NSEC_PER_SEC)), toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        videoPlayer.rate = Float(movieSpeedRate)
    }
    
    // 動画が再生された時の処理
    func videoCount(timer: NSTimer){
        var finishPoint: Double = wordsContent.finishPosition
        playingTime += 0.01
        
        // 再生時間と終了時間の少数第3位未満を切り捨てる処理
        playingTime *= 100
        finishPoint *= 100
        print("playingTime -> \(floor(playingTime)), finishPoint -> \(floor(finishPoint))")
        // 再生時間が終了時間になった時の処理
        if (floor(playingTime) == floor(finishPoint)) {
            print(playingTime)
            videoPlayer.pause()
            timer.invalidate()
            playingTime = 0
        }
        playingTime /= 100
        finishPoint /= 100
    }
    
    // 再生速度変更ボタンが押された時の処理
    func changeMotion(sender: CustomButton) {
        // はじめに全てのボタンをoff状態を示す色に設定
        for r in 0..<3{
        testButton3[r].setTitleColor(UIColor.greenColor(), forState: .Normal)
        }
        // その後押されたボタンのみon状態を示す色に設定
            movieSpeedRate = sender.speed
            sender.setTitleColor(UIColor.orangeColor(), forState: .Normal)
    }
    
    // WordsContentsを引数としてwordsContent[WordsContents]を受け取る
    func setWordsContent(wc: WordsContents) {
        self.wordsContent = wc
    }
    
    // wordFragを受け取る
    func setWordFrag(wf: Int) {
        self.wordFrag = wf
    }
   
    
}

