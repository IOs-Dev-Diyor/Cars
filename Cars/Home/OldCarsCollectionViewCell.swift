//
//  HomeCollectionViewCell.swift
//  None
//
//  Created by Diyorbek Xikmatullayev on 08/11/23.
//
import UIKit

class OldCarsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier = "HomeCollectionViewCell"
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    private let nameForView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple.withAlphaComponent(0.6)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let carImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
   let carName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "GillSans-UltraBold", size: 13)
        return label
    }()
    
     let startProduction: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.textColor = UIColor.black
        label.font = UIFont(name: "GillSans-UltraBold", size: 13)
        return label
    }()
    
    override func initSubViews() {
        self.backgroundColor = .clear
    }
    
    override func addedSubViews() {
        contentView.addSubview(carImage)
        contentView.addSubview(nameForView)
        nameForView.addSubview(carName)
        carImage.addSubview(startProduction)
        
    }
        
    override func setConstraints() {
        carImage.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.right.equalTo(-8)
            make.width.equalTo(195)
            make.bottom.equalTo(-1)
        }
        
        nameForView.snp.makeConstraints { make in
            make.left.equalTo(carImage.snp.left)
            make.right.equalTo(carImage.snp.right)
            make.height.equalTo(36)
            make.bottom.equalTo(0)
        }

        startProduction.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        carName.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(20)
            make.bottom.equalTo(-5)
        }
    }
    
    

    public func configure(model: Car) {
            carImage.image = UIImage(named: "\(model.image)")
            carName.text = "\(model.title)"
        startProduction.text = "\(model.start_production!)"
            
    }
    
}  
