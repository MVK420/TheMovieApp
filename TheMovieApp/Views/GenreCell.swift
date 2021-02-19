//
//  GenreCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/17/21.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    static let cellID = "genreCell"
    @IBOutlet weak var genreLabel: UILabel!
    
    func setupLabel(_ text: String) {
        genreLabel.text = text
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
        genreLabel.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
        genreLabel.layer.cornerRadius = 5
        genreLabel.layer.masksToBounds = true
    }
}
