//
//  InitialWindow.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class InitialWindowVC: UIViewController {
    
    
    let logic = Logic.GlobalVariable.self
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        logic.income = 0
        logic.result = false
        logic.arrayArchiveOfGame = []
        logic.itemArrayArchiveOfGame = [:]
        logic.askedQuestions = [""]
        logic.receivedAnswers = [""]
        logic.rightAnswers = [""]
        logic.userAnswersCheck = [false]
        logic.index = ""
    }
    
    
    @IBAction func goToArchiveOfGames(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcTopic = storyboard.instantiateViewController(withIdentifier: "ArchiveOfGamesVC_id") as? ArchiveOfGamesVC
        self.navigationController?.pushViewController(vcTopic!, animated: true)
    }
    
    
    @IBAction func newGameAction(_ sender: UIButton) {
        
        logic.countOfGames += 1
        logic.numberOfQuestion = 0
        
        //set date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        logic.date = formatter.string(from: Date())
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcTopic = storyboard.instantiateViewController(withIdentifier: "TopicTableViewController_id") as? TopicTableVC
        self.navigationController?.pushViewController(vcTopic!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
