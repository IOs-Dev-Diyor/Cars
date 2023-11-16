//
//  MainTabBar.swift
//  None
//
//  Created by Diyorbek Xikmatullayev on 10/11/23.
//

import UIKit


class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        generateTabBar()
        setTabBarAppearance()

    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: UINavigationController(rootViewController: HomeViewController()), title: "Cars", image: UIImage(named: "car")),
            generateVC(viewController: UINavigationController(rootViewController: QuizViewController()), title: "Quiz", image: UIImage(named: "quiz")),
            generateVC(viewController: UINavigationController(rootViewController: SettingViewController()), title: "Setting", image: UIImage(named: "setting")),
           
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnY: CGFloat = 10
        let width = tabBar.bounds.width
        let height = tabBar.bounds.height + positionOnY*2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath( roundedRect: CGRect(x: 0,
                                                           y: tabBar.bounds.minY - positionOnY, width: width,
                                                           height: height + 25),
                                       cornerRadius: height/3)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width/5
        tabBar.itemPositioning = .fill
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .taBarItemAccent
        tabBar.unselectedItemTintColor = .tabBaritemLight
        
    }

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

extension UIColor {
    static var taBarItemAccent: UIColor { #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1) }
    static var mainWhite: UIColor { #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
    static var tabBaritemLight: UIColor { #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 0.5071399007) }
}
