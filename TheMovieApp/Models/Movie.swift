//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

struct Movie:Decodable {
    let original_title:String
    let overview:String
    let release_date:String
    let poster_path:String
    
    init(original_title:String, overview:String, release_date:String, poster_path:String) {
        self.original_title = original_title
        self.overview = overview
        self.release_date = release_date
        self.poster_path = poster_path
    }

}

