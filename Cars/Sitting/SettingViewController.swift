//
//  SettingViewController.swift
//  Cars
//
//  Created by Diyorbek Xikmatullayev on 10/11/23.
//
import UIKit
class SettingViewController: BaseViewController {
    
    
    var carArray = [Car]()
    
    private let aboutImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "abouts")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Rang.darkPink
        image.layer.cornerRadius = 20
        return image
    }()
    
    private let selctImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Rang.darkPink
        image.layer.cornerRadius = 8
        return image
    }()
    private let shareImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "share")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Rang.darkPink
        image.layer.cornerRadius = 8
        return image
    }()
    private let quitImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "quit")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Rang.darkPink
        image.layer.cornerRadius = 8
        return image
    }()
    private let modeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "mode")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Rang.darkBack
        image.layer.cornerRadius = 8
        return image
    }()
   
    private let aboutBtn: UIButton = {
        let button = GradientButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.setTitle("about", for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-BoldItalic", size: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.startColor = .blue
        button.endColor = .green
                return button
    }()
    private let shareBtn: UIButton = {
        let button = GradientButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.setTitle("share", for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-BoldItalic", size: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.startColor = .blue
        button.endColor = .green
    
                return button
    }()
    
    private let seachBtn: UIButton = {
        let button = GradientButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.setTitle("search", for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-BoldItalic", size: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.startColor = .blue
        button.endColor = .green
        return button
    }()
    
    private let quitBtn: UIButton = {
        let button = GradientButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.setTitle("quit", for: .normal)
        button.titleLabel?.font = UIFont(name: "Cochin-BoldItalic", size: 30)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.startColor = .yellow
        button.endColor = .orange
                return button
        return button
    }()
    
    private let switchView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.backgroundColor = .brown
        view.layer.cornerRadius = 12
                return view
    }()
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    private let themeSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()

    override func initSubViews() {
        super.initSubViews()
        title = "Setting"
        themeSwitch.addTarget(self, action: #selector(themeSwitchChanged(_:)), for: .valueChanged)
        seachBtn.addTarget(self, action: #selector(selectTappid), for: .touchUpInside)
        aboutBtn.addTarget(self, action: #selector(aboutTappid), for: .touchUpInside)
        shareBtn.addTarget(self, action: #selector(shareTappid), for: .touchUpInside)
        quitBtn.addTarget(self, action: #selector(quitTappid), for: .touchUpInside)
        
        
        view.addSubview(seachBtn)
        view.addSubview(aboutBtn)
        view.addSubview(shareBtn)
        view.addSubview(quitBtn)
        view.addSubview(switchView)
        switchView.addSubview(themeSwitch)
        aboutBtn.addSubview(aboutImage)
        seachBtn.addSubview(selctImage)
        shareBtn.addSubview(shareImage)
        quitBtn.addSubview(quitImage)
        switchView.addSubview(modeImage)
       
    }
    
    @objc func selectTappid() {
       let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
  
    @objc func aboutTappid() {
       let vc = AboutViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func shareTappid() {
        shareClicked()
    }
    @objc func quitTappid() {
        let alertController = UIAlertController(title: "QUIT", message: "ARE YOU SURE?", preferredStyle: .alert)
        let okAction1 = UIAlertAction(title: "OK", style: .default) { _ in
            self.quitClicked()
        }
        
        let okAction2 = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okAction1)
        alertController.addAction(okAction2)
        self.present(alertController, animated: true)
    }
    
    func shareClicked(){
            let vc = UIActivityViewController(activityItems: ["https://apps.apple.com"], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true, completion: nil)
        }
    
    func quitClicked(){
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                exit(EXIT_SUCCESS)
            })
        }
  
    override func setConstraints() {
        
        aboutImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        selctImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        shareImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        quitImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.bottom.equalTo(-5)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        modeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(8)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        themeSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
                }
        
        aboutBtn.snp.makeConstraints { make in
            make.top.equalTo(view.frame.size.height/3)
            make.left.equalTo(40)
            make.width.equalTo(view.frame.size.width/2 - 60)
            make.height.equalTo(aboutBtn.snp.width)
        }
      
        seachBtn.snp.makeConstraints { make in
            make.top.equalTo(view.frame.size.height/3)
//            make.left.equalTo(aboutBtn.snp.bottom).offset(10)
            make.right.equalTo(-40)
            make.width.equalTo(view.frame.size.width/2 - 60)
            make.height.equalTo(seachBtn.snp.width)
        }
      
        shareBtn.snp.makeConstraints { make in
            make.top.equalTo(aboutBtn.snp.bottom).offset(40)
            make.left.equalTo(40)
            make.width.equalTo(view.frame.size.width/2 - 60)
            make.height.equalTo(shareBtn.snp.width)
        }
        
        quitBtn.snp.makeConstraints { make in
            make.top.equalTo(aboutBtn.snp.bottom).offset(40)
            make.right.equalTo(-40)
            make.width.equalTo(view.frame.size.width/2 - 60)
            make.height.equalTo(quitBtn.snp.width)
        }
        
        switchView.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.left.equalTo(30)
            make.width.equalTo(130)
            make.height.equalTo(70)
        }
      
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.zodiaclight]
            themeSwitch.isOn = true
        } else {
            view.backgroundColor = .Rang.zodiaclight
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.darkBack]
            themeSwitch.isOn = false
        }
    }

    @objc private func themeSwitchChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: Const.isDark)
        if UserDefaults.standard.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            aboutBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            seachBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            shareBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
            quitBtn.setTitleColor(UIColor.Rang.zodiaclight, for: .normal)
           
        } else {
            view.backgroundColor = .Rang.zodiaclight
            aboutBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            seachBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            shareBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            quitBtn.setTitleColor(UIColor.Rang.darkBack, for: .normal)
            
            
        }
    }
}



class GradientButton: UIButton {

    var startColor: UIColor = .yellow
    var endColor: UIColor = .orange

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setupGradient()
        addShadow()
    }

    // MARK: - Gradient Setup

    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: - Shadow Setup

    private func addShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        updateShadowColor()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
        updateShadowPath()
    }

    private func updateGradientFrame() {
        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }

    private func updateShadowPath() {
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }

    // MARK: - Theme Change

    private func updateShadowColor() {
        if #available(iOS 13.0, *) {
            layer.shadowColor = UIColor.label.cgColor
        } else {
            layer.shadowColor = UIColor.black.cgColor
        }
    }
}
