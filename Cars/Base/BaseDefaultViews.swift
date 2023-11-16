//
//  BaseDefaultViews.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit


extension UILabel {
    
    
    
    static func defaultView() -> UILabel {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 0
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.white.cgColor
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIButton {
    static func defaultView() -> UIButton {
        let view = UIButton()
        view.clipsToBounds = true
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 0
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.setTitleColor(.black, for: .normal)
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UITextField {
    static func defaultView() -> UITextField {
        let view = UITextField()
        view.textColor = .black
        view.clipsToBounds = true
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 0
        view.textAlignment = .center
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.white.cgColor
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UITextView {
    static func defaultView() -> UITextView {
        let view = UITextView()
        view.textColor = .black
        view.clipsToBounds = true
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 0
        view.textAlignment = .center
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.white.cgColor
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIImageView {
    static func defaultView() -> UIImageView {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 0
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIStackView {
    static func defaultView() -> UIStackView {
        let view = UIStackView()
        view.spacing = 20
        view.axis = .vertical
        view.alignment = .center
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.distribution = .equalSpacing
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UICollectionView {
    static func defaultView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 0, height: 0)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return view
    }
}

extension UITableView {
    static func defaultView() -> UITableView {
        let view = UITableView()
        view.backgroundColor = .clear
        view.separatorStyle = .none
        return view
    }
}
