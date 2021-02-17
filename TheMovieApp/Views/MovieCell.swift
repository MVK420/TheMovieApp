//
//  MovieCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/11/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let cellID = "movieCellId"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    var model:Movie!
    var viewModel:WatchableCellViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MovieCell.cellID)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.alpha = 1
    }
    
    func setup(model:Movie) {
        posterImageView.makeRoundCorners(byRadius: 1)
        self.model = model
        viewModel = WatchableCellViewModel(with: model)
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        if viewModel.imgURL.absoluteString == Strings.noImageError {
            posterImageView.backgroundColor = .red
        }
        else {
            posterImageView.downloaded(from: viewModel.imgURL)
        }
        ratingLabel.text = viewModel.rating
    }
}
