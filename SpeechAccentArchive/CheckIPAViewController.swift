//
//  CheckIPA.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/11/13.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import UIKit

struct IPA {
    var vowels : [TextType] = [TextType]()
    var consonants : [TextType] = [TextType]()
    
    mutating func addVowel(vowel : TextType) {
        self.vowels.append(vowel)
    }
    mutating func addConsonant(consonant : TextType) {
        self.consonants.append(consonant)
    }
    func getVowels() -> [TextType] {
        return self.vowels
    }
    
}

struct TextType {
    var fonts : [String]! = [String]()
    var image : UIImage!
    
    mutating func addFont(font : [String]) {
        self.fonts = font
    }
    mutating func setImage(image: UIImage) {
        self.image = image
    }
    mutating func getFonts() -> [String] {
        return self.fonts
    }
    
}


class CheckIPAViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    //Vowels
    var i: [String] = ["i", "/hid/", "heed"]
    let iImage = UIImage(named: "MRI0_i.jpg")
    var u: [String] = ["u", "/hud/", "who'd"]
    let uImage = UIImage(named: "MRI11_u.jpg")
    var ɪ: [String] = ["ɪ", "/hɪd/", "hid"]
    let ɪImage = UIImage(named: "MRI1_ɪ.jpg")

    var ipa: IPA = IPA()
    
    var iGroup: TextType = TextType()
    var uGroup: TextType = TextType()
    var ɪGroup: TextType = TextType()
    
    var selectedTextType : TextType?
    
    
//    var ʊ: String = "ʊ"
//    var beginning_of_eɪ: String = "beginning of eɪ"
//    var o: String = "o"
//    var ə_normally_exhaling: String = "ə  (normally exhaling)"
//    var ɛ: String = "ɛ"
//    var ʌ: String = "ʌ"
//    var æ: String = "æ"
//    var ɑ: String = "ɑ"
//    
//    //Consonants
//    var p: String = "p"
//    var t: String = "t"
//    var k: String = "k"
//    var m: String = "m"
//    var n: String = "n"
//    var ŋ: String = "ŋ"
//    var f: String = "f"
//    var v: String = "v"
//    var θ: String = "θ"
//    var ð: String = "ð"
//    var s_tip_up: String = "s(tip up)"
//    var z_tip_up: String = "z(tip up)"
//    var ʃ: String = "ʃ"
//    var ʒ: String = "ʒ"
//    var ɫ: String = "ɫ"
//    var tʃ: String = "tʃ"
//    var w: String = "w"
    
    
    
//    var iGroup: TextType = TextType()
//    var uGroup: TextType = TextType()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iGroup.addFont(i)
        iGroup.setImage(iImage!)
        uGroup.addFont(u)
        uGroup.setImage(uImage!)
        ɪGroup.addFont(ɪ)
        ɪGroup.setImage(ɪImage!)
        
        ipa.addVowel(iGroup)
        ipa.addVowel(uGroup)
        ipa.addVowel(ɪGroup)
        
        print("")
        
    }
    
    
    //データの個数を返すメソッド
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    //データを返すメソッド
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「vowelCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("vowelCell", forIndexPath: indexPath) as! VowelsColloctionViewCell
        
        //セルの縁を黒に設定する。
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 1.0
        
        //セルのラベルに指定したipaを中央揃いに設定する。
        cell.vowelLabel.text = ipa.vowels[indexPath.row].getFonts()[0]
        cell.vowelLabel.textAlignment = NSTextAlignment.Center
        
        return cell
        
    }
    
    
    
//    // Cell が選択された場合
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        // [indexPath.row] から画像名を探し、UImage を設定
//        selectedImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
//        if selectedImage != nil {
//            // SubViewController へ遷移するために Segue を呼び出す
//            performSegue(withIdentifier: "toSubViewController",sender: nil)
//        }
//        
//    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedTextType = self.ipa.vowels[indexPath.row]
        performSegueWithIdentifier("toSelectedImageViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siVC : SelectedImageViewController = segue.destinationViewController as! SelectedImageViewController
        siVC.setTextType(self.selectedTextType!)
    }
//
//    // Segue 準備
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        if (segue.identifier == "toSubViewController") {
//            let subVC: SubViewController = (segue.destination as? SubViewController)!
//            // SubViewController のselectedImgに選択された画像を設定する
//            subVC.selectedImg = selectedImage
//        }
//    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: NSIndexPath) -> CGSize {
//        let cellSize:CGFloat = self.view.frame.size.width/2-2
//        // 正方形で返すためにwidth,heightを同じにする
//        return CGSize(width: cellSize, height: cellSize)
//    }
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//    }

    
}