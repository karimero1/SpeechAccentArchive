//
//  PracticeViewController.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/09/09.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import UIKit


// tableViewの1項目あたりの値たち(列挙型)
enum WordsContentsType: Int {
    // 各項目の英単語たちのイニシャル
    case PCS
    case AHTB
    case TTWH
    case FTS
    case SSO
    case FSP
    case FTSO
    case BC
    case AMAS
    case FHBB
    case WANA
    case SPS
    case AABTF
    case FTK
    case SCS
    case TTI
    case TRB
    case AWWG
    case MHW
    case ATTS
    case ALL
    
    // 各項目に[名前、単語の数、単語ごとの文字の数(大文字は2つ分)、単語、各単語の動画の再生位置]を返す関数
    func getWordsContents () -> WordsContents {
        switch self{
        case WordsContentsType.PCS:
            return WordsContents(name: "PCS", words: 3, character: [[7, 4, 8], [5, 5, 5]],
                                 sentence: [["Please", "call", "Stella."], ["plíːz", "kˈɔːl", "stélə"]],
                                 startPositions: [0, 0.65, 0.9], finishPosition: 1.55)
        case WordsContentsType.AHTB:
            return WordsContents(name: "AHTB", words: 4, character: [[4, 3, 2, 5], [4, 4, 3, 4]],
                                 sentence: [["Ask", "her", "to", "bring"], ["ˈæsk", "(h)ɚ", "toː", "bríŋ"]],
                                 startPositions: [1.55, 1.85, 1.95, 2], finishPosition: 2.35)
        case WordsContentsType.TTWH:
            return WordsContents(name: "TTWH", words: 4, character: [[5, 6, 4, 3], [4, 4, 3, 4]],
                                 sentence: [["these", "things", "with", "her"], ["ðíːz", "θɪŋz", "wìð", "(h)ɚ"]],
                                 startPositions: [2.35, 2.55, 2.8, 2.95], finishPosition: 3.1)
        case WordsContentsType.FTS:
            return WordsContents(name: "FTS", words: 3, character: [[4, 3, 6],[4, 2, 5]],
                                 sentence: [["from", "the", "store:"], ["frəm", "ðə", "stˈɔɚ"]],
                                 startPositions: [3.1, 3.25, 3.3], finishPosition: 3.8)
        case WordsContentsType.SSO:
            return WordsContents(name: "SSO", words: 3, character: [[4, 6, 2],[4, 5, 4]],
                                 sentence: [["Six", "spoons", "of"], ["síks", "spúnz", "(ə)v"]],
                                 startPositions: [3.8, 4.3, 4.75], finishPosition: 4.9)
        case WordsContentsType.FSP:
            return WordsContents(name: "FSP", words: 3, character: [[5, 4, 5], [4, 5, 3]],
                                 sentence: [["fresh", "snow", "peas,"], ["fréʃ", "snˈəʊ", "píz"]],
                                 startPositions: [4.9 ,5.15, 5.4], finishPosition: 5.9)
        case WordsContentsType.FTSO:
            return WordsContents(name: "FTSO", words: 4, character: [[4, 5, 5, 2], [4, 3, 5, 4]],
                                 sentence: [["five", "thick", "slabs", "of"],["fάɪv", "θík", "slǽbz", "(ə)v"]],
                                 startPositions: [5.9, 6.3, 6.55, 7.05], finishPosition: 7.15)
        case WordsContentsType.BC:
            return WordsContents(name: "BC", words: 2, character: [[4, 7], [4, 5]],
                                 sentence: [["blue", "cheese,"], ["blúː", "tʃíːz"]],
                                 startPositions: [7.15, 7.5], finishPosition: 7.95)
        case WordsContentsType.AMAS:
            return WordsContents(name: "AMAS", words: 4, character: [[3, 5, 1, 5], [5, 6, 1, 5]],
                                 sentence: [["and", "maybe", "a", "snack"], ["ən(d)", "ˈmeɪbi", "ə", "snˈæk"]],
                                 startPositions: [7.95, 8.15, 8.55, 8.65], finishPosition: 9.05)
        case WordsContentsType.FHBB:
            return WordsContents(name: "FHBB", words: 4, character: [[3, 3, 7, 5], [2, 4, 6, 3]],
                                 sentence: [["for", "her", "brother", "Bob."], ["fɚ", "(h)ɚ", "brˈʌðɚ", "bάb"]],
                                 startPositions: [9.05, 9.2, 9.35, 9.5], finishPosition: 10.2)
        case WordsContentsType.WANA:
            return WordsContents(name: "WANA", words: 4, character: [[3, 4, 4, 1], [3, 7, 4, 1]],
                                 sentence: [["We", "also", "need", "a"], ["wi;", "ˈɔːlsoʊ", "níːd", "ə"]],
                                 startPositions: [10.2, 10.8, 11.05, 11.2], finishPosition: 11.3)
        case WordsContentsType.SPS:
            return WordsContents(name: "SPS", words: 3, character: [[5, 7, 5], [6, 8, 5]],
                                 sentence: [["small", "plastic", "snake"], ["smˈɔːl", "plˈæstɪk", "snéɪk"]],
                                 startPositions: [11.3, 11.7, 12.2], finishPosition: 12.7)
        case WordsContentsType.AABTF:
            return WordsContents(name: "AABTF", words: 5, character: [[3, 1, 3, 3, 4], [5, 1, 3, 4, 4]],
                                 sentence: [["and", "a", "big", "toy", "frog"], ["ən(d)", "ə", "bíg", "tˈɔɪ", "frˈɔːg"]],
                                 startPositions: [12.7, 12.8, 12.9, 13.05, 13.35], finishPosition: 13.8)
        case WordsContentsType.FTK:
            return WordsContents(name: "FTK", words: 3, character: [[3, 3, 6], [2, 2, 4]],
                                 sentence: [["for", "the", "kids."], ["fɚ", "ðə", "kɪ́dz"]],
                                 startPositions: [13.8, 13.9, 14], finishPosition: 14.7)
        case WordsContentsType.SCS:
            return WordsContents(name: "SCS", words: 3, character: [[4, 3, 5], [3, 4, 5]],
                                 sentence: [["She", "can", "scoop"],["ʃi;", "k`æn", "skúːp"]],
                                 startPositions: [14.7, 15.25, 15.4], finishPosition: 15.8)
        case WordsContentsType.TTI:
            return WordsContents(name: "TTI", words: 3, character: [[5, 6, 4], [4, 4, 6]],
                                 sentence: [["these", "things", "into"], ["ðíːz", "θɪŋz", "ˈɪn.tu"]],
                                 startPositions: [15.8, 16, 16.35], finishPosition: 16.65)
        case WordsContentsType.TRB:
            return WordsContents(name: "TRB", words: 3, character: [[5, 3, 5], [4, 3, 4]],
                                 sentence: [["three", "red", "bags,"], ["θríː", "réd", "bæɡz"]],
                                 startPositions: [16.65, 16.9, 17.1], finishPosition: 17.7)
        case WordsContentsType.AWWG:
            return WordsContents(name: "AWWG", words: 4, character: [[3, 2, 4, 2], [5, 3, 3, 3]],
                                 sentence: [["and", "we", "will", "go"], ["ən(d)", "wi;", "wíl", "góʊ"]],
                                 startPositions: [17.7, 17.8, 17.9, 18.1], finishPosition: 18.35)
        case WordsContentsType.MHW:
            return WordsContents(name: "MHW", words: 3, character: [[4, 3, 10], [4, 4, 7]],
                                 sentence: [["meet", "her", "Wednesday"], ["míːt", "(h)ɚ", "wénzdèɪ"]],
                                 startPositions: [18.35, 18.45, 18.55], finishPosition: 19.1)
        case WordsContentsType.ATTS:
            return WordsContents(name: "ATTS", words: 4, character: [[2, 3, 5, 8], [3, 2, 5, 7]],
                                 sentence: [["at", "the", "train", "station."], ["ət;", "ðə", "treɪn", "stéɪʃən"]],
                                 startPositions: [19.1, 19.15, 19.2, 19.5], finishPosition: 21)
        case WordsContentsType.ALL:
            return WordsContents(name: "ALL", words: 1, character: [[9], [9]], sentence: [["All play"],["ˈɔːl pleɪ"]], startPositions: [0], finishPosition: 21)
//        default:
//            return WordsContents(name: "", words: 0, character: 0, startPositions: [])
        }
        
    }
}


// [名前、単語の数、単語ごとの文字の数(発音文字も含む)、単語(発音文字も含む)、各単語の動画の再生位置]を含む構造体
struct WordsContents {
    var name: String
    var words: Int
    var character: [[Int]]
    var sentence: [[String]]
    var startPositions: [Double]
    var finishPosition: Double

    init(name: String, words: Int, character: [[Int]], sentence: [[String]], startPositions: [Double], finishPosition: Double){
        self.name = name
        self.words = words
        self.character = character
        self.sentence = sentence
        self.startPositions = startPositions
        self.finishPosition = finishPosition
        
    }
}




class PracticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // TableView
    @IBOutlet weak var wordsTableView: UITableView!
    // 画面右上の変換ボタン
    @IBOutlet weak var convertButton: UIButton!
    
    // 英単語、その発音記号に変換するためのフラグ
    internal var wordFrag: Int = 0
    // TableViewの各項目の2次元配列(英単語とその発音記号)
    private let words: NSArray = [
        [
            // English
            "Please call Stella.",
            "Ask her to bring",
            "these things with her",
            "from the store:",
            "Six spoons of",
            "fresh snow peas,",
            "five thick slabs of",
            "blue cheese,",
            "and maybe a snack",
            "for her brother Bob.",
            "We also need a",
            "small plastic snake",
            "and a big toy frog",
            "for the kids.",
            "She can scoop",
            "these things into",
            "three red bags,",
            "and we wlii go",
            "meet her Wednesday",
            "at the train station",
            "ALL SENTENCES"
            ],
        [
            // IPA
            "plíːz kˈɔːl stélə",
            "ˈæsk (h)ɚ toː bríŋ",
            "ðíːz θɪŋz wìð (h)ɚ",
            "frəm ðə stˈɔɚ",
            "síks spúnz (ə)v",
            "fréʃ snˈəʊ píz",
            "fάɪv θík slǽbz (ə)v",
            "blúː tʃíːz",
            "ən(d) ˈmeɪbi ə snˈæk",
            "fɚ (h)ɚ brˈʌðɚ bάb",
            "wi; ˈɔːlsoʊ níːd ə",
            "smˈɔːl plˈæstɪk snéɪk",
            "ən(d) ə bíg tˈɔɪ frˈɔːg",
            "fɚ ðə kɪ́dz",
            "ʃi; k`æn skúːp",
            "ðíːz θɪŋz ˈɪn.tu",
            "θríː réd bæɡz",
            "ən(d) wi; wíl góʊ",
            "míːt (h)ɚ wénzdèɪ",
            "ət; ðə treɪn stéɪʃən",
            "ˈɔːl sɛ́ntənsəz"
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cell名の登録
        wordsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "WordsCell")
        // Delegateの設定
        wordsTableView.delegate = self
        // Datesourceの設定
        wordsTableView.dataSource = self
        // Viewに追加
        self.view.addSubview(wordsTableView)

        
        //単語変換ボタンが押された動作処理
        convertButton.addTarget(self, action: #selector(PracticeViewController.onClickWordsConvertButton), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    
    // Cellが選択された際に呼び出されるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 列挙型(WordsContentsType)のrawValue(WordsContentsTypeの順番を表す)をindexPath.row(選択されたCellの順番を表す)で設定し、
        // それで取り出された列挙型(WordsContentsType)をwctに代入する
        let wct: WordsContentsType = WordsContentsType(rawValue: indexPath.row)!
        
        // VideoViewContriller[UIViewController]を持ったvideoViewController[変数]を生成
        let videoViewController = VideoViewController()
        
        // VideoViewControllerと結びついているVideoViewControllew.swiftのクラスVideoViewControllewの中の関数setWordContentの使用
        // 引数はwct[WordContentsType]の関数getWordContents(返り値はWordsContents)
        // 
        // こうすることで
        // ここからVideoViewController.swiftのクラスVideoViewControllewの中のwordsContentに値が代入される。
        //
        videoViewController.setWordsContent(wct.getWordsContents())
        
        // 同様にwordFragの値をvideoViewControllerに渡す。
        videoViewController.setWordFrag(wordFrag)
        
        // ナビゲーションバー入りの画面遷移が行われる(アニメーションあり)
        self.navigationController?.pushViewController(videoViewController, animated: true)
    }
    
    
    // Cellの総数を返すデリゲートメソッド(実装必須)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words[wordFrag].count
    }
    
    // Cellに値を設定するデータソースメソッド(実装必須)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する
        let cell = tableView.dequeueReusableCellWithIdentifier("WordsCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.(この時、wordFragの値によって英語か発音記号か決定する)
        let currentWord = words.objectAtIndex(wordFrag).objectAtIndex(indexPath.row)
        
        // String型とみなしたcurrentWordtをCellの属性のtextLabelの属性のtextに格納する
        cell.textLabel?.text = currentWord as? String
        
        return cell
    }
    
    
    
    //変換ボタンの処理
    func onClickWordsConvertButton() {
//        print("Convert!!")
        
        // wordFrag=0の時英語、wordFrag=1の時発音記号
        if wordFrag == 0 {
            wordFrag = 1
        }
        else if (wordFrag == 1) {
            wordFrag = 0
        }
        
        // 変換が完了したのでTableViewをreloadする
        wordsTableView.reloadData()
        
    }
    
    
}