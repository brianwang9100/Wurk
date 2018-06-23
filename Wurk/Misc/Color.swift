//
//  Color.swift
//  Wurk
//
//  Created by Brian Wang on 6/22/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorWithHexString(_ hexString: String, _ alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    static func intFromHexString(_ hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}


struct Color {
    static let wurkDarkestGray = UIColor.colorWithHexString("1E1E1E")
    static let wurkDarkerGray = UIColor.colorWithHexString("373737")
    static let wurkDarkGray = UIColor.colorWithHexString("555555")
    static let wurkGray = UIColor.colorWithHexString("CBC8CA")
    static let wurkLightGray = UIColor.colorWithHexString("DDDDDD")
    static let wurkLighterGray = UIColor.colorWithHexString("E3E4DB")
    static let wurkLightestGray = UIColor.colorWithHexString("F8FFF4")
    static let wurkNeonPink = UIColor.colorWithHexString("EC5B6E")
    static let wurkNeonYellow = UIColor.colorWithHexString("FED037")
    static let wurkNeonBlue = UIColor.colorWithHexString("1B98E0")
    static let wurkNeonGreen = UIColor.colorWithHexString("17D780")
    static let wurkNeonRed = UIColor.colorWithHexString("E03E3E")
    
    static let grayscaleColors = [wurkDarkestGray, wurkDarkerGray, wurkDarkGray, wurkGray, wurkLightGray, wurkLighterGray, wurkLightestGray]
    static let neonColors = [wurkNeonPink, wurkNeonYellow, wurkNeonBlue, wurkNeonGreen, wurkNeonRed]
}
