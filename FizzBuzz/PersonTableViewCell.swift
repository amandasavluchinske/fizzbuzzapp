//
//  PersonTableViewCell.swift
//  FizzBuzz
//
//  Created by Amanda Savluchinske on 01/08/2018.
//  Copyright © 2018 Amanda Savluchinske. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var scorePerson: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
