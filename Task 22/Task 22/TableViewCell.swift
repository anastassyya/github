//
//  TableViewCell.swift
//  Task 22
//
//  Created by Анастасия Вишневская on 1/7/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var symbolLabel: UILabel!
    
    func setEmoji(emoji: Emojis) {
        symbolLabel.text = emoji.symbol
        
    }
    
}
