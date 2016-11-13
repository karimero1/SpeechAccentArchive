//
//  Sample.swift
//  SpeechAccentArchive
//
//  Created by 鈴木　京理 on 2016/11/13.
//  Copyright © 2016年 鈴木　京理. All rights reserved.
//

import Foundation
import UIKit

struct IPADefn  {
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

struct TextTypeDefn {
    var fonts : [String] = [String]()
    var image : UIImage!
    
    mutating func addFont(font : String) {
        self.fonts.append(font)
    }
    
    mutating func setImage(image: UIImage) {
        self.image = image
    }
}

