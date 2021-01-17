//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class HomeViewController: BaseViewController, Coordinating {
    
    var coordinator: Coordinator?
    var viewModel: MovieViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
        setupNavBar()
        fetchMovies()
        view.backgroundColor = .red
    }
    
    private func setupUI() {
        
    }
    
    private func constrainUI() {
        
    }

    private func fetchMovies() {
        let url = NSURL(string: Strings.baseUrl + "movie/now_playing?api_key=\(Strings.apiKey)")
        apiCall(url: url!) { result, error in
            if let result = result {
                print(result)
               
            } else {
                print(error!)
            }
        }
    }
    
    func apiCall(url:NSURL, completionHandler: @escaping (NSDictionary?, NSError?) -> Void) -> URLSessionTask {
        
        var finalData: NSDictionary!
        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
            if error != nil{
                completionHandler(nil, error as NSError?)
                return
            } else {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!) as? NSDictionary {
                        //print(json)
                        finalData = json as NSDictionary
                        completionHandler(finalData, nil)
                        return
                    }
                } catch {
                    print("EMPTY")
                    return
                }
            }
        }
        task.resume()
        return task
    }
    
}
