//
//  ViewController.swift
//  DemoOne
//
//  Created by Neel on 13/10/20.
//  Copyright © 2020 Neel. All rights reserved.
//

import UIKit

let USERNAME_KEY = "USER_NAME"
let LOGGED_IN_KEY = "LOGGED_IN_KEY"

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var textField: UITextField?
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let userName = textField?.text {
            userDefaults.set(userName, forKey: USERNAME_KEY)
            userDefaults.set(true, forKey: LOGGED_IN_KEY)
            
            if let homeViewController = storyboard?.instantiateViewController(identifier: "homeViewController") {
                homeViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                self.present(homeViewController, animated: true, completion: nil)
            }
            
            return 
        }
        
        let alertController = UIAlertController(title: "Invalid username", message: "Please enter a valid username", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

