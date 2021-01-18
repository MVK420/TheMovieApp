//
//  WatchableCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class WatchableCell: UITableViewCell {
    
    static let identifier:String  = "WatchableCell"
    private var viewModel: WatchableCellViewModel?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let posterImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(posterImage)
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = contentView.frame.size.width - 10
        let height = contentView.frame.size.height
        nameLabel.frame = CGRect(x: 5, y: -10, width: 100, height: height)
        
        posterImage.frame = CGRect(x: width - 120, y: 10, width: 110, height: height - 20)
        posterImage.topAnchor.constraint(equalTo:contentView.topAnchor).isActive = true
        posterImage.bottomAnchor.constraint(equalTo:contentView.bottomAnchor).isActive = true
        posterImage.rightAnchor.constraint(equalTo:contentView.rightAnchor).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        posterImage.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with viewModel:WatchableCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        posterImage.downloaded(from: viewModel.imgURL)
    }
}

