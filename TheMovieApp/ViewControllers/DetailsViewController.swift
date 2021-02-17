//
//  DetailsViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    private var viewModel: DetailViewModel!
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
        if viewModel.imgURL.absoluteString == Strings.noImageError {
            posterImageView.backgroundColor = .red
        } else {
            posterImageView.downloaded(from: viewModel.imgURL)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as? GenreCell else { return UICollectionViewCell() }
        cell.setupLabel(viewModel.genres[indexPath.row])
        return cell
    }
}
