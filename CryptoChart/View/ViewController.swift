//
//  ViewController.swift
//  CryptoChart
//
//  Created by Noam Efergan on 30/06/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {
    
    
    //MARK:- Variables and constants
    let currentValueLabel = UILabel()
    let refreshButton = UIButton()
    let chartView = LineChartView()
    var timer = Timer()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "CryptoChart"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
    
    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.delegate = self
        setChartView()
        fetchData()
        setCurrentValueLabel()
        setRefreshButton()
        networkCall()
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(networkCall), userInfo: nil, repeats: true)
    }
    
    //MARK:- Constraints
    
    func setChartView(){
        view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = #colorLiteral(red: 0.9175471663, green: 0.9177045822, blue: 0.917537272, alpha: 1)
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.leftAxis.setLabelCount(6, force: true)
        chartView.leftAxis.spaceTop = 3
        chartView.leftAxis.spaceBottom = 0.5
        chartView.xAxis.labelPosition = .bottomInside

        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            chartView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            chartView.heightAnchor.constraint(equalTo: margins.widthAnchor),
            chartView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            chartView.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    
    func setCurrentValueLabel(){
        view.addSubview(currentValueLabel)
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.textAlignment = .center
        currentValueLabel.font = .systemFont(ofSize: 36, weight: .light)
        currentValueLabel.numberOfLines = 0
        currentValueLabel.text = "Current value:"
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            currentValueLabel.bottomAnchor.constraint(equalTo: chartView.topAnchor, constant: -40),
            currentValueLabel.widthAnchor.constraint(equalTo: margins.widthAnchor),
            currentValueLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    
    
    func setRefreshButton(){
        view.addSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        refreshButton.titleLabel?.textColor = .white
        refreshButton.layer.cornerRadius = 13
        refreshButton.addTarget(self, action: #selector(networkCall), for: .touchUpInside)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 40),
            refreshButton.widthAnchor.constraint(equalTo: margins.widthAnchor,multiplier: 0.5),
            refreshButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor,constant: -20),
            refreshButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    

    




}

