//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//
import Foundation

struct Movie:Decodable {
    var original_title:String? = "No Title"
    var overview:String? = "No Overview"
    var poster_path:String? = "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg"
    var vote_average: Decimal?
    
    init(original_title:String?, overview:String?, poster_path:String?,vote_average:Decimal?) {
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        self.vote_average = vote_average
    }

}

