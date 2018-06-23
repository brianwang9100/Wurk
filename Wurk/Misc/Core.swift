//
//  Core.swift
//  Wurk
//
//  Created by Brian Wang on 6/20/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit
struct Core {
    static func setup() {
        appearranceSetup()
    }
    
    private static func appearranceSetup() {
//        for fontFamilyName in UIFont.familyNames{
//            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName){
//                print("Family: \(fontFamilyName)     Font: \(fontName)")
//            }
//        }
//        UILabel.appearance().substituteFontName = "AvenirNext-Regular"
    }
}


extension UILabel {
    
    // used to replace default font
    var substituteFontName : String {
        get { return self.font.fontName }
        set { self.font = UIFont(name: newValue, size: self.font?.pointSize ?? 20) }
    }
}
