//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class HomeViewController: BaseViewController, Coordinating {
    
    var cellID = "MenuTableID"
    var coordinator: Coordinator?
    var viewModel: MovieViewModel? = MovieViewModel()
    let tableView:UITableView = {
        var tableview:UITableView = UITableView()
        tableview.register(WatchableCell.self,forCellReuseIdentifier: WatchableCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
        loadMovies()
        view.backgroundColor = .red
        
    }
    
    private func loadMovies() {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.viewModel?.movies.append($0)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.register(WatchableCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func constrainUI() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: WatchableCell.identifier,
                for: indexPath) as? WatchableCell
        else { return WatchableCell() }
        let model:Movie? = viewModel?.movies[indexPath.row]
        cell.configureCell(with: WatchableCellViewModel(with: model!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        coordinator?.eventHappened(of: .detailTapped, model: viewModel?.movies[indexPath.row])
    }
}
