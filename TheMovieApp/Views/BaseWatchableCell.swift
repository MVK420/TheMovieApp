//
//  BaseCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class BaseWatchableCell<U>:UITableViewCell {
    
    var model: U?
    //var viewModel: U?
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 14)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let posterImage: UIImageView = {
        let img = UIImageView()
        img.layer.zPosition = 1
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let ratingLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .yellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let starImage: UIImageView = {
        let img = UIImageView()
        img.layer.zPosition = 2
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(posterImage)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(starImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.leadingAnchor.constraint(equalTo:posterImage.trailingAnchor,constant: 7.86).isActive = true
        titleLabel.topAnchor.constraint(equalTo:posterImage.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor,constant: -50).isActive = true
        
        overviewLabel.leadingAnchor.constraint(equalTo:posterImage.trailingAnchor).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo:contentView.bottomAnchor,constant: -8).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo:contentView.trailingAnchor,constant: -33).isActive = true
        overviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 93).isActive = true

        posterImage.topAnchor.constraint(equalTo:contentView.topAnchor,constant: 8).isActive = true
        posterImage.bottomAnchor.constraint(equalTo:contentView.bottomAnchor,constant: -5).isActive = true
        posterImage.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant: 10).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 97.14).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: 136).isActive = true
        
        starImage.leadingAnchor.constraint(equalTo:posterImage.trailingAnchor,constant: 6.86).isActive = true
        starImage.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant: 10).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 6).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.posterImage.image = nil
        self.overviewLabel.text = nil
        self.ratingLabel.text = nil
    }
}
