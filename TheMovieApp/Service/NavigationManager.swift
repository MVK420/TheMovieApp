//
//  NavigationManager.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import UIKit

class NavigationManager {
    
    static let sharedInstance:NavigationManager = NavigationManager()
    private let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    private init() {
        
    }
    
    private func presentDetailVC(with model: Movie) {
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "myVCID") as UIViewController
        //self.present(vc, animated: true, completion: nil)
    }
}
