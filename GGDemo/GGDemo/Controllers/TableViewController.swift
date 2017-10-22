//
//  TableViewController.swift
//  GGDemo
//
//  Created by Glenn Posadas on 10/21/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let names = ["Geraldine", "Pacquiao", "Duterte", "Gloria", "Putin", "fafafa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
    }
    
    /** UITableViewDatasource & UITableViewDelegate
     - DATA SOURCE METHODS
         - cellForRow
         - numberOfSections
         - numberOfRowsInSections
     
     - DELEGATE METHODS
         - didSelectRowAt
     */
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentRow = indexPath.row
        let currentName = self.names[currentRow]
        
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        customCell.label.text = currentName
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedRow = indexPath.row
        let tappedName = self.names[tappedRow]
        
        self.showAlert(nameToBeDisplayed: tappedName)
    }
    
    func showAlert(nameToBeDisplayed: String) {
        let alert = UIAlertController(
            title: "Welcome!",
            message: "Welcome, user: \(nameToBeDisplayed)!", preferredStyle: .alert
        )
        
        let yesButton = UIAlertAction(
        title: "OK", style: .default) { (userDidTapOk) in
            
        }
        
        alert.addAction(yesButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}





