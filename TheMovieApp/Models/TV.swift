//
//  TV.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//
import Foundation

struct TV:Decodable {
    let name:String
    let overview:String
    let first_air_date:String
    let poster_path:String
    var vote_average: Decimal?
    
    init(name:String, overview:String, first_air_date:String, poster_path:String,rating:String?,vote_average:Decimal?) {
        self.name = name
        self.overview = overview
        self.first_air_date = first_air_date
        self.poster_path = poster_path
        self.vote_average = vote_average
    }

}

