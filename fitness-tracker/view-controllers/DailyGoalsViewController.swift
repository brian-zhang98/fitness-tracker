//
//  FirstViewController.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 5/23/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class DailyGoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //steps table stuff
    struct data {
        var text:String
        var count:String
    }
    
    var stepsTableData: [data] = []
    var stepsToday: Double!
    var dailyStepsGoal: Double!
    
    func setStepsTableData() {
        self.stepsTableData = [
            data(text: "Steps Taken Today: ", count: String(Int(self.stepsToday))),
            data(text: "Daily Goal: ", count: String(Int(self.dailyStepsGoal))),
            data(text: "Progress: ", count: String((self.stepsToday / self.dailyStepsGoal) * 100) + "%")
        ]
    }
    
    //calorie collection view stuff
    let reuseIdentifier = "caloriesCell"
    
    var caloriesData: [data] = []
    var caloriesToday: Double!
    var dailyCaloriesGoal: Double!
    
    func setCaloriesData() {
        print("this happened")
        self.caloriesToday = 1000
        self.dailyCaloriesGoal = 2500
        
        self.caloriesData = [
            data(text: "Calories Consumed", count: String(Int(self.caloriesToday))),
            data(text: "Daily Goal", count: String(Int(self.dailyCaloriesGoal))),
            data(text: "Progress", count: String((self.caloriesToday / self.dailyCaloriesGoal) * 100) + "%")
        ]
        print("this happened at the end too")
        print(self.caloriesData.count)
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.caloriesData.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.textLabel.text = self.caloriesData[indexPath.item].text
        cell.countLabel.text = self.caloriesData[indexPath.item].count
        
        return cell
    }
    
    //gets steps from health kit and updates steps table data
    func getTodaysSteps() {
        HealthKitSetupAssistant.getTodaysSteps { (result) in
            print("steps: ")
            print(String("\(result)"))
            self.stepsToday = Double("\(result)")
            self.dailyStepsGoal = 2000
            self.setStepsTableData()
        }
    }
    
    //for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepsTableData.count
    }
    
    //more for the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "steps") as! MyTableCell
        
        cell.myTextLabel.text = stepsTableData[indexPath.row].text
        
        cell.countLabel.text = stepsTableData[indexPath.row].count
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a
        
        self.setCaloriesData()
        getTodaysSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

