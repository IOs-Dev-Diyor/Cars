//
//  AboutViewController.swift
//  Cars
//
//  Created by Diyorbek Xikmatullayev on 10/11/23.
//

import UIKit

class AboutViewController: BaseViewController {

    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)

    private let aboutImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()

    private let aboutTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.layer.cornerRadius = 12
        label.font = UIFont(name: "SnellRoundhand-Black", size: 12)
        return label
    }()

    override func initSubViews() {
        
        title = "About"
        
        aboutImage.image = UIImage(named: "about")
        aboutTextLabel.text = """
 The "Mashinalar Flashcardi" app is a compact offline application designed specifically to help users learn and memorize various types of vehicles (mashinalar) in an interactive and fun way.
 This app features a collection of flashcards, each displaying an image and the name of a specific vehicle.
 Users can swipe through the flashcards to browse different vehicles or use a search feature to find a particular one.
 To aid in memorization and pronunciation, users can also listen to the audio pronunciation of each vehicle name.
 The app allows users to mark flashcards as favorites for quick access and revision.
 With an offline functionality, users can enjoy learning about vehicles anywhere without requiring an internet connection.
 The app's simple and user-friendly interface provides an intuitive learning experience for children and adults alike, fostering curiosity and expanding their knowledge about cars, trucks, motorcycles, and more.
 Whether you are a vehicle enthusiast or simply interested in expanding your vocabulary, the "Mashinalar Flashcardi" app offers a convenient and engaging way to learn and memorize the names of various vehicles in a unique offline environment.
"""
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didTapBack))
        self.navigationItem.leftBarButtonItem?.tintColor = .cyan
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

    override func addedSubViews() {
        view.addSubview(aboutImage)
        view.addSubview(aboutTextLabel)
    }

    override func setConstraints() {
        aboutImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.height.equalTo(aboutImage.snp.width)
        }

        aboutTextLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutImage.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            aboutTextLabel.textColor = .Rang.zodiaclight
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.zodiaclight]
        } else {
            view.backgroundColor = .Rang.zodiaclight
            aboutTextLabel.textColor = .Rang.darkBack
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        }
    }

}


