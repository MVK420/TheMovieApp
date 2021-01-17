//
//  TabBarViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate, Coordinating {
    
    var coordinator: Coordinator?
    private let homeVC = BaseViewController()
    private let favoritesVC = BaseViewController()
    private let tvShowsVC = BaseViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeScreen = HomeViewController()
        let tvScreen = TVViewController()

        
        viewControllers = [createController(title: "Home", imageName: "home", vc: homeScreen),  createController(title: "TV", imageName: "home", vc: tvScreen)]
        
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
