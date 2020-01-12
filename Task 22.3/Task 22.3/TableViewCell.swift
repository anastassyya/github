//
//  TableViewCell.swift
//  Task 22.3
//
//  Created by Анастасия Вишневская on 1/9/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var coatOfArms: UIImageView!
    
    @IBOutlet weak var dynasty: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    func setContact (duke: Dukes) {
        photo.image = duke.photo
        coatOfArms.image = duke.coatOfArms
        dynasty.text = duke.dynasty
        name.text = duke.name
    
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
