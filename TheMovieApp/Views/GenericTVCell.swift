//
//  GenericTVCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class GenericTVCell:BaseWatchableCell<TV> {
    
    var viewModel:WatchableCellViewModel!
    override var model: TV! {
        didSet {
            configureCell(with: WatchableCellViewModel(with: model))
        }
    }
    
    func configureCell(with viewModel:WatchableCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.name
        posterImage.downloaded(from: viewModel.imgURL)
        overviewLabel.text = viewModel.overview
        ratingLabel.text = viewModel.rating
        starImage.image = UIImage(named:"Star 1")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
