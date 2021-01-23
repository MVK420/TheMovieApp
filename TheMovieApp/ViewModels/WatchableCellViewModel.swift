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
    
    init(with model:Movie) {
        name = model.original_title!
        if let poster = model.poster_path {
            imgURL = URL(string: Strings.baseImgUrl + poster)!
        } else {
            imgURL = URL(string: Strings.baseImgUrl + "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg")!
        }
        overview = model.overview!
    }
    
    init(with model:TV) {
        name = model.name
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
    }
}
