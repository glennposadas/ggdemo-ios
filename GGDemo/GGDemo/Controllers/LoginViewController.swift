//
//  LoginViewController.swift
//  GGDemo
//
//  Created by Glenn Posadas on 10/21/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import ARSLineProgress
import Firebase
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    
    @IBOutlet private weak var button_Login: UIButton!
    @IBOutlet private weak var textField_Email: UITextField!
    @IBOutlet private weak var textField_Password: UITextField!
    
    // MARK: - Functions
    
    public func validateEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
        
    }
    
    // MARK: IBAction
    
    @IBAction func login(_ sender: Any) {
        // Login....
        //proceed to Firebase call.
        
        ARSLineProgress.show()
        
        Auth.auth().signIn(withEmail: self.textField_Email.text!, password: self.textField_Password.text!, completion: { (firebaseUser, error) in
            
            // Failed
            if let error = error {
                print("ERROR \(error.localizedDescription)")
                
                ARSLineProgress.hideWithCompletionBlock {
                    self.showAlert()
                }
                
                return
            }
            
            // Successful
            ARSLineProgress.showSuccess()
            self.performSegue(withIdentifier: "showHome", sender: nil)
        })
    }
    
    func showAlert() {
        let alert = UIAlertController(
            title: "Login Failed!",
            message: "Please try again!", preferredStyle: .alert
        )
        
        let yesButton = UIAlertAction(
        title: "OK", style: .default) { (userDidTapOk) in
            
        }
        
        alert.addAction(yesButton)
        
        self.present(alert, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Catch the segue.
        if segue.identifier == "showHome" {
            let secondNavigationController = segue.destination as! UINavigationController
            let secondViewController = secondNavigationController.viewControllers.first as! SecondViewController
            secondViewController.welcomeString = "Welcome \(self.textField_Email.text!)"
            
            // SAVE USER DEFAULTS
            UserDefaults.standard.set(self.textField_Email.text!, forKey: "emailDefault")
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.button_Login.layer.cornerRadius = 3.0
        self.button_Login.layer.masksToBounds = true
        
        self.textField_Email.delegate = self
        self.textField_Password.delegate = self
        
        // User Defaults
        // Check if we have a stored email.
        // Display to the textField if any.
        
        if let storedEmailAddress = UserDefaults.standard.object(forKey: "emailDefault") as? String {
            self.textField_Email.text = storedEmailAddress
        }
    }
    
    // MARK: Keypad handler
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textField_Email {
            self.textField_Password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
