//
//  SelectedImageViewController.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/11/13.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import UIKit

class SelectedImageViewController: UIViewController {
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var selectedIPA: UILabel!
    @IBOutlet weak var selectedIPAWord: UILabel!
    @IBOutlet weak var selectedWord: UILabel!
    
    var textType : TextType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedImage.image = textType.image
        selectedIPA.text = textType.fonts[0]
        selectedIPAWord.text = textType.fonts[1]
        selectedWord.text = textType.fonts[2]
        
        selectedIPA.adjustsFontSizeToFitWidth = true
        selectedIPAWord.adjustsFontSizeToFitWidth = true
        selectedWord.adjustsFontSizeToFitWidth = true
        
        selectedIPA.font = UIFont(name: "Didot", size: 50)
        selectedIPAWord.font = UIFont(name: "Didot", size: 50)
        selectedWord.font = UIFont(name: "Didot", size: 50)
        
        selectedIPA.minimumScaleFactor = 0.3
        selectedIPAWord.minimumScaleFactor = 0.3
        selectedWord.minimumScaleFactor = 0.3
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTextType(selectedTextType: TextType) {
        self.textType = selectedTextType
    }
    
}
