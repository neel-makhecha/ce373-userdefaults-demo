//
//  HomeViewController.swift
//  DemoOne
//
//  Created by Neel on 13/10/20.
//  Copyright © 2020 Neel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var label: UILabel?
    @IBAction func logoutPressed(_ sender: UIButton) {
        self.logout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let userName = userDefaults.string(forKey: USERNAME_KEY) {
            let welcomeString = "Hello, " + userName
            self.label?.text = welcomeString
        } else {
            let alert = UIAlertController(title: "Could not sign in!", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func logout() {
        
        let viewController = storyboard?.instantiateViewController(identifier: "viewController")
        viewController?.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(viewController!, animated: true, completion: nil)
        userDefaults.set(false, forKey: LOGGED_IN_KEY)
        
    }
    
}
