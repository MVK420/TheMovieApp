//
//  BaseTableViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class BaseTableViewController<T:BaseWatchableCell<U>,U>:BaseViewController,UITableViewDataSource{
    
    let cellID:String = "cellID"
    var items = [U]()
    //var viewModel:MovieViewModel?
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 149
        return tableView
    }()
    var searchBar:UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Search Movie"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constraintUI()
    }
    
    private func setupUI() {
        tableView.register(T.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(tableView)
        //navigationController?.title = "Movie"
    }
    
    private func constraintUI() {
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.topAnchor,constant: 90).isActive = true

        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: -0).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BaseWatchableCell<U>
        let model:U? = items[indexPath.row]
        cell.viewModel =  WatchableCellViewModel(with: model! as! Movie) as? U
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let contentOffset = scrollView.contentOffset.y
            print("contentOffset: ", contentOffset)


            
    }
    
}
