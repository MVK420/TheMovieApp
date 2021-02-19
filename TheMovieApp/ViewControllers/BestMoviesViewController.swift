//
//  BestMoviesViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/17/21.
//

import UIKit
import RxRelay

class BestMoviesViewController: BaseTableController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Best Movies"
        loadMovies { (finished:Bool) in
            if finished {
                DispatchQueue.main.async {
                    self.setupUI()
                }
            }
        }
    }

    private func loadMovies(completion: @escaping(Bool) -> Void) {
        let url: URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
        APIService.sharedInstance.loadData(with: url, for: HomeFeed.self) { (result: HomeFeed?,err: Error?) in
            var tempArray: [Movie] = [Movie]()
            result?.results.forEach({
                tempArray.append($0)
            })
            let sortedArray = tempArray.sorted {
                $0.vote_average! > $1.vote_average!
            }
            for movie in sortedArray[0...4] {
                self.model.rxModels.add(element: movie)
            }
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
