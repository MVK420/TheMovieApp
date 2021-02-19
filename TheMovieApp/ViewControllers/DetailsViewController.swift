//
//  DetailsViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit

enum ButtonState:String {
    case seeMore = "See More"
    case seeLess = "See Less"
}

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var seeMoreButton: UIButton!
    private var viewModel: DetailViewModel!
    private var seeMoreButtonState: Bool = false
    var model:Movie! {
        didSet {
            viewModel = DetailViewModel(with: model)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
    }
    
    func setup() {
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        statusLabel.text = viewModel.status
        languageLabel.text = viewModel.language
        popularityLabel.text = viewModel.popularity
        ratingLabel.text = viewModel.rating
        if viewModel.imgURL.absoluteString == Strings.noImageError {
            posterImageView.backgroundColor = .red
        } else {
            posterImageView.downloaded(from: viewModel.imgURL)
        }
        seeMoreButton.isHidden = !overviewLabel.isTruncatedOrNot()
    }
    
    @IBAction func didTapSeeMoreButton(_ sender: Any) {
        if seeMoreButtonState == false {
            seeMoreButton.setTitle(ButtonState.seeLess.rawValue, for: .normal)
        }
        else {
            seeMoreButton.setTitle(ButtonState.seeMore.rawValue, for: .normal)
        }
        seeMoreButtonState.toggle()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.cellID, for: indexPath) as? GenreCell else { return UICollectionViewCell() }
        cell.setupLabel(viewModel.genres[indexPath.row])
        return cell
    }
}
