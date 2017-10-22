//
//  CustomTableViewCell.swift
//  GGDemo
//
//  Created by Glenn Posadas on 10/21/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
