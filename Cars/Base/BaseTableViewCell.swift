//
//  BaseTableViewCell.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        createSubViews()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
    }
    open func initSubViews(){ }
    open func addedSubViews(){ }
    open func setConstraints(){ }
}

