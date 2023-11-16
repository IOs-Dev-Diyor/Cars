//
//  TestViewController.swift
//  Planeta Festorum
//
//  Created by Shohzod Rajabov on 13/10/23.
//



import UIKit

class TestViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        if #available(iOS 15.0, *) { view.sectionHeaderTopPadding = 0 }
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.register(BaseTableViewCell.self, forCellReuseIdentifier: "BaseTableViewCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func initSubViews(){
        view.backgroundColor = .systemYellow
        setNav(NavParam(title: "My Title", tint: .white,
                               font: .systemFont(ofSize: 25, weight: .regular),
                               lImg: "", rImg: "",
                               lFunc: { self.menuClicked() },
                               rFunc: { print("right") }))
        
        setRefreshControl(Refresh("loading...", .white, {
            print("End refreshing!")
        }))
        
    }
    override func addedSubViews(){
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    override func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
    func setNavItems(){
        setNav(NavParam(title: "My Title", tint: .white,
                               font: .systemFont(ofSize: 25, weight: .regular),
                               lImg: "", rImg: "",
                               lFunc: { self.menuClicked() },
                               rFunc: { print("right") }))
//        setTabItem(title: "Options", img: "settings1", sImg: "settings")
    }
}

// MARK:  - Functions
extension TestViewController {
    
    func menuClicked(){
        
    }
}

// MARK:  - TableView Delegate
extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell") as! BaseTableViewCell
        cell.textLabel?.text = "\(indexPath.row) Cell"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}
