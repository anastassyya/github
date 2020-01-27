//
//  ViewController.swift
//  Task 26. Get запросы
//
//  Created by Анастасия Вишневская on 1/22/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = [CurrencyStruct]()
    var itemOfArray : CurrencyStruct = CurrencyStruct()
    var tempDate = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = getData()
        self.tableView.sectionHeaderHeight = 70
    }
    
    @IBAction func button(_ sender: UIButton) {
        array = []
        array = getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "header") as! TableViewCell
        return headerCell
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = array[indexPath.row]
        cell.currencyLabel?.text = item.currency
        cell.ourCurrencyLabel.text = item.ourCurrency
        let buy = String(item.buy!)
        let sale = String(item.sale!)
        cell.buyLabel?.text = buy
        cell.saleLabel?.text = sale
        return cell
    }
    
    func getData() -> [CurrencyStruct] {
        let query: [String: String] = [
            "json": "",
            "exchange": "",
            "coursid" : "5" ]
        let baseURL = URL(string: "https://api.privatbank.ua/p24api/pubinfo?")!
        let url = baseURL.withQueries(query)!
        let session = URLSession.shared
        let request = URLRequest(url: url)
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
                if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                    for jsonObject in arrayOfJsonObjects {
                        print("jsonObject: \(jsonObject)")
                        
                        if let dict = jsonObject as? [String: Any]{
                            if let ourCurrency = dict[#"base_ccy"#] as? String, let buy = dict["buy"] as? String, let sale = dict["sale"] as? String, let currency = dict["ccy"] as? String {
                                self.itemOfArray = CurrencyStruct(currency: currency, ourCurrency: ourCurrency, buy: buy, sale: sale)
                                self.array.append(self.itemOfArray)
                                print ("first \(self.array)")
                                //reload
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                            else {
                                print("jsonObject == nil")
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
        
        return array
        
    }
    
    
}

extension URL {
    func withQueries(_ queries: [String: String])-> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
