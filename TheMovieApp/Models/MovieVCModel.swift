//
//  MovieVCModel.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/11/21.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

struct MovieVCModel {
    var page:Int?
    var totalPages:Int?
    var cellModels:[Movie] = [Movie]()
    var rxModels: BehaviorRelay<[Movie]> = BehaviorRelay(value: [])
}
