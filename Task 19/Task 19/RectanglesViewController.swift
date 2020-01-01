//
//  RectanglesViewController.swift
//  Task 19
//
//  Created by Анастасия Вишневская on 12/31/19.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class RectanglesViewController: UIViewController {

    @IBAction func goToLastController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let lastViewController = storyboard.instantiateViewController(withIdentifier: "LastViewController_id") as! LastViewController
        navigationController!.pushViewController(lastViewController, animated: false)
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
