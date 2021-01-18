//
//  BaseCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

class BaseWatchableCell<U>:UITableViewCell {
    
    var viewModel: U?
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let posterImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(posterImage)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.posterImage.image = nil
    }
}
