//
//  SaveData.swift
//  CryptoChart
//
//  Created by Noam Efergan on 02/07/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

// Custom object to be saved to Realm
class presistedData:Object{
    @objc dynamic var EUR = 0.0
    @objc dynamic var count = 0
    @objc dynamic var date = ""
}
// Get current time in form of a string
func getDate() -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let time = formatter.string(from: date)
    return time
}

// Save data to Realm
func saveData(result: apiResult){
    let realm = try! Realm()
    let myData = presistedData()
    myData.EUR = result.EUR
    myData.count = ConstantsForApp.entries.count
    myData.date = getDate()
    try! realm.write{
        realm.add(myData)
    }
}

func fetchData(){
    // Fetch the data from the Realm database
    let vc = ViewController()
    let realm = try! Realm()
    let results = realm.objects(presistedData.self)
    for item in results{
       let entry = ChartDataEntry()
        ConstantsForApp.dates.append(item.date)
        entry.x = Double(item.count)
        entry.y = item.EUR
        ConstantsForApp.entries.append(entry)
        vc.chartView.notifyDataSetChanged()
    }

//Uncoment this and comment the top part to clear the Realm data base
//
//        let realm = try! Realm()
//            try! realm.write({
//                realm.deleteAll()
//            })

}







