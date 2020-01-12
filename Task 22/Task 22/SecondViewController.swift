//
//  SecondViewController.swift
//  Task 22
//
//  Created by Анастасия Вишневская on 1/8/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var tempDescription: String = ""
    var tempUsage: String = ""
    var tempSymbol: String = ""
    
    
    @IBOutlet weak var descriptionEmoji: UILabel!
    
    @IBOutlet weak var usageEmoji: UILabel!
    
    @IBOutlet weak var symbolEmoji: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionEmoji.text = tempDescription
        usageEmoji.text = tempUsage
        symbolEmoji.text = tempSymbol
        

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
