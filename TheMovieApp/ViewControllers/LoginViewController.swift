//
//  ViewController.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 1/17/21.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    var usernameTextField:UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Strings.usernameTextField
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .clear
        return textField
    }()
    
    var loginButton:UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Strings.loginButtonTitle, for: .normal)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.blue.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        constrainUI()
    }
    
    private func setupUI() {
        view.addSubview(usernameTextField)
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    private func constrainUI() {
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapLoginButton(){
        if let username = usernameTextField.text{
            if validateData(username) {
                coordinator?.eventHappened(of: .loginTapped, model: self)
                #warning("TODO: Keychain")
            }
        }
        #warning("TODO: Error handling")
    }

    private func validateData(_ username:String) -> Bool {
        return true
    }

}

