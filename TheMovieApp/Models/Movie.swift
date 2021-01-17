//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

struct Movie {
    let title:String
    let overview:String
    let date:String
    let posterPath:String
    
    init(title:String, overview:String, date:String, posterPath:String) {
        self.title = title
        self.overview = overview
        self.date = date
        self.posterPath = posterPath
    }

}

