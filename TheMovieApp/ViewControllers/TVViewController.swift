//
//  TVViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TVViewController: BaseTableViewController<TVCell,Movie>, Coordinating {
    
    var coordinator: Coordinator?
    var viewModel: TVViewModel? = TVViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupUI()
        constrainUI()
        view.backgroundColor = .blue
        loadMovies()
    }
    
    private func loadMovies() {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.items.append($0)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }

    private func constrainUI() {
//        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

class TVCell:BaseCell<Movie> {
    override var model: Movie! {
        didSet {
            textLabel?.text = model.original_title
        }
    }
}


