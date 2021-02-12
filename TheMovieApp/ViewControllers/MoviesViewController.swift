//
//  MoviesViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/11/21.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    var model:MovieVCModel = MovieVCModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Movies"
        loadMovies()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
    }
    
    private func loadMovies() {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.model.page = result!.page
                self.model.totalPages = result!.total_pages
                self.model.cellModels.append($0)
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            })
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellID, for: indexPath) as? MovieCell else { return UITableViewCell() }
        let cellModel = model.cellModels[indexPath.row]
        cell.setup(model: cellModel)
        return cell
    }
}
