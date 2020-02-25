//
//  Losing.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Lottie

class LosingVC: UIViewController {
    
    let logic = Logic.GlobalVariable.self
    
    let wink  = AnimationView(name: "wink")

    var questionsObject = QuestionsVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wink.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        wink.center = CGPoint(x: self.view.center.x, y: 600)
        view.addSubview(wink)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.wink.play()
        }
        
        questionsObject.saveToPlist ()
        logic.result = false

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
