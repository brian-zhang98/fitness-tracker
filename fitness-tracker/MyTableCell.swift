//
//  MyTableCell.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 6/8/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {
    
    @IBOutlet weak var myTextLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
