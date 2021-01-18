//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class HomeViewController: BaseTableViewController<GenericMovieCell,WatchableCellViewModel>, Coordinating {
    
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    private func loadMovies() {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.items.append(WatchableCellViewModel(with: $0))
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GenericMovieCell
        cell.viewModel =  items[indexPath.row]
        cell.configureCell(with: cell.viewModel)
        return cell
    }
}
