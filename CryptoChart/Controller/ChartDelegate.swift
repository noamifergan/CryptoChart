//
//  ChartDelegate.swift
//  CryptoChart
//
//  Created by Noam Efergan on 01/07/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Charts

extension ViewController:ChartViewDelegate{
    
    // Create new entry for chart
    func createNewEntry(){
        let entry = ChartDataEntry()
        let date = getDate()
        dates.append(date)
        entry.x = Double(ConstantsForApp.results.count)
        entry.y = ConstantsForApp.results.last?.EUR ?? 0.0
        entries.append(entry)
    }
    
    // Set data for chart
    func setData(){
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dates)
        chartView.xAxis.granularity = 1
        chartView.leftAxis.granularity = 1
        let set = LineChartDataSet(entries: entries, label: "Value")
        set.drawCirclesEnabled = false
        set.mode = .cubicBezier
        set.lineWidth = 3
        set.setColor(#colorLiteral(red: 0.2842521071, green: 0.5175895095, blue: 0.970267117, alpha: 1))
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.setDrawHighlightIndicators(true)
        
        let data = LineChartData(dataSet: set)
        chartView.data = data
    }
    
        
}
