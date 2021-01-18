//
//  TVViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TVViewController: BaseTableViewController<GenericTVCell,WatchableCellViewModel>, Coordinating {
    
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadShows()
    }
    
    private func loadShows() {
        let url = URL(string: Strings.baseUrl + "tv/top_rated?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: TVFeed.self) { (result:TVFeed?,err:Error?) in
            result?.results.forEach({
                self.items.append(WatchableCellViewModel(with: $0))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }

    }
    
    func apiCall(url:NSURL, completionHandler: @escaping (NSDictionary?, NSError?) -> Void) -> URLSessionTask {
        
        var finalData: NSDictionary!
        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
            if error != nil{
                completionHandler(nil, error as NSError?)
                return
            } else {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!) as? NSDictionary {
                        //print(json)
                        finalData = json as NSDictionary
                        completionHandler(finalData, nil)
                        return
                    }
                } catch {
                    print("EMPTY")
                    return
                }
            }
        }
        task.resume()
        return task
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GenericTVCell
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


