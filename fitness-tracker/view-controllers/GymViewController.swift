//
//  SecondViewController.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 5/23/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class GymViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    struct itemData {
        var text:String
        var done:Bool
    }
    
    @IBOutlet weak var gymItemView: UICollectionView!
    @IBOutlet weak var addItemButton: UIButton!
    
    let reuseIdentifier = "gymListCell"
    var gymItemsData: [itemData] = [itemData(text: "", done: false)]
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.gymItemsData.append(itemData(text: "", done: false))
        print(self.gymItemsData.count)
        self.gymItemView!.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gymItemsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyGymItemsCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.textLabel.text = self.caloriesData[indexPath.item].text
        //cell.countLabel.text = self.caloriesData[indexPath.item].count
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

