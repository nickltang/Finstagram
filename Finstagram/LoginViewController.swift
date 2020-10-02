//
//  LoginViewController.swift
//  Finstagram
//
//  Created by Nick Tang on 10/1/20.
//  Copyright © 2020 nicholastang. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = userNameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                 self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error in Sign In: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
        
        // Attempt to sign up, if succesful segue to feed, if not throw error.
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error in Sign Up: \(error?.localizedDescription)")
            }
        }
    }
    
}
