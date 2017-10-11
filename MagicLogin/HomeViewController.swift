//
//  HomeViewController.swift
//  MagicLogin
//
//  Created by Arnaud Dupuy on 26/10/2016.
//  Copyright © 2016 Arnaud Dupuy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MagicLogin"
        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        navigationItem.leftBarButtonItem = signOutButton
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(true)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.changeRootViewController(LoginViewController(), withAnnimation: .translate)
    }

    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let convertedDate = dateFormatter.string(from: currentDate)
        
        cell.textLabel?.text = "\(convertedDate)"
        return cell
    }
}
