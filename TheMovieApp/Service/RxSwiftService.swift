//
//  RxSwiftService.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftService {
    
    static let sharedInstance = RxSwiftService()
    
    private init(){
        
    }
    
    func urlString(searchText: String) -> URL {
      let encodedText = searchText.addingPercentEncoding(withAllowedCharacters:
                                                         CharacterSet.urlQueryAllowed)!
      
      let urlString = String(format:"https://nfl-fake-api.com/search?name=%@", encodedText)
      let url = URL(string: urlString)
      return url!
    }

    /// Parse JSON data
    private func parse<T: Decodable>(_ data: Data, to type: T.Type)->T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print("Parsing error! \(error)")
            return nil
        }
    }
    func loadData<T:Decodable>(with URL:URL, for type: T.Type) -> T  {
        let request = URLRequest(url: URL)
        let session = URLSession.shared
        return session.rx.data(request: request).map { self.parse($0, to: T.self) } as! T
    }

    /// Make API request
    func search(search term: String) -> Observable<HomeFeed> {
      let url = urlString(searchText: term)
      let request = URLRequest(url: url)
      let session = URLSession.shared

        return session.rx.data(request: request).map { self.parse($0, to: HomeFeed.self)! }
    }
}
