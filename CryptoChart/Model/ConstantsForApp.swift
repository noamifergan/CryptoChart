//
//  ConstantsForApp.swift
//  CryptoChart
//
//  Created by Noam Efergan on 01/07/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Charts

struct ConstantsForApp:Codable {
    static var results = [apiResult]()
    static var entries:Array = [ChartDataEntry]()
    static var dates:[String] = []
}

struct apiResult:Codable {
    var EUR:Double
}

