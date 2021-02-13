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
    var status:String?
    let popularity:String
    let language:String
    var genres:[String] = []
    
    init(with model:Movie) {
        name = model.original_title!
        imgURL = (model.poster_path == nil)
            ? URL(string: Strings.baseImgUrl + model.poster_path!)!
            : URL(string: Strings.noImageError)!
        overview = model.overview!
        language = model.original_language!.uppercased()
        rating = (model.vote_average!.formattedAmount ?? "0.0")
        popularity = (model.popularity!.formattedAmount ?? "0.0")
        model.genre_ids?.forEach({ (genre) in
            self.genres.append(Genres.dict[genre]!)
        })
        status = releasedValidate(model.release_date!)
    }
    
    ///Not used in UI Builder version
    init(with model:TV) {
        name = model.name
        imgURL = URL(string: Strings.baseImgUrl + (model.poster_path))!
        overview = model.overview
        popularity = (model.popularity!.formattedAmount ?? "0.0")
        rating = "4.0"
        status = "Released"
        language = "EN"
        genres = ["Horror","Sci-Fi","Fantasy"]
    }
    
    private func releasedValidate(_ modelDate:String) -> String{
        let isoDate = modelDate
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from:isoDate) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            let finalDate = calendar.date(from:components)
            if finalDate! < Date() {
                return "Released"
            }
        }
        return "Not Released"
    }
}
