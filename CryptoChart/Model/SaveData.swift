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
    let myData = presistedData()
    myData.EUR = result.EUR
    myData.count = ConstantsForApp.results.count
    myData.date = getDate()
    let realm = try! Realm()
    try! realm.write{
        realm.add(myData)
    }
}


