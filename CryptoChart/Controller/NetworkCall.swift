//
//  NetworkCall.swift
//  CryptoChart
//
//  Created by Noam Efergan on 01/07/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

extension ViewController{
    
    @objc func networkCall(){
        // Create URL and Session
        guard let url = URL(string: Secrets.apiURL) else {print("fail"); return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, err) in
            // Handle Error
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            else{
                if data == nil {
                    print("data nil")
                }
                else {
            // Parse JSON and append to results array
                let decoder = JSONDecoder()
                do {
                    let jsonData = try decoder.decode(apiResult.self, from: data!)

                    ConstantsForApp.results.append(jsonData)
                    saveData(result: jsonData)
                }
                    catch {print("Error parsing JSON")}
                }
            }
        }
        task.resume()
        
        //Update label
        currentValueLabel.text = "Current value: \(ConstantsForApp.results.last?.EUR ?? 0.0)"
        createNewEntry()
        chartView.notifyDataSetChanged()
        setData()
        }
    
    }
    



