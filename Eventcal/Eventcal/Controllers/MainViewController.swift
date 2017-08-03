//
//  MainViewController.swift
//  Firebase-boilerplate
//
//  Created by Mariano Montori on 7/24/17.
//  Copyright © 2017 Mariano Montori. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    var authHandle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(User.current.firstName) \(User.current.lastName)"
        
        authHandle = AuthService.authListener(viewController: self)
    }
    
    deinit {
        AuthService.removeAuthListener(authHandle: authHandle)
    }

    @IBAction func logOutClicked(_ sender: UIButton) {
        AuthService.presentLogOut(viewController: self)
    }
    
    @IBAction func deleteAccountClicked(_ sender: UIButton) {
        guard let user = Auth.auth().currentUser else {
            print("NO USER EXISTS???")
            return
        }
        AuthService.presentDelete(viewController: self, user : user)
    }
}
