//
//  ChoiceWindow.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Lottie

class ChoiceWindowVC: UIViewController {
    
    let starAnimationView = AnimationView(name: "win")
    
    let logic = Logic.GlobalVariable.self
    
    var questionsObject = QuestionsVC()
    
    @IBAction func beginNewGame(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBOutlet weak var finishIncomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starAnimationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        starAnimationView.center = CGPoint(x: self.view.center.x, y: 100)
        
        view.addSubview(starAnimationView)
        starAnimationView.play()        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        finishIncomeLabel.text = "\(String(logic.income)) грн"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
}
