//
//  FirstViewController.swift
//  Location
//
//  Created by Dipankar Ghosh on 4/28/18.
//  Copyright © 2018 Dipankar Ghosh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class FirstViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: AnyObject)
    {
        if let email = self.emailTextField.text, let password = self.passwordTextField.text
        {
            // [START headless_email_auth]
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                
                if let error = error {
                    print(error.localizedDescription)
                    //show alert
                    return
                }
                else{
                    print("success");
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let NextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! NextViewController
                    self.present(NextViewController, animated:true, completion:nil)

                    
                }
            }
        }
        else {
            print("email/password can't be empty");
            //show alert
        }
    }
    
    
    /*@IBAction func loginTapped(_ sender: Any) {
     if let email = emailTextField.text,
     let password = passwordTextField.text {
     Auth.auth().createUser(withEmail: email, password: password, completion:{(user, error) in
     if let firebaseError = error {
     print(firebaseError.localizedDescription)
     return
     }
     print("success");
     })
     }
     }
     */
    @IBAction func createAccountTapped(_ sender: AnyObject) {
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            // [START headless_email_auth]
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                
                if let error = error {
                    print(error.localizedDescription)
                    //show alert
                    return
                }
                else{
                    print("success");
                    // [END_EXCLUDE]
                }
                // [END headless_email_auth]
            }
        }
        
    }
    /*
     @IBAction func createAccountTapped(_ sender: Any) {
     
     if let email = self.emailTextField.text, let password = self.passwordTextField.text {
     // [START headless_email_auth]
     Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
     // [START_EXCLUDE]
     
     if let error = error {
     print(error.localizedDescription)
     //show alert
     return
     }
     
     
     // [END_EXCLUDE]
     }
     // [END headless_email_auth]
     } else {
     print("email/password can't be empty")
     //show alert
     }
     }
     */
    
}
