//
//  Win.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class Win: UIViewController {

    @IBOutlet weak var incomeLabel: UILabel!
    
    var tempNumberOfQuestion = 0
    var tempIncome = 0
    var tempTopicChosen = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        incomeLabel.text = String(tempIncome)
    }

    
    @IBAction func takeMoney(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChoiceWindow_id") as? ChoiceWindow
        
        vc?.finishIncome = tempIncome
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func goToNextQuestion(_ sender: UIButton) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "Questions_id") as? Questions
    vc?.numberOfQuestion = tempNumberOfQuestion
        vc?.income = tempIncome
        vc?.topicChosen = tempTopicChosen

    self.navigationController?.pushViewController(vc!, animated: true)
    
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
