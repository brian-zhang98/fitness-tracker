//
//  FirstViewController.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 5/23/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class DailyGoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct stepsData {
        var text:String
        var count:String
    }
    
    var stepsTableData: [stepsData] = []
    var stepsToday: Double!
    var dailyGoal: Double!
    
    func setStepsTableData() {
        self.stepsTableData = [
            stepsData(text: "Steps Taken Today: ", count: String(Int(self.stepsToday))),
            stepsData(text: "Daily Goal: ", count: String(Int(self.dailyGoal))),
            stepsData(text: "Progress: ", count: String((self.stepsToday / self.dailyGoal) * 100) + "%")
        ]
    }
    
    //gets steps from health kit and updates steps table data
    func getTodaysSteps() {
        HealthKitSetupAssistant.getTodaysSteps { (result) in
            print("steps: ")
            print(String("\(result)"))
            self.stepsToday = Double("\(result)")
            self.dailyGoal = 2000
            self.setStepsTableData()
        }
    }
    
    //for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepsTableData.count
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
        
        getTodaysSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

