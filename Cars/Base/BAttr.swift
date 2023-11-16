//
//  BaseAttributes.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

class BAttr {
   
    
    static func makeAtt(font: UIFont = UIFont.systemFont(ofSize: 14),color: UIColor = UIColor.black,shadowColor: UIColor = UIColor.black) -> [NSAttributedString.Key: Any]{
        
        let shadow = NSShadow()
        shadow.shadowColor = shadowColor
        shadow.shadowBlurRadius = 0.7
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        paragraphStyle.firstLineHeadIndent = 15.0
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color,
            .shadow: shadow,
            .paragraphStyle: paragraphStyle,
        ]
        return attributes
    }
   
    
}
