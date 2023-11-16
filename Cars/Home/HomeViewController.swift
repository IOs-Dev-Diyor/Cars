//
//  RandomViewController.swift
//  None
//
//  Created by Diyorbek Xikmatullayev on 06/11/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let defaults = UserDefaults.standard
    lazy var isDark = defaults.bool(forKey: Const.isDark)
    var car = [Car]()
    var tableForArr = [Car]()

    var selArr = [String]()
    var myTitle = ""
    private var originalHeaderHeight: CGFloat = 0
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private let oldCarImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "oldcar")?.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    let headerView = UIView(frame: .zero)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Old Cars"
        label.font = UIFont(name: "PartyLetPlain", size: 32)
        return label
    }()
    
     var collectionView: UICollectionView!
   
    private let searchController = UISearchController(searchResultsController: nil)
   
    override func initSubViews() {
        title = "Cars"
        searchController.searchResultsUpdater = self
                searchController.searchBar.delegate = self // Set the delegate
                searchController.obscuresBackgroundDuringPresentation = false
                searchController.searchBar.placeholder = "Search by title"
                navigationItem.searchController = searchController
                definesPresentationContext = true
        
        if let searchController = navigationItem.searchController {
                    if let searchBar = searchController.searchBar.subviews.first?.subviews.compactMap({ $0 as? UITextField }).first {
                        searchBar.frame = CGRect(x: searchBar.frame.origin.x, y: searchBar.frame.origin.y, width: searchBar.frame.size.width, height: 100)
                    }
                }
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.backgroundColor = .white
        if #available(iOS 11, *) { tableView.contentInsetAdjustmentBehavior = .never }
        tableView.separatorStyle = .none
        tableView.tableHeaderView = headerView
        tableView.delegate = self
        tableView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/1.5)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        headerView.layer.borderWidth = 1
        collectionView.register(OldCarsCollectionViewCell.self, forCellWithReuseIdentifier: OldCarsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        parseJSON()
       
        collectionView.reloadData()
    }
    
    override func addedSubViews() {
        view.addSubview(tableView)
        tableView.addSubview(headerView)
        headerView.addSubview(collectionView)
        headerView.addSubview(oldCarImage)
        headerView.addSubview(titleLabel)

    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(tableView.snp.top)
            make.width.equalTo(tableView.snp.width)
            make.height.equalTo(view.frame.size.width/1.2)
            }
        headerView.superview?.layoutIfNeeded()
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(36)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        oldCarImage.snp.makeConstraints { make in
            make.top.equalTo(3)
            make.left.equalTo(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(oldCarImage.snp.right).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: Const.isDark) {
            view.backgroundColor = .Rang.darkBack
            tableView.backgroundColor = .Rang.darkBack
            collectionView.backgroundColor = .Rang.darkBack
            headerView.backgroundColor = .Rang.darkBack
            titleLabel.textColor = .Rang.zodiaclight
            oldCarImage.tintColor = .Rang.zodiacCyan
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.zodiaclight]
        } else {
            view.backgroundColor = .Rang.zodiaclight
            tableView.backgroundColor = .Rang.zodiaclight
            collectionView.backgroundColor = .Rang.zodiaclight
            headerView.backgroundColor = .Rang.zodiaclight
            titleLabel.textColor = .Rang.darkBack
            oldCarImage.tintColor = .Rang.zodiacDark
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Rang.darkBack]
        }
        selArr = defaults.array(forKey: "selArr") as? [String] ?? []
        tableView.reloadData()
    }
    
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "cars", ofType: "json") else { return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            car = try JSONDecoder().decode([Car].self, from: jsonData)
        } catch {
            print("error \(error)")
        }
                
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableForArr.append(contentsOf: car)
        return tableForArr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        
        let obj = tableForArr[indexPath.row]
        cell.configure(model: obj)
        
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
        vc.labelObj = tableForArr[indexPath.row].title
        vc.imageObj = tableForArr[indexPath.row].image
        vc.descObj = tableForArr[indexPath.row].desc
    
//        vc.heartBtn.tag = indexPath.row
//        vc.heartBtn.addTarget(CellTappedViewController.self, action: #selector(btnTapped), for: .touchUpInside)
//        if selArr.contains(tableForArr[indexPath.row].title) {
//            vc.heartBtn.setImage(UIImage(named: "likeTap"), for: .normal)
//        } else {
//            vc.heartBtn.setImage(UIImage(named: "like"), for: .normal)
//        }
        self.present(vc, animated: true)
    
     }
    
//    @objc func btnTapped(_ sender: UIButton){
//        let soupName = tableForArr[sender.tag].title
//        if selArr.contains(soupName) {
//            sender.setImage(UIImage(named: "like"), for: .normal)
//            selArr = selArr.filter { name in name != soupName }
//            if myTitle == "Selecteds" {
//                tableForArr.remove(at: sender.tag)
//            }
//        } else {
//            sender.setImage(UIImage(named: "likeTap"), for: .normal)
//            selArr.append(soupName)
//        }
//        defaults.set(selArr, forKey: "selArr")
//    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = min(7, car.count)
                return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OldCarsCollectionViewCell.identifier, for: indexPath) as! OldCarsCollectionViewCell
        let obj = car[indexPath.row]
        cell.configure(model: obj)
        if defaults.bool(forKey: Const.isDark) {
                cell.carName.textColor = .Rang.zodiaclight
                cell.startProduction.textColor = .Rang.zodiaclight
            } else {
                cell.carName.textColor = .Rang.darkBack
                cell.startProduction.textColor = .gray
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = CellTappedViewController()
        vc.labelObj = tableForArr[indexPath.row].title
        vc.imageObj = tableForArr[indexPath.row].image
        vc.descObj = tableForArr[indexPath.row].desc
        self.present(vc, animated: true)
   
    }
   
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text?.lowercased(), !searchTerm.isEmpty else {
            tableForArr = car
            tableView.reloadData()
            return
        }
        
        let searchResults = car.filter { $0.title.lowercased().contains(searchTerm) }
       
        tableForArr = searchResults
        tableView.reloadData()
       
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           print("Search button clicked with term: \(searchBar.text ?? "")")
        performSegue(withIdentifier: "QuizSegue", sender: self)
       }
}



