//
//  TableViewCell.swift
//  Task 26. Get запросы
//
//  Created by Анастасия Вишневская on 1/21/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    //cell 1 task
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var ourCurrencyLabel: UILabel!
    
    @IBOutlet weak var buyLabel: UILabel!
    
    @IBOutlet weak var saleLabel: UILabel!
        
    //header 1 task
    @IBOutlet weak var currencyCode: UILabel!
    
    @IBOutlet weak var purchaseRate: UILabel!
    
    @IBOutlet weak var sellingRate: UILabel!
    
    @IBOutlet weak var nationalCurrencyCode: UILabel!

    
    //cell 2 task
    
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    
    @IBOutlet weak var purchaseRateLabel: UILabel!
    
    @IBOutlet weak var saleRateNbuLabel: UILabel!
    
    @IBOutlet weak var saleRateLabel: UILabel!
    
    @IBOutlet weak var purchaseRateNbuLabel: UILabel!
    
    @IBOutlet weak var currencyArchiveLabel: UILabel!
    
    
}
