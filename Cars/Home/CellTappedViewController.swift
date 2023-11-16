//
//  CellTappedViewController.swift
//  Cars
//
//  Created by Diyorbek Xikmatullayev on 11/11/23.
//

import UIKit

class CellTappedViewController: BaseViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)

    let heartBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
//        button.setImage(UIImage(named: "like"), for: .normal)
        return button
    }()
    
    let descLabel: UILabel = {
        let label = PaddingLabel()
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.backgroundColor = .clear
        label.textColor = .black
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.font = UIFont(name: "HelveticaNeue-MediumItalic", size: 17)
        return label
    }()
    
    private let backImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        return image
    }()
    
    private let backLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .Rang.zodiaclight
        label.numberOfLines = 10
        label.textAlignment = .center
        label.font = UIFont(name: "MarkerFelt-Wide", size: 21)
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        return label
    }()
    
    var imageObj: String?
    var labelObj: String?
    var textObj: String?
    var descObj: String?
    
    override func initSubViews() {
        view.backgroundColor = .Rang.zodiacPurple
        backImage.image = UIImage(named: imageObj ?? "")
        backLabel.text = labelObj
        descLabel.text = descObj
    }
    override func addedSubViews() {
        view.addSubview(backImage)
        view.addSubview(backLabel)
        backImage.addSubview(heartBtn)
        view.addSubview(descLabel)
    }
    override func setConstraints() {
        backImage.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(backImage.snp.width)
        }
        backLabel.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(15)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
        heartBtn.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(backLabel.snp.bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            backLabel.textColor = .Rang.zodiaclight
            backImage.backgroundColor = .Rang.zodiacDark
            descLabel.textColor = UIColor.Rang.zodiaclight
        } else {
            view.backgroundColor = .Rang.zodiaclight
            backLabel.textColor = .Rang.darkBack
            backImage.backgroundColor = .Rang.lightBack
            descLabel.textColor = UIColor.Rang.darkBack
        }
    }
}
