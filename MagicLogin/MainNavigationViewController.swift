//
//  MainNavigationViewController.swift
//  MagicLogin
//
//  Created by Arnaud Dupuy on 26/10/2016.
//  Copyright © 2016 Arnaud Dupuy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn() {
            showHomeController()
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    func showHomeController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: "HomeNavigationController") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = homeNavigationController
    }
    
    func showLoginController() {
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }

}
