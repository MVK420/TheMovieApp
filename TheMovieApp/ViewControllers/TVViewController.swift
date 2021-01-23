//
//  TVViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TVViewController: BaseTableViewController<GenericTVCell,TV> {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadShows()
    }
    
    private func loadShows() {
        let url = URL(string: Strings.baseUrl + "tv/top_rated?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: TVFeed.self) { (result:TVFeed?,err:Error?) in
            result?.results.forEach({
                self.items.append($0)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GenericTVCell
        cell.model = items[indexPath.row]
        return cell
    }
}
