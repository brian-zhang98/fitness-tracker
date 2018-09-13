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
    
    var stepsToday = String(1000)
    
    func getTodaysSteps() {
        HealthKitSetupAssistant.getTodaysSteps { (result) in
            print("steps: ")
            print(String("\(result)"))
            self.stepsToday = String("\(result)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepsTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "steps") as! MyCell
        
        cell.myTextLabel.text = stepsTableData[indexPath.row].text
        
        cell.countLabel.text = stepsTableData[indexPath.row].count
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getTodaysSteps()
        
        stepsTableData = [
            stepsData(text: "Steps Taken Today: ", count: self.stepsToday),
            stepsData(text: "Daily Goal: ", count: "2000" ),
            stepsData(text: "Progress: ", count: "50%" )
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

