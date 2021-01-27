//
//  Coordinator.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//
import UIKit

//comment for git push
enum Event {
    case loginTapped
    case detailTapped
}

protocol Coordinator {
    var viewController:UIViewController?{get set}
    var navController:UINavigationController?{get set}
    
    func eventHappened<T>(of type: Event, model:T?)
    func start()
    func createHomeController() -> HomeViewController
}

protocol Coordinating {
    var coordinator: Coordinator?{get set}
}

class MainCoordinator:Coordinator {
    
    var viewController: UIViewController?
    var navController: UINavigationController?
    var tabBar: UITabBarController & Coordinating = TabBarViewController()
    
    init() {
        self.navController = UINavigationController()
    }
    
    func eventHappened<T>(of type: Event,model:T?) {
        switch type {
        case .loginTapped:
            tabBar.coordinator = self
            navController?.setViewControllers([tabBar], animated: true)
            navController?.modalPresentationStyle = .fullScreen
            viewController?.present(navController!, animated: true, completion: nil)
        case .detailTapped:
            let detailVC:DetailViewController = DetailViewController<T>()
            detailVC.coordinator = self
            detailVC.model = model
            navController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func start() {
        tabBar.coordinator = self
        navController?.setViewControllers([tabBar], animated: true)
        navController?.modalPresentationStyle = .fullScreen
    }
    
    func createHomeController() -> HomeViewController {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        return homeVC
    }

}
