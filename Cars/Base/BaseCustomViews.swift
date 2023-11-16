//
//  BaseCustomViews.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

class PaddingLabel: UILabel {
    var insets = UIEdgeInsets.zero
    
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}




class ScaledHeightImageView: UIImageView {

    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width
 
            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }

        return CGSize(width: -1.0, height: -1.0)
    }

}

class CLabel: BaseView {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        return view
    }()
    
    override func initSubViews() {
        
    }
    override func addedSubViews() {
        addSubview(label)
    }
    override func setConstraints() {
        label.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
}
class CButton: BaseView {
    
    lazy var button: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        return view
    }()
    
    override func initSubViews() {
        
    }
    override func addedSubViews() {
        addSubview(button)
    }
    override func setConstraints() {
        button.snp.makeConstraints { make in
            make.top.left.equalTo(5)
            make.right.bottom.equalTo(-5)
        }
    }
    
}
