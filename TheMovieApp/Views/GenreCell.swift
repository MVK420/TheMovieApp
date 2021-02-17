//
//  GenreCell.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/17/21.
//

import UIKit

class GenreCell: UICollectionViewCell {
    @IBOutlet weak var genreLabel: UILabel!
    
    func setupLabel(_ text: String) {
        genreLabel.backgroundColor = .red
        genreLabel.text = text
        genreLabel.layer.cornerRadius = 5
        genreLabel.layer.masksToBounds = true
    }
}
