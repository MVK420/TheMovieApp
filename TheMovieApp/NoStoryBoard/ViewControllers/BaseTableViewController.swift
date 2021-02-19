//
//  BaseTableViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class BaseTableViewController<T:BaseWatchableCell<U>,U>:BaseViewController,UITableViewDataSource, UITableViewDelegate,Coordinating {
    
    var coordinator: Coordinator?
    let cellID: String = "cellID"
    var items = [U]()
    var page: Int?
    var totalPages: Int?
    
    var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 149
        tableView.sectionHeaderHeight = 50
        tableView.backgroundColor = .white
        return tableView
    }()
    var searchBar: UISearchBar =  {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 150, height: 43)
        searchBar.placeholder = "Search"
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
        tableView.delegate = self
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.tableHeaderView = searchBar
    }
    
    private func constraintUI() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? BaseWatchableCell<U> else { return UITableViewCell() }
        let model: U? = items[indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.eventHappened(of: .detailTapped, model: items[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
