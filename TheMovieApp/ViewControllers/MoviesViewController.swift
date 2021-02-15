//
//  MoviesViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/11/21.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    var model:MovieVCModel = MovieVCModel()
    let disposeBag = DisposeBag()
    var selectedItem:Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
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
    
    private func setupUI() {
        let _ = searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({
                query in self.model.rxModels.value.filter({ movie in
                    query.isEmpty || movie.original_title!.lowercased().contains(query.lowercased())
                })
            })
            .bind(to: self.movieTableView.rx.items(cellIdentifier: MovieCell.cellID, cellType: MovieCell.self)) {
                (tv,item,cell) in
                cell.setup(model: item)}
        movieTableView.rx.modelSelected(Movie.self)
            .subscribe(onNext: { [weak self] movie in
                self?.selectedItem = movie
                self?.performSegue(withIdentifier: "toDetailSegue", sender: self)
            }).disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            let controller = segue.destination as! DetailsViewController
            controller.model = self.selectedItem
        }
    }
    
}

