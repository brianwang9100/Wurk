//
//  GradientCore.swift
//  Wurk
//
//  Created by Brian Wang on 6/22/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit

struct Gradient {
    var topColorHexString:String
    var bottomColorHexString:String
    var topColor:UIColor {
        return UIColor.colorWithHexString(topColorHexString)
    }
    var bottomColor:UIColor {
        return UIColor.colorWithHexString(bottomColorHexString)
    }
    
    private static var popularGradients:[Gradient] = [
        Gradient(topColorHexString: "ff9a9e", bottomColorHexString: "fad0c4"),
        Gradient(topColorHexString: "a18cd1", bottomColorHexString: "fbc2eb"),
        Gradient(topColorHexString: "fad0c4", bottomColorHexString: "ffd1ff"),
        Gradient(topColorHexString: "ff9a9e", bottomColorHexString: "fecfef"),
        Gradient(topColorHexString: "f6d365", bottomColorHexString: "fda085"),
        Gradient(topColorHexString: "a1c4fd", bottomColorHexString: "c2e9fb"),
        Gradient(topColorHexString: "84fab0", bottomColorHexString: "8fd3f4"),
        Gradient(topColorHexString: "a6c0fe", bottomColorHexString: "f68084"),
        Gradient(topColorHexString: "f093fb", bottomColorHexString: "f5576c"),
        Gradient(topColorHexString: "4facfe", bottomColorHexString: "00f2fe"),
        Gradient(topColorHexString: "43e97b", bottomColorHexString: "38f9d7"),
        Gradient(topColorHexString: "fa709a", bottomColorHexString: "fee140"),
        Gradient(topColorHexString: "30cfd0", bottomColorHexString: "330867"),
        Gradient(topColorHexString: "a8edea", bottomColorHexString: "fed6e3"),
        Gradient(topColorHexString: "5ee7df", bottomColorHexString: "b490ca"),
        Gradient(topColorHexString: "667eea", bottomColorHexString: "764ba2"),
        Gradient(topColorHexString: "89f7fe", bottomColorHexString: "66a6ff"),
        Gradient(topColorHexString: "2af598", bottomColorHexString: "009efd"),
        Gradient(topColorHexString: "9890e3", bottomColorHexString: "b1f4cf"),
        Gradient(topColorHexString: "6a11cb", bottomColorHexString: "2575fc"),
        Gradient(topColorHexString: "37ecba", bottomColorHexString: "72afd3"),
        Gradient(topColorHexString: "c471f5", bottomColorHexString: "fa71cd"),
        Gradient(topColorHexString: "0250c5", bottomColorHexString: "d43f8d"),
        Gradient(topColorHexString: "7028e4", bottomColorHexString: "e5b2ca"),
        Gradient(topColorHexString: "13547a", bottomColorHexString: "80d0c7"),
        Gradient(topColorHexString: "ff0844", bottomColorHexString: "ffb199"),
        Gradient(topColorHexString: "434343", bottomColorHexString: "000000"),
        Gradient(topColorHexString: "ff758c", bottomColorHexString: "ff7eb3"),
        Gradient(topColorHexString: "f83600", bottomColorHexString: "f9d423"),
        Gradient(topColorHexString: "09203f", bottomColorHexString: "537895"),
        Gradient(topColorHexString: "c71d6f", bottomColorHexString: "d09693"),
        Gradient(topColorHexString: "874da2", bottomColorHexString: "c43a30"),
        Gradient(topColorHexString: "e8198b", bottomColorHexString: "c7eafd"),
        Gradient(topColorHexString: "64b3f4", bottomColorHexString: "c2e59c"),
        Gradient(topColorHexString: "00dbde", bottomColorHexString: "fc00ff"),
        Gradient(topColorHexString: "e14fad", bottomColorHexString: "f9d423")
    ]
    
    static func random() -> Gradient {
        return popularGradients[popularGradients.count.random()]
    }
}
