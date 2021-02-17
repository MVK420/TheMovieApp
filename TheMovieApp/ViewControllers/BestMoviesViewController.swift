//
//  BestMoviesViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/17/21.
//

import UIKit

class BestMoviesViewController: BaseTableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Best Movies"
        loadMovies() { (finished:Bool) in
            if finished {
                DispatchQueue.main.async {
                    self.setupUI()
                }
            }
        }
    }

    private func loadMovies(completion: @escaping(Bool) -> Void) {
        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result:HomeFeed?,err:Error?) in
            result?.results.forEach({
                self.model.rxModels.add(element: $0)
            })
            completion(true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            guard let controller = segue.destination as? DetailsViewController else { return }
            controller.model = self.selectedItem
        }
    }
}
