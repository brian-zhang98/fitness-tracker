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
    let reuseIdentifierCalorie = "caloriesCell"
    
    var caloriesData: [data] = []
    var caloriesToday: Double!
    var dailyCaloriesGoal: Double!
    
    func setCaloriesData() {
        self.caloriesToday = 1000
        self.dailyCaloriesGoal = 2500
        
        self.caloriesData = [
            data(text: "Calories Consumed", count: String(Int(self.caloriesToday))),
            data(text: "Daily Goal", count: String(Int(self.dailyCaloriesGoal))),
            data(text: "Progress", count: String((self.caloriesToday / self.dailyCaloriesGoal) * 100) + "%")
        ]
    }
    
    //exercise collection view stuff
    let reuseIdentifierExercise = "exerciseCell"
    
    var exerciseData: [data] = []
    var pushupsGoal: Int!
    var pushupsCompleted: Int!
    var situpsGoal: Int!
    var situpsCompleted: Int!
    var pullupsGoal: Int!
    var pullupsCompleted: Int!

    func setExerciseData() {
        self.pushupsGoal = 100
        self.pushupsCompleted = 75
        self.situpsGoal = 100
        self.situpsCompleted = 100
        self.pullupsGoal = 50
        self.pullupsCompleted = 35
        
        let pushupsCount = (self.pushupsGoal == self.pushupsCompleted) ? "Done!" : String(self.pushupsGoal / self.pushupsCompleted * 100) + "%"
        let situpsCount = (self.situpsGoal == self.situpsCompleted) ? "Done!" : String(self.situpsGoal / self.situpsCompleted * 100) + "%"
        let pullupsCount = (self.pullupsGoal == self.pullupsCompleted) ? "Done!" : String(self.pullupsGoal / self.pullupsCompleted * 100) + "%"
        
        self.exerciseData = [
            data(text: "Pushups Done: " + String(self.pushupsCompleted) + "/" + String(self.pushupsGoal), count: pushupsCount),
            data(text: "Situps Done: " + String(self.situpsCompleted) + "/" + String(self.situpsGoal), count: situpsCount),
            data(text: "Pullups Done: " + String(self.pullupsCompleted) + "/" + String(self.pullupsGoal), count: pullupsCount)
        ]
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView.tag == 1)
        {
            return self.caloriesData.count
        }
        else
        {
            return self.exerciseData.count
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView.tag == 1)
        {
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCalorie, for: indexPath as IndexPath) as! MyCalorieCell
        
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.textLabel.text = self.caloriesData[indexPath.item].text
            cell.countLabel.text = self.caloriesData[indexPath.item].count
            
            return cell
        }
        else
        {
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierExercise, for: indexPath as IndexPath) as! MyExerciseCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.textLabel.text = self.exerciseData[indexPath.item].text
            cell.completionLabel.text = self.exerciseData[indexPath.item].count
            
            if(cell.completionLabel.text == "Done!")
            {
                cell.completionLabel.textColor = UIColor.green
            }
            
            return cell
        }
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
        self.setExerciseData()
        getTodaysSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

