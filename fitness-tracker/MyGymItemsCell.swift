//
//  MyGymItemsCell.swift
//  fitness-tracker
//
//  Created by BRIAN ZHANG on 9/30/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class MyGymItemsCell: UICollectionViewCell {
    
    @IBOutlet weak var gymItem: UITextField!
    @IBOutlet weak var gymCheckbox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        print("item checked")
        let buttonTitle = (gymCheckbox.currentTitle == "✓") ? "O" : "✓"
        gymCheckbox.setTitle(buttonTitle, for: .normal)
    }
}
