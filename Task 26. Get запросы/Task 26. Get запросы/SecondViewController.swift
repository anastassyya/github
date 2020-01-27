//
//  SecondViewController.swift
//  Task 26. Get запросы
//
//  Created by Анастасия Вишневская on 1/23/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Lottie

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayArchive : [CurrencyStructArchive] = []
    var tempDate = ""
    let formatter = DateFormatter()
    let starAnimationView = AnimationView(name: "expectation")
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starAnimationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        starAnimationView.center = self.view.center
        view.addSubview(starAnimationView)
        starAnimationView.isHidden = true
        self.tableView.sectionHeaderHeight = 70
        formatter.dateFormat = "dd.MM.yyyy"
        tempDate = formatter.string(from: Date())
        getDataWithDate()
    }
    
    @IBAction func doneToolBarButton(_ sender: UIBarButtonItem) {
        arrayArchive = []
        tableView.reloadData()
        starAnimationView.isHidden = false
        starAnimationView.play()
        starAnimationView.loopMode = .autoReverse
        tempDate = formatter.string(from: datePicker.date)
        getDataWithDate()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArchive.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell2 = tableView.dequeueReusableCell(withIdentifier: "header2") as! TableViewCell
        return headerCell2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell
        let itemArchive = arrayArchive[indexPath.row]
        if let saleRateNBTemp =  itemArchive.saleRateNB {
            cell2.saleRateNbuLabel?.text = String(format: "%.1f", saleRateNBTemp)
        }
        else {
            cell2.saleRateNbuLabel?.text = "0"
        }
        if let purchaseRateNBTemp = itemArchive.purchaseRateNB {
            cell2.purchaseRateNbuLabel?.text = String(format: "%.1f", purchaseRateNBTemp)
        }
        else {
            cell2.purchaseRateNbuLabel?.text = "0"
        }
        if let saleRateTemp =  itemArchive.saleRate {
            cell2.saleRateLabel?.text = String(format: "%.1f", saleRateTemp)
        }
        else {
            cell2.saleRateLabel?.text = "0"
        }
        if let purchaseRateTemp = itemArchive.purchaseRate {
            cell2.purchaseRateLabel?.text = String(format: "%.1f", purchaseRateTemp)
        }
        else {
            cell2.purchaseRateLabel?.text = "0"
        }
        cell2.baseCurrencyLabel?.text = itemArchive.baseCurrency
        cell2.currencyArchiveLabel?.text = itemArchive.currency
        return cell2
        
    }
    
    //get data with date
    func getDataWithDate() {
        let query: [String: String] = [
            "json": "",
            "date" : tempDate]
        let baseURL = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?")!
        let url = baseURL.withQueries(query)!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        print (url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                print("ERROR!!!  error: \(String(describing: error))")
                return
            }
            
            guard let data = data else {
                print("ERROR!!!  data == nil")
                return
            }
            
            do {
                if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]  {
                    
                    print("arrayOfJsonObjects: \(arrayOfJsonObjects)")
                    if let dict = arrayOfJsonObjects["exchangeRate"] as? [AnyObject] {
                        
                        for i in dict {
                            let baseCurrency : String? = i["baseCurrency"]  as? String
                            let currency : String? = i["currency"] as? String
                            let saleRateNB : Double? = i["saleRateNB"] as? Double
                            let purchaseRateNB : Double? = i["purchaseRateNB"] as? Double
                            let saleRate : Double? = i["saleRate"] as? Double
                            let purchaseRate : Double? = i["purchaseRate"] as? Double
                            
                            let itemOfArrayArchive = CurrencyStructArchive(baseCurrency: baseCurrency, currency: currency, saleRateNB: saleRateNB, saleRate: saleRate, purchaseRateNB: purchaseRateNB, purchaseRate: purchaseRate)
                            self.arrayArchive.append(itemOfArrayArchive)
                            
                            //reload 
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                self.starAnimationView.isHidden = true
                            }
                        }
                    }
                }
                else
                {
                    print("json == nil")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}

