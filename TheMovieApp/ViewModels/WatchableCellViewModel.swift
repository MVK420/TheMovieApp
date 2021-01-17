//
//  WatchableViewModel.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

struct WatchableCellViewModel {
    
    let name:String
    let imgURL:URL
    
    init(with model:Movie) {
        name = model.title
        imgURL = URL(string: Strings.baseImgUrl + (model.posterPath))!
    }
    
}
