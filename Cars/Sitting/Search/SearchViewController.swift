//
//  SearchViewController.swift
//  Cars
//
//  Created by Diyorbek Xikmatullayev on 13/11/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    var allCarsArr = [Car]()
    lazy var resultArr = allCarsArr
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    
    let tableView = UITableView()
    
    let searchBar = UISearchBar()
    
    @objc func searchClicked(_ sender: UIBarButtonItem){
        
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchClicked))
        navigationItem.title = "Search"
        
        searchBar.delegate = self
//        searchBar.sizeToFit()
        searchBar.endEditing(true)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = " write cars name"
        searchBar.searchTextField.leftView?.tintColor = .black
        searchBar.showsCancelButton = true
        
        
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Search cars"
        navigationController?.navigationBar.barStyle = .default
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
        parseJSON()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(didTapBack))
        self.navigationItem.leftBarButtonItem?.tintColor = .cyan
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "cars", ofType: "json") else { return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            allCarsArr = try JSONDecoder().decode([Car].self, from: jsonData)
//            if let car = car {
//                print(car)
//            } else {
//                print("Not Fount")
//            }
        } catch {
            print("error \(error)")
        }
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.zodiaclight]
           
        } else {
            view.backgroundColor = .Rang.zodiaclight
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.darkBack]
            
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        resultArr = resultArr.filter({
            $0.title.range(of: searchText, options: .caseInsensitive) != nil
        })
        if resultArr.isEmpty && searchText.isEmpty { resultArr = allCarsArr }
        tableView.reloadData()
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchClicked))
        navigationItem.title = "Search"
        navigationItem.titleView = nil
        
        print("searchBarCancelButtonClicked")
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarResultsListButtonClicked")
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.configure(model: resultArr[indexPath.row])
        if defaults.bool(forKey: Const.isDark) {
                cell.carName.textColor = .Rang.zodiaclight
                cell.carClass.textColor = .Rang.zodiaclight
            } else {
                cell.carName.textColor = .Rang.darkBack
                cell.carClass.textColor = .Rang.darkBack
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = CellTappedViewController()
        vc.labelObj = resultArr[indexPath.row].title
        vc.imageObj = resultArr[indexPath.row].image
        vc.descObj = resultArr[indexPath.row].desc
//        vc.textObj = tableForArr[indexPath.row]
        self.present(vc, animated: true)
    
     }
    
}
