//
//  BaseModels.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

class AlertActions {
    var title: String?
    var style: UIAlertAction.Style
    var function: () -> Any
    init (_ t: String, _ f: @escaping () -> (), _ s: UIAlertAction.Style = .default) {
        self.title = t
        self.function = f
        self.style = s
    }
}

class Refresh {
    var title: String?
    var tintColor: UIColor?
    var function: () -> Any
    init (_ t: String, _ tc: UIColor, _ f: @escaping () -> ()) {
        self.tintColor = tc
        self.function = f
    }
}

class NavParam {
    var title: String?
    var tintColor: UIColor?
    var font: UIFont
    var leftImg: String?
    var rightImg: String?
    var leftFunc: () -> Any
    var rightFunc: () -> Any
    
    init (title: String, tint: UIColor, font: UIFont, lImg: String, rImg: String,  lFunc: @escaping () -> (), rFunc: @escaping () -> ()) {
        self.title = title
        self.tintColor = tint
        self.font = font
        self.leftImg = lImg
        self.rightImg = rImg
        self.leftFunc = lFunc
        self.rightFunc = rFunc
    }
}
