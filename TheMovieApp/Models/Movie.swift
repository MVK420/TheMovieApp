//
//  Movie.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//
import Foundation

struct Movie:Decodable,Encodable {
    
    var original_title: String?
    var overview: String? = "No Overview"
    var poster_path: String? = nil
    var vote_average: Decimal?
    var popularity: Decimal?
    var genre_ids: [Decimal]?
    var original_language: String?
    var release_date: String?
    
    init(original_title: String?, overview: String?, poster_path: String?,vote_average: Decimal?,popularity: Decimal?,genre_ids: [Decimal]?,original_language: String,release_date: String) {
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.popularity = popularity
        self.genre_ids = genre_ids
        self.original_language = original_language
        self.release_date = release_date
    }
}
