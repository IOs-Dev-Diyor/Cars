//
//  BaseViewController.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    let refreshControl = UIRefreshControl()
    var baseNavItem: NavParam?
    var refreshAction: Refresh?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        createSubViews()
       
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

//  MARK: Set NavigationItem
extension BaseViewController {
    
    func setNav(_ navItem: NavParam  ) {
        baseNavItem = navItem
        let titleLabel = UILabel()
        let atributedTitle = NSAttributedString(string: navItem.title ?? "",attributes: [.foregroundColor: navItem.tintColor ?? .white, .font: navItem.font])
        titleLabel.attributedText = atributedTitle
        self.navigationItem.titleView = titleLabel
        
        let leftImage = UIImage(named: navItem.leftImg ?? "")?.withRenderingMode(.alwaysOriginal)
        let leftBarBtn = UIBarButtonItem(image: leftImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(leftClicked))
        leftBarBtn.tintColor = navItem.tintColor ?? .white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        let rightImage = UIImage(named: navItem.rightImg ?? "")?.withRenderingMode(.alwaysOriginal)
        let rightBarBtn = UIBarButtonItem(image: rightImage,
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightClicked))
        rightBarBtn.tintColor = navItem.tintColor ?? .white
        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    @objc func leftClicked(_ sender: UIButton) {
        _ = baseNavItem?.leftFunc()
    }
    @objc func rightClicked(_ sender: UIButton) {
        _ = baseNavItem?.rightFunc()
    }
}

//  MARK: Base Functions:
extension BaseViewController {

    func setRefreshControl(_ ref: Refresh) {
        refreshAction = ref
        refreshControl.attributedTitle = NSAttributedString(string: ref.title ?? "loading...", attributes: [.foregroundColor: ref.tintColor ?? .white])
        refreshControl.tintColor = ref.tintColor
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc func refresh(_ sender: UIRefreshControl) {
        _ = refreshAction?.function()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) {
            self.refreshControl.endRefreshing()
        }
    }
    func showAlert(_ title: String, _ message: String, _ actions: [AlertActions] ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for item in actions {
            alert.addAction(UIAlertAction(title: item.title, style: .default, handler: { action in
                print("Alert action used!",item.function())
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
}


