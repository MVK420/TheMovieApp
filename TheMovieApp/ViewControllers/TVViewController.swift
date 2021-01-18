//
//  TVViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TVViewController: BaseTableViewController<GenericMovieCell,WatchableCellViewModel>, Coordinating {
    
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        loadMovies()
    }
    
    private func loadMovies() {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.items.append(WatchableCellViewModel(with: $0))
                DispatchQueue.main.async {
                    //self.tableView.reloadData()
                }
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

//class TVCell:BaseCell<Movie> {
//    override var viewModel: Movie! {
//        didSet {
//            
//        }
//    }
//}


