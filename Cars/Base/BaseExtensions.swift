//
//  BaseExtensions.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

extension UIColor {
   
        convenience init(hexString: String) {
            let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt64()
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
    
}
extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    enum Rang {
        
        static let zodiacDark = UIColor.rgb(red: 2, green: 4, blue: 20)
        static let zodiaclight = UIColor.rgb(red: 218, green: 241, blue: 247)
        static let zodiacPurple = UIColor.rgb(red: 72, green: 58, blue: 88)
        static let zodiacRed = UIColor.rgb(red: 201, green: 93, blue: 99)
        
        static let zodiacGreen = UIColor.rgb(red: 152, green: 206, blue: 0)
        static let zodiacCyan = UIColor.rgb(red: 115, green: 210, blue: 222)
        static let zodiacYellow = UIColor.rgb(red: 255, green: 188, blue: 66)
        static let zodiacGray = UIColor.rgb(red: 108, green: 111, blue: 127)
        static let zodiacLink = UIColor.rgb(red: 223, green: 234, blue: 239)
        
        static let cyan = #colorLiteral(red: 2.248547389e-05, green: 0.7047000527, blue: 0.6947537661, alpha: 1)
        
        static let progressRed = UIColor.rgb(red: 251, green: 16, blue: 68)
        static let progressGreen = UIColor.rgb(red: 67, green: 213, blue: 82)
        static let progressPurple = UIColor.rgb(red: 70, green: 58, blue: 205)
        static let progressYellow = UIColor.rgb(red: 252, green: 196, blue: 9)
        static let progressBlue = UIColor.rgb(red: 10, green: 96, blue: 253)
        static let progressOrange = UIColor.rgb(red: 251, green: 128, blue: 7)
        static let progressGray = UIColor.rgb(red: 188, green: 186, blue: 194)
        static let bg = UIColor.rgb(red: 30, green: 34, blue: 35)
        static let logoRed = UIColor.rgb(red: 167, green: 16, blue: 35)
//        static let bg = UIColor.rgb(red: 30, green: 34, blue: 35)
        
        static let tabBackground = UIColor.rgb(red: 203, green: 190, blue: 176)
        static let navBackground = UIColor.rgb(red: 159, green: 150, blue: 171)
        
        static let darkPink = UIColor.rgb(red: 235, green: 71, blue: 83)
        static let lightPink = UIColor.rgb(red: 231, green: 111, blue: 120)
        
        static let darkBlue = UIColor.rgb(red: 36, green: 79, blue: 209)
        static let lightBlue = UIColor.rgb(red: 97, green: 139, blue: 244)
        
        static let darkYellow = UIColor.rgb(red: 206, green: 169, blue: 13)
        static let lightYellow = UIColor.rgb(red: 237, green: 217, blue: 105)
        
        static let darkGreen = UIColor.rgb(red: 24, green: 182, blue: 93)
        static let lightGreen = UIColor.rgb(red: 63, green: 236, blue: 148)
        
        static let darkBack = UIColor.rgb(red: 31, green: 31, blue: 36)
        static let lightBack = UIColor.rgb(red: 222, green: 225, blue: 232)
        
        static let lightRed = UIColor.rgb(red: 240, green: 0, blue: 31)
        
        static let backgroundGray = UIColor.rgb(red: 235, green: 235, blue: 242)
        static let borderColor = UIColor.rgb(red: 189, green: 189, blue: 189)
    }
}

extension UIView {
   func roundCorners(corners:CACornerMask, radius: CGFloat) {
      self.layer.cornerRadius = radius
      self.layer.maskedCorners = corners
   }
}

extension UIImage {
    static func resizeImage(named: String, h: CGFloat, w: CGFloat) -> UIImage {
        guard let image = UIImage(named: named) else { return UIImage() }
        let targetSize = CGSize(width: w, height: h)
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIImage {

func tintedWithLinearGradientColors(colorsArr: [CGColor]) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    guard let context = UIGraphicsGetCurrentContext() else {
        return UIImage()
    }
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1, y: -1)

    context.setBlendMode(.normal)
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)

    // Create gradient
    let colors = colorsArr as CFArray
    let space = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)

    // Apply gradient
    context.clip(to: rect, mask: self.cgImage!)
    context.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: self.size.height), options: .drawsAfterEndLocation)
    let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return gradientImage!
}
}


extension UIImage {

    func tint(_ tintColor: UIColor?) -> UIImage {
        guard let tintColor = tintColor else { return self }
        return modifiedImage { context, rect in
            context.setBlendMode(.multiply)
            context.clip(to: rect, mask: self.cgImage!)
            tintColor.setFill()
            context.fill(rect)
        }
    }

    private func modifiedImage( draw: (CGContext, CGRect) -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        draw(context, rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return newImage
    }
}

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}



extension UITextField {
    func setLeftIcon(_ imageName: String) {
       let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
       let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
    func setRightIcon(_ button: UIButton) {
        button.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
       let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
       iconContainerView.addSubview(button)
       rightView = iconContainerView
       rightViewMode = .always
    }
}


extension UIViewController {
//    func setTabItem(att: TabAt) {
//        let image = UIImage(named: att.img)?.tint(att.imgCol)
//        let selImage = UIImage(named: att.selImg)?.tint(att.selCol)
//        self.tabBarItem = UITabBarItem.init(title: att.title, image: image, selectedImage: selImage)
//    }
}

extension Locale {
    func isoCode(for countryName: String) -> String? {
        return Locale.isoRegionCodes.first(where: { (code) -> Bool in
            localizedString(forRegionCode: code)?.compare(countryName, options: [.caseInsensitive, .diacriticInsensitive]) == .orderedSame
        })
    }
}
extension String {
    func getFlagEmoji() -> String {
        var locales : String = "AG"
        for localeCode in NSLocale.isoCountryCodes {
            let identifier = Locale(identifier: localeCode)
            if let name = identifier.isoCode(for: self) {
                locales = name; break
            }
        }
        return locales.unicodeScalars.map({ 127397 + $0.value }).compactMap(UnicodeScalar.init).map(String.init).joined()
    }
    func getCountryCode() -> String {
        var locales : String = "AG"
        for localeCode in NSLocale.isoCountryCodes {
            let identifier = Locale(identifier: localeCode)
            if let name = identifier.isoCode(for: self) {
                locales = name; break
            }
        }
        return locales // .unicodeScalars.map({ 127397 + $0.value }).compactMap(UnicodeScalar.init).map(String.init).joined()
    }
}
