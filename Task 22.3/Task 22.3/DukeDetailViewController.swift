//
//  DukeDetailViewController.swift
//  Task 22.3
//
//  Created by Анастасия Вишневская on 1/10/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit


class DukeDetailViewController: UIViewController {
    
    var name: String = ""
    var dynasty: String = ""

    @IBOutlet weak var dukeName: UITextField!
    
    @IBOutlet weak var dukeDynasty: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            name = dukeName.text!
            dynasty = dukeDynasty.text!
            
        }
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
