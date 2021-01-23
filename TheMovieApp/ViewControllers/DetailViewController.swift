//
//  DetailViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/23/21.
//

import UIKit

class DetailViewController<U>: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    var model:U! {
        didSet {
            print(model)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
    }
    
    private func setupUI(){
        
    }
    private func constrainUI() {
        
    }
}
