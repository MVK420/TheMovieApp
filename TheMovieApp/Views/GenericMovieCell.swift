//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class GenericMovieCell:BaseWatchableCell<Movie> {
    
    //override var viewModel:WatchableCellViewModel
    var viewModel:WatchableCellViewModel!
    override var model: Movie! {
        didSet {
            configureCell(with: WatchableCellViewModel(with: model))
        }
    }
    
    func configureCell(with viewModel:WatchableCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        posterImage.downloaded(from: viewModel.imgURL)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
