//
//  FirstViewController.swift
//  Fitness Tracker
//
//  Created by BRIAN ZHANG on 5/23/18.
//  Copyright © 2018 Brian Zhang. All rights reserved.
//

import UIKit

class DailyGoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    let healthStore = HKHealthStore()
//
//    func getTodaysSteps(completion: @escaping (Double) -> Void) {
//        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
//
//        let now = Date()
//        let startOfDay = Calendar.current.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
//
//        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
//            guard let result = result, let sum = result.sumQuantity() else {
//                completion(0.0)
//                return
//            }
//            completion(sum.doubleValue(for: HKUnit.count()))
//        }
//
//        healthStore.execute(query)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepsTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "steps") as! MyCell
        
        cell.myTextLabel.text = stepsTableData[indexPath.row].text
        
        cell.countLabel.text = stepsTableData[indexPath.row].count
        
        return cell
    }
    

    struct stepsData {
        var text:String
        var count:String
    }
    
    var stepsTableData: [stepsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        var stepsToday = getTodaysSteps()

        let stepsToday = String(1000)
        
        stepsTableData = [
            stepsData(text: "Steps Taken Today: ", count: stepsToday),
            stepsData(text: "Daily Goal: ", count: "2000" ),
            stepsData(text: "Progress: ", count: "50%" )
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

