//
//  BaseUtilities.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

class Utilities {
    
    static func styleTextField(_ textField: UITextField, placeholder: String, icon: String) {
        let bottomLine = CALayer()
        let color = UIColor.systemPurple
        bottomLine.frame = CGRect(x: 0, y: textField.bounds.height-2, width: textField.bounds.width, height: 2)
        bottomLine.backgroundColor = color.cgColor //  UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        textField.backgroundColor = .clear
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color.withAlphaComponent(0.6)])
        textField.textColor = color
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.layer.addSublayer(bottomLine)
        
        textField.tintColor = color
        textField.setLeftIcon(icon)
    }
    
    static func styleFillerButton(_ button: UIButton) {
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple  //.systemBlue //  UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.tintColor = .white
    }
    static func styleHellowButton(_ button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemOrange.cgColor
        button.layer.cornerRadius = 25
        button.tintColor = .black
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.1)
    }
    static func styleGradientBorder (_ button: UIButton, masked: CACornerMask) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: button.frame.size)
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.red.cgColor, UIColor.systemOrange.cgColor, UIColor.systemYellow.cgColor, UIColor.red.cgColor, UIColor.systemOrange.cgColor]
        gradient.startPoint  = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

        let shape = CAShapeLayer()
        shape.lineWidth = 6
        shape.path = UIBezierPath(
            roundedRect: CGRect(origin: gradient.bounds.origin, size: gradient.bounds.size),
            cornerRadius: gradient.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        button.layer.addSublayer(gradient)
        button.layer.cornerRadius = button.bounds.height/2
        button.layer.maskedCorners = masked
        button.clipsToBounds = true
        button.tintColor = .black
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.2)
    }

    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
}


