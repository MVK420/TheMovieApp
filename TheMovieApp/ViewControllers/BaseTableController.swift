//
//  BaseTableController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/17/21.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class BaseTableController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var searchController: UISearchController!
    var model: MovieVCModel = MovieVCModel()
    private let disposeBag = DisposeBag()
    var selectedItem: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Transparent nav bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        setupSearchController()
        setupKeyboard()
    }
    
    private func setupKeyboard() {
        // let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        // view.addGestureRecognizer(tap)
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func setupUI() {
        _ = searchController.searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map({query in self.model.rxModels.value.filter({ movie in
                    query.isEmpty || movie.original_title!.lowercased().contains(query.lowercased())
                })
            })
            .bind(to: self.tableView.rx.items(cellIdentifier: MovieCell.cellID, cellType: MovieCell.self)) {(tv,item,cell) in
                cell.setup(model: item)}
        tableView.rx.modelSelected(Movie.self)
            .subscribe(onNext: { [weak self] movie in
                self?.selectedItem = movie
                self?.performSegue(withIdentifier: "toDetailSegue", sender: self)
                // Deselect row
                if let selectedRowIndexPath = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
            }).disposed(by: disposeBag)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

/*
 A billentyuzetet kereses utan nem tudom eltuntetni

 a reszletes oldalon szoveg ha tul hosszu, nem fer ki, kene egy "see more" gomb
 */
