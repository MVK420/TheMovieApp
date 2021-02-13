//
//  WatchableViewModel.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

struct WatchableCellViewModel {
    
    let name:String
    let overview:String
    let imgURL:URL
    let rating:String
    let popularity:String
    
    init(with model:Movie) {
        name = model.original_title!
        imgURL = (model.poster_path != nil)
            ? URL(string: Strings.baseImgUrl + model.poster_path!)!
            : URL(string: Strings.noImageError)!
        overview = model.overview!
        rating = (model.vote_average!.formattedAmount ?? "0.0")
        popularity = (model.popularity!.formattedAmount ?? "0.0")
    }
    
    init(with model:TV) {
        name = model.name
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
        rating = (model.vote_average!.formattedAmount ?? "0.0")
        popularity = (model.popularity!.formattedAmount ?? "0.0")
    }
}

extension Decimal {
    var formattedAmount: String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter.string(from: self as NSDecimalNumber)
    }
}
