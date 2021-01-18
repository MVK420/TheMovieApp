//
//  BaseTableViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class BaseTableViewController<T:BaseWatchableCell<U>,U>:UIViewController,UITableViewDataSource{
    
    let cellID:String = "cellID"
    var items = [U]()
    //var viewModel:MovieViewModel?
    
    var tableView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellID)
        tableView.frame = view.bounds
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BaseWatchableCell<U>
        let model:U? = items[indexPath.row]
        //cell.viewModel =  WatchableCellViewModel(with: model! as! Movie) as? U
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}
