//
//  DetailsViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var model:Movie! {
        didSet {
            viewModel = DetailViewModel(with: model)
        }
    }
    var viewModel: DetailViewModel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()
    }
    private func setupUI() {
        //self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    func setup() {
        titleLabel.text = viewModel.name
        posterImageView.downloaded(from: viewModel.imgURL)
        overviewLabel.text = viewModel.overview
        statusLabel.text = viewModel.status
        languageLabel.text = viewModel.language
        popularityLabel.text = viewModel.popularity
    }
}
