//
//  TableViewCell.swift
//  None
//
//  Created by Diyorbek Xikmatullayev on 08/11/23.
//

import UIKit

class HomeTableViewCell: BaseTableViewCell {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    static let identifier = "HomeTableViewCell"
    
    private let carImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        return image
    }()
    
  let selectButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.backgroundColor = .clear
        return button
    }()
    
     let carName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        return label
    }()
    
     let carClass: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "GillSans-UltraBold", size: 12)
        return label
    }()
    
    private let startProduction: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.font = UIFont(name: "", size: 20)
        return label
    }()
   
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity
        
        return view
    }()
    
    

    override func initSubViews() {
        
    }
    override func addedSubViews() {
        contentView.addSubview(backView)
        backView.addSubview(carImage)
        backView.addSubview(carName)
        backView.addSubview(carClass)
        backView.addSubview(selectButton)
        contentView.addSubview(startProduction)
    }
    override func setConstraints() {
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(Int(contentView.frame.size.width/2))
            make.bottom.equalTo(-10)
        }
        
        carImage.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.right.equalTo(-8)
            make.width.equalTo(200)
            make.bottom.equalTo(-8)
        }
        
        carName.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(10)
            make.right.equalTo(carImage.snp.left).offset(-8)
            make.height.equalTo(45)
        }
        
        carClass.snp.makeConstraints { make in
            make.top.equalTo(carName.snp.bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(carImage.snp.left).offset(-8)
            make.height.equalTo(50)
        }
        
        selectButton.snp.makeConstraints { make in
            make.top.equalTo(carClass.snp.bottom)
            make.left.equalTo(5)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        
        
    }
    
    public func configure(model: Car ) {
        carImage.image = UIImage(named: "\(model.image)")
        carName.text = "\(model.title)"
        carClass.text = "\(model.class)"
    }
    
    
}
