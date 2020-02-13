//
//  TopicTableViewCell.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 2/13/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTopicLabel: UILabel!
    
    @IBOutlet weak var topicImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
