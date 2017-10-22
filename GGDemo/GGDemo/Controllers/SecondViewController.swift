//
//  SecondViewController.swift
//  GGDemo
//
//  Created by Glenn Posadas on 10/21/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label_Welcome: UILabel!
    var welcomeString: String!
    
    @IBAction func signout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label_Welcome.text = self.welcomeString
    }
}
