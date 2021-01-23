//
//  DetailViewModel.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/23/21.
//

import UIKit

struct DetailViewModel {
    
    let name:String
    let overview:String
    let imgURL:URL
    let rating:String
    let status:String
    let popularity:String
    let language:String
    let genres:[String]
    
    init(with model:Movie) {
        name = model.original_title
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
        
        rating = "4.0"
        status = "Released"
        popularity = "216.912"
        language = "EN"
        genres = ["Horror","Sci-Fi","Fantasy"]
    }
    
    init(with model:TV) {
        name = model.name
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
        
        rating = "4.0"
        status = "Released"
        popularity = "216.912"
        language = "EN"
        genres = ["Horror","Sci-Fi","Fantasy"]
    }
}
