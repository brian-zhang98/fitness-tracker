//
//  SecondViewController.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 5/23/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class GymViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    struct data {
        var text:String
        var count:String
    }
    
    let reuseIdentifier = "gymListCell"
    var gymItemsData: [data] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return gymItemsData.count
        return (gymItemsData.count == 0) ? 1 : gymItemsData.count
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

