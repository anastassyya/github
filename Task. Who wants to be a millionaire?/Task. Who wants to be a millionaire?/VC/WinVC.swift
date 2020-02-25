//
//  Win.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class WinVC: UIViewController {
    
    var questionsObject = QuestionsVC()
    
    let logic = Logic.GlobalVariable.self
    
    @IBOutlet weak var incomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func goToTopicVC () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TopicTableViewController_id") as! TopicTableVC
        navigationController!.pushViewController(vc, animated: false)
    }
    
    @IBAction func goToTopicVC(_ sender: UIButton) {
        goToTopicVC ()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        incomeLabel.text = "\(String(logic.income)) грн"
    }
    

    @IBAction func takeMoney(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChoiceWindow_id") as? ChoiceWindowVC
        logic.result = true
        questionsObject.saveToPlist ()
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func showAlert () {
        let alertController = UIAlertController(
            title: "Вы ответили на все вопросы этой темы. Выберите, пожалуйста, другую",
            message: nil,
            preferredStyle: UIAlertController.Style.alert)
        //чтобы отобразилось поверх сцены
        self.present(alertController, animated: true, completion: nil)
        
        alertController.addAction(UIAlertAction(title: "Перейти к другой теме", style: UIAlertAction.Style.default, handler: {action in self.goToTopicVC()}))
        
    }
    
    @IBAction func goToNextQuestion(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Questions_id") as? QuestionsVC
        
        if logic.index == "last" {
            showAlert ()
            
        }
        else {
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
