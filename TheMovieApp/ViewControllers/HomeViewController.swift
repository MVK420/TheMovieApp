//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class HomeViewController: BaseViewController, Coordinating {
    
    var coordinator: Coordinator?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
        view.backgroundColor = .red
    }
    
    private func setupUI() {
        
    }
    
    private func constrainUI() {
        
    }
    
}
