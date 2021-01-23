//
//  DetailViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/23/21.
//

import UIKit

class DetailViewController<U>: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    var viewModel: DetailViewModel!
    var model:U! {
        didSet {
            if let model = model as? Movie {
                viewModel = DetailViewModel(with: model)
            }
            if let model = model as? TV {
                viewModel = DetailViewModel(with: model)
            }
        }
    }
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        return label
    }()
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.zPosition = 1
        return img
    }()
    let genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let ratingLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .yellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 2
        return label
    }()
    let starImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named:"Star 1")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.zPosition = 2
        return img
    }()
    var popularityStackView:UIStackView!
    var languageStackView:UIStackView!
    var statusStackView:UIStackView!
    var statusLabel: UILabel!
    var popularityLabel: UILabel!
    var languageLabel:UILabel!
    var statusTitleLabel:UILabel!
    var popularityTitleLabel:UILabel!
    var languageTitleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
        updateUI()
    }
    
    private func createTitleLabel(_ text:String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        return label
    }
    
    private func createStackView(_ stackTitle:UILabel, _ stackValue:UILabel) -> UIStackView {
        let stackView:UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(stackTitle)
        stackView.addArrangedSubview(stackValue)
        return stackView
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private func setupUI(){
        statusTitleLabel = createTitleLabel("Status")
        popularityTitleLabel = createTitleLabel("Popularity")
        languageTitleLabel = createTitleLabel("Language")
        statusLabel = createLabel()
        popularityLabel = createLabel()
        languageLabel = createLabel()
        statusStackView = createStackView(statusTitleLabel, statusLabel)
        popularityStackView = createStackView(popularityTitleLabel, popularityLabel)
        languageStackView = createStackView(languageTitleLabel, languageLabel)
        for genre in viewModel.genres {
            let label = createGenreLabel(genre)
            genreStackView.addArrangedSubview(label)
        }
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(posterImage)
        view.addSubview(starImage)
        view.addSubview(ratingLabel)
        view.addSubview(statusStackView)
        view.addSubview(popularityStackView)
        view.addSubview(languageStackView)
        view.addSubview(genreStackView)
    }
    
    private func constrainUI() {
        posterImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        posterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 128).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 18).isActive = true
        
        starImage.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        starImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 7).isActive = true
        
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 18).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20).isActive = true
        
        statusStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21).isActive = true
        statusStackView.bottomAnchor.constraint(equalTo: popularityStackView.bottomAnchor).isActive = true
        
        popularityStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popularityStackView.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor, constant: -33).isActive = true

        languageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21).isActive = true
        languageStackView.bottomAnchor.constraint(equalTo: popularityStackView.bottomAnchor).isActive = true
        
        genreStackView.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor, constant: -8).isActive = true
        genreStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        genreStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        posterImage.downloaded(from: viewModel.imgURL)
        statusLabel.text = viewModel.status
        popularityLabel.text = viewModel.popularity
        languageLabel.text = viewModel.language
        ratingLabel.text = viewModel.rating
    }
}
