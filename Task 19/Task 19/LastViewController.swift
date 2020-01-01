//
//  LastViewController.swift
//  Task 19
//
//  Created by Анастасия Вишневская on 12/31/19.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {


    
    @IBAction func goToPreviousPage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func goToRootController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
