//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class HomeViewController: BaseTableViewController<GenericMovieCell,Movie> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        searchBar.delegate = self
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
    
    private func searchMovie() {
        if let searchText:String = searchBar.text {
            let escapedAddress = searchText.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
            let url:URL = URL(string: Strings.baseUrl + "search/movie?api_key=\(Strings.apiKey)&query=\(String(describing: escapedAddress))")!
            APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
                self.items = []
                result?.results.forEach({
                    self.items.append($0)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        }
    }
    
    private func loadandview() {
        let url:NSURL = NSURL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.apiCall(url: url) { (result, error) in
            print(result)
        
        }
    }
    
    private func searchandview() {
        if let searchText:String = searchBar.text {
            let escapedAddress = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let url:NSURL = NSURL(string: Strings.baseUrl + "search/movie?api_key=\(Strings.apiKey)&query=\(escapedAddress)")!
            APIService.sharedInstance.apiCall(url: url) { (result, error) in
                //print(result)
                var movies:[NSDictionary] = []
                movies = (result!["results"] as? [NSDictionary])!
                print(movies)
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GenericMovieCell
        cell.model = items[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMovie()
    }
}
