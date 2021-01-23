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
            updateUI()
        }
    }
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .red
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
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
        return img
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(posterImage)
    }
    private func constrainUI() {
        posterImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        posterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        posterImage.layer.zPosition = 1
        
        titleLabel.bottomAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: -158).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 18).isActive = true
        titleLabel.layer.zPosition = 2
        
        overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 18).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20).isActive = true
    }
    
    private func updateUI() {
        titleLabel.text = viewModel.name
        overviewLabel.text = viewModel.overview
        posterImage.downloaded(from: viewModel.imgURL)
    }
}
