//
//  TabBarViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate, Coordinating {
    
    var coordinator: Coordinator?
    let homeScreen = HomeViewController()
    let tvScreen = TVViewController()
    let favoritesScreen = FavoritesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createController(title: "Home", imageName: "home", vc: homeScreen),
                           createController(title: "Favorites", imageName: "home", vc: favoritesScreen),
                           createController(title: "TV", imageName: "home", vc: tvScreen)]
        tabBar.barTintColor = .black
    }
    
    /// Creates controllers for tab bar
    ///
    /// - Parameters:
    ///   - title: text
    ///   - imageName: image name
    ///   - vc: view controller
    /// - Returns: tab bar view controller with image and text
    private func createController(title: String, imageName: String, vc: UIViewController) -> UINavigationController{
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(named: imageName)
        return recentVC
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
