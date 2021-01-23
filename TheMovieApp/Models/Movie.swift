//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

struct Movie:Decodable {
    var original_title:String? = "No Title"
    var overview:String? = "No Overview"
    var poster_path:String? = "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg"
    
    init(original_title:String?, overview:String?, poster_path:String?) {
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        
    }

}

