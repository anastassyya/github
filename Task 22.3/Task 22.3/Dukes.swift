//
//  Dukes.swift
//  Task 22.3
//
//  Created by Анастасия Вишневская on 1/9/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

struct Dukes {
    var name: String?
    var dynasty: String?
    var photo: UIImage?
    var coatOfArms: UIImage?
    
    init(name: String? = nil,
        dynasty: String? = nil,
        photo: UIImage? = nil, coatOfArms: UIImage? = nil) {
        
        self.name = name
        self.dynasty = dynasty
        self.photo = photo
        self.coatOfArms = coatOfArms
    }


}
