//
//  WatchableCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class Watchable: UITableViewCell {
    
    static let identifier:String  = "WatchableCell"
    private var viewModel: WatchableCellViewModel?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()

    private let posterImage : UIImageView = {
        let img = UIImageView()
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(viewModel:WatchableCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        posterImage.downloaded(from: viewModel.imgURL)
    }
}

