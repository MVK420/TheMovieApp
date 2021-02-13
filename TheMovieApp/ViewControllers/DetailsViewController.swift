//
//  DetailsViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreStackView: UIStackView!
    
    var viewModel: DetailViewModel!
    var model:Movie! {
        didSet {
            viewModel = DetailViewModel(with: model)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup() {
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        statusLabel.text = viewModel.status
        languageLabel.text = viewModel.language
        popularityLabel.text = viewModel.popularity
        for genre in viewModel.genres {
            let label = createGenreLabel(genre)
            genreStackView.addArrangedSubview(label)
        }
        if viewModel.imgURL.absoluteString == Strings.noImageError {
            posterImageView.backgroundColor = .red
        } else {
            posterImageView.downloaded(from: viewModel.imgURL)
        }
    }
    
    private func createGenreLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.frame.size.width = 67
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
