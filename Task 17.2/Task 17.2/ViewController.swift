//
//  ViewController.swift
//  Task 17.2
//
//  Created by Анастасия Вишневская on 12/6/19.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var green: UIView!
    
    @IBOutlet weak var yellow: UIView!
    
    @IBOutlet weak var red: UIView!
    
    @IBOutlet weak var buttonStart: UIButton!
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        green.alpha = 0.3
        yellow.alpha = 0.3
        red.alpha = 0.3
        self.view.layoutIfNeeded ()
        green.layer.cornerRadius = green.frame.size.width/2
        green.clipsToBounds = true
        self.view.layoutIfNeeded ()
        yellow.layer.cornerRadius = yellow.frame.size.width/2
        yellow.clipsToBounds = true
        self.view.layoutIfNeeded ()
        red.layer.cornerRadius = red.frame.size.width/2
        red.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColour(){
        buttonStart.setTitle("NEXT", for: .normal)
        switch counter {
        case 1:
            green.alpha = 0.3
            red.alpha = 1
            counter += 1
        case 2:
            red.alpha = 0.3
            yellow.alpha = 1
            counter += 1
        case 3:
            yellow.alpha = 0.3
            green.alpha = 1
            counter = 1
        default:
            break
        }

    }

}
