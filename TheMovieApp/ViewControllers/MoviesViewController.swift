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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Movies"
        loadMovies()
        //movieTableView.delegate = nil
        //movieTableView.dataSource = nil
        RXSearch()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let indexPath = self.movieTableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailsViewController
                controller.model = model.cellModels[indexPath.row]
            }
        }
    }
    private func RXSearch() {
        searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({
                query in self.model.cellModels.filter({
                    movie in
                    print("query ",query)
                    if query.isEmpty {
                        let url:URL = URL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")!
                        print("HI")
                        let result = RxSwiftService.sharedInstance.loadData(with: url, for: HomeFeed.self)
                        print(result)
                    }
                    return query.isEmpty || movie.original_title!.lowercased().contains(query.lowercased())
                    
                })
            })
            .bind(to: self.movieTableView
                    .rx
                    .items(cellIdentifier: MovieCell.cellID, cellType: MovieCell.self)) {
                (tv,item,cell) in
                cell.setup(model: item)
            }
            .disposed(by: disposeBag)
        
        movieTableView.rx.modelSelected(Movie.self)
            .subscribe(onNext : {
                movie in
                self.performSegue(withIdentifier: "toDetailSegue", sender: self)
            })
    }
}

extension MoviesViewController {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return model.cellModels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellID, for: indexPath) as? MovieCell else { return UITableViewCell() }
//        let cellModel = model.cellModels[indexPath.row]
//        cell.setup(model: cellModel)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "toDetailSegue", sender: self)
//
//        //self.navigationController?.pushViewController(destinationVC, animated: true)
//    }
}
