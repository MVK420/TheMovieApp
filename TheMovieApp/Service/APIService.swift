//
//  MovieService.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/18/21.
//

import UIKit

struct HomeFeed: Decodable {
    let results: [Movie]
}

class APIService {
    
    static let sharedInstance = APIService()
    
    private init(){
        
    }
    
    func loadData<T:Decodable>(with URL:URL, for type: T.Type, completion: @escaping(T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: URL) { (data, resp, err) in
            guard let data = data, let response = resp else { return completion(nil,err) }
            //print("response: ", response)
            let parsedData = self.parse(data, to: T.self)
            completion(parsedData,nil)
        }.resume()
    }
    
    private func parse<T: Decodable>(_ data: Data, to type: T.Type)->T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            print("Parsing error! \(error)")
            return nil
        }
    }
}