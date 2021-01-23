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
    
    init(with model:Movie) {
        name = model.original_title!
        if let poster = model.poster_path {
            imgURL = URL(string: Strings.baseImgUrl + poster)!
        } else {
            imgURL = URL(string: Strings.baseImgUrl + "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg")!
        }
        overview = model.overview!
        rating = (model.vote_average!.formattedAmount ?? "0.0")
    }
    
    init(with model:TV) {
        name = model.name
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
        rating = (model.vote_average!.formattedAmount ?? "0.0")
    }
}

extension Decimal {
    var formattedAmount: String? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSDecimalNumber)
    }
}
