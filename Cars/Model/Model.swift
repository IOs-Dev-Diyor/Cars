//
//  Model.swift
//  None
//
//  Created by Diyorbek Xikmatullayev on 07/11/23.
//

import Foundation


class Car: Codable {
    let image: String
    let title: String
    let start_production: Int?
    let `class`: String
    let desc: String?
    init(image: String, title: String, startProduction: Int?, carClass: String, desc: String?) {
            self.image = image
            self.title = title
            self.start_production = startProduction
        self.class = carClass
        self.desc = desc
        }
}

struct Const {
    static let isDark = "isDark1"
}
