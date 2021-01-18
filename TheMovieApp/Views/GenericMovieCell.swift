//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class GenericMovieCell:BaseWatchableCell<WatchableCellViewModel> {
    
    override var viewModel: WatchableCellViewModel! {
        didSet {
            //configureCell(with: viewModel)
        }
    }
    
    func configureCell(with viewModel:WatchableCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        posterImage.downloaded(from: viewModel.imgURL)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
