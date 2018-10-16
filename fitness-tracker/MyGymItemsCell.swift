//
//  MyGymItemsCell.swift
//  fitness-tracker
//
//  Created by BRIAN ZHANG on 9/30/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class MyGymItemsCell: UICollectionViewCell {
    
    @IBOutlet weak var gymCheckbox: UIButton!
    @IBOutlet weak var gymItemText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        let buttonTitle = (gymCheckbox.currentTitle == "✓") ? "O" : "✓"
        gymCheckbox.setTitle(buttonTitle, for: .normal)
        if(gymCheckbox.currentTitle == "✓")
        {
            self.backgroundColor = UIColor(hue: 145/360, saturation: 100/100, brightness: 66/100, alpha: 1.0)
        }
        else
        {
            self.backgroundColor = UIColor.white
        }
    }
    @IBAction func editEnd(_ sender: Any) {
        print(gymItemText.text!)
    }
}
