//
//  ViewController.swift
//  UIExample
//
//  Created by asadulin viktor on 14/10/2019.
//  Copyright © 2019 asadulin viktor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Game()
    
    
    
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        areaLabel.text = game.roomToString()
        
        gameOverLabel.text = ""
    }
    

    @IBAction func leftAction(_ sender: Any) {
        game.move(to: .left)
        areaLabel.text = game.roomToString()
        
        gameOverLabel.text = ""
    }
    @IBAction func rightAction(_ sender: Any) {
        game.move(to: .right)
        areaLabel.text = game.roomToString()
    }
    @IBAction func upAction(_ sender: Any) {
        game.move(to: .up)
        areaLabel.text = game.roomToString()
    }
    @IBAction func downAction(_ sender: Any) {
        game.move(to: .down)
        areaLabel.text = game.roomToString()
    }
    
}



