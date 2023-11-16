//
//  BaseCollectionViewCell.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//


import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
    }
    func initSubViews(){ }
    func addedSubViews(){ }
    func setConstraints(){ }
}

