//
//  Questions.swift
//  Task. Who wants to be a millionaire?
//

//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit
import Lottie


class QuestionsVC: UIViewController {
    
    let logic = Logic.GlobalVariable.self
    
    let confirmation = AnimationView(name: "confirmation")
    let failure = AnimationView(name: "failure")
    let expectation = AnimationView(name: "expectation")
    
    
    var array = [QuestionsAndAnswers]()
    var arrayButtonsTag: [UIButton] = []
    
    var rightAnswerIndex = 0
    var rightAnswerText = ""
    var statusOfAnswer = false
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerFirstButton: UIButton!
    
    @IBOutlet weak var answerFourthButton: UIButton!
    
    @IBOutlet weak var answerThirdButton: UIButton!
    
    @IBOutlet weak var answerSecondButton: UIButton!
    
    @IBOutlet weak var helpLabel: UIButton!
    
    @IBOutlet weak var callLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmation.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        confirmation.center = CGPoint(x: self.view.center.x, y: 100)
        view.addSubview(confirmation)
        confirmation.isHidden = true
        
        failure.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        failure.center = CGPoint(x: self.view.center.x, y: 80)
        view.addSubview(failure)
        failure.isHidden = true
        
        expectation.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        expectation.center = self.view.center
        view.addSubview(expectation)
        expectation.isHidden = false
        self.expectation.play()
        self.expectation.loopMode = .autoReverse
        
        arrayButtonsTag = [answerFirstButton, answerSecondButton, answerThirdButton, answerFourthButton]
        
        hideElementsView ()
        
        answerFirstButton.titleLabel!.numberOfLines = 2
        answerSecondButton.titleLabel!.numberOfLines = 2
        answerThirdButton.titleLabel!.numberOfLines = 2
        answerFourthButton.titleLabel!.numberOfLines = 2
        
        //Get data from json. If it's not possible we load it from plist
        getDataFromJson(url: logic.url, topicChosen: logic.topicChosen)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readFromPlistQuestions), name: Notification.Name("load from plist"), object: nil)
    }
    
    
    func hideElementsView () {
        answerFirstButton.isHidden = true
        answerSecondButton.isHidden = true
        answerThirdButton.isHidden = true
        answerFourthButton.isHidden = true
        questionLabel.isHidden = true
        helpLabel.isHidden = true
        callLabel.isHidden = true
    }
    
    func showElements() {
        answerFirstButton.isHidden = false
        answerSecondButton.isHidden = false
        answerThirdButton.isHidden = false
        answerFourthButton.isHidden = false
        questionLabel.isHidden = false
        helpLabel.isHidden = false
        callLabel.isHidden = false
    }
    
    @IBAction func helpfForFindingAnswer(_ sender: UIButton) {
        for (index, value) in arrayButtonsTag.enumerated() {
            if index == rightAnswerIndex {
                DispatchQueue.main.async {
                    value.backgroundColor = .yellow
                }
            }
        }
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        logic.countOfQuestions += 1
        
        for (index, _) in arrayButtonsTag.enumerated() {
            if sender.tag == rightAnswerIndex {
                
                DispatchQueue.main.async {
                    sender.backgroundColor = .green
                    self.arrayButtonsTag[index].setTitleColor(.black, for: .normal)
                }
            }
            
            if index != rightAnswerIndex {
                
                DispatchQueue.main.async {
                    
                    self.arrayButtonsTag[index].backgroundColor = .red
                    self.arrayButtonsTag[index].setTitleColor(.black, for: .normal)
                }
            }
            else {
                arrayButtonsTag[index].backgroundColor = .green
                arrayButtonsTag[index].setTitleColor(.black, for: .normal)
                
            }
            
        }
        
        if sender.tag == rightAnswerIndex {
            //logic.numberOfQuestion += 1
            logic.income += 500
            statusOfAnswer = true
            logic.answers.updateValue(sender.currentTitle!, forKey: questionLabel.text!)
            
            self.confirmation.isHidden = false
            self.confirmation.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Win_id") as? WinVC
                
                self.savetoArchive (sender: sender)
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        else {
            logic.answers.updateValue(questionLabel.text!, forKey: sender.currentTitle!)
            
            self.failure.isHidden = false
            self.failure.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Losing_id") as? LosingVC
                self.savetoArchive (sender: sender)
                self.navigationController?.pushViewController(vc!, animated: true)
                
            }
        }
    }
    
    func savetoArchive (sender: UIButton) {
        
        if logic.askedQuestions == [""] {
            logic.askedQuestions = [questionLabel.text!]
        }
        else {
            logic.askedQuestions.append(questionLabel.text!)
        }
        if logic.receivedAnswers == [""]  {
            logic.receivedAnswers = [sender.currentTitle!]
        }
        else {
            logic.receivedAnswers.append(sender.currentTitle!)
        }
        
        if logic.rightAnswers == [""]  {
            logic.rightAnswers = [rightAnswerText]
        }
        else {
            logic.rightAnswers.append(rightAnswerText)
        }
        
        if  logic.userAnswersCheck == [false]  {
            
            logic.userAnswersCheck = [statusOfAnswer]
        }
        else {
            logic.userAnswersCheck.append(statusOfAnswer)
        }
    }
    
    
    
    
    func iterationQuestions (array: [QuestionsAndAnswers]) {
        
        /*
         if questionLabel.text == "Label" {
         hideElementsView ()
         showAlert()
         }
         */
        
        expectation.isHidden = true
        
        showElements()
        
        
        
        for (index, newQuestion) in array.enumerated()  {
            
            if self.logic.askedQuestions.contains(newQuestion.question) == false {
                print ("===== \(array)")
                questionLabel.text = newQuestion.question
                answerFirstButton.setTitle (newQuestion.answers[0], for: .normal)
                answerSecondButton.setTitle (newQuestion.answers[1], for: .normal)
                answerThirdButton.setTitle (newQuestion.answers[2], for: .normal)
                answerFourthButton.setTitle (newQuestion.answers[3], for: .normal)
                rightAnswerIndex = newQuestion.rightAnswerIndex
                rightAnswerText = newQuestion.answers[rightAnswerIndex]
                print (index)
                
                if array.count-1 == index {
                    print ("in cycle \(index)")
                    print ("array.count-1 \(array.count-1)")
                    
                    logic.index = "last"
                    
                }
                
                break
            }
            
        }
        
        
        
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
    
    func goToTopicVC () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TopicTableViewController_id") as! TopicTableVC
        navigationController!.pushViewController(vc, animated: false)
    }
    
    
    //save to documents of user
    func saveToPlist() {
        //получение папки Documents
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        //получение полного пути файла
        let customPlistURL = docsBaseURL.appendingPathComponent("userAnswers.plist")
        
        
        logic.itemArrayArchiveOfGame = ["question": logic.askedQuestions, "rightAnswer": logic.rightAnswers, "userAnswer": logic.receivedAnswers, "userAnswerCheck": logic.userAnswersCheck, "sum": logic.income, "date": logic.date, "countOfGames": logic.countOfGames, "result" : logic.result]
        
        
        
        if var tempArrayArchiveOfGame = NSArray(contentsOf: customPlistURL) as? [[String : Any]] {
            
            tempArrayArchiveOfGame.append(logic.itemArrayArchiveOfGame)
            
            
            NSArray(array: tempArrayArchiveOfGame).write(to: customPlistURL, atomically: true)
        }
        else {
            NSArray(array: [logic.itemArrayArchiveOfGame]).write(to: customPlistURL, atomically: true)
        }
    }
    
    
    
    @objc func readFromPlistQuestions() {
        
        var questionAndAnswers: QuestionsAndAnswers = QuestionsAndAnswers(question: "", answers: [""], rightAnswerIndex: 0)
        var answerStructList = [QuestionsAndAnswers]()
        
        if let path = Bundle.main.path(forResource: "questions", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [AnyObject] {
                
                for item in array {
                    if let topic = item[logic.topicChosen] as? [AnyObject] {
                        for oneQuestion in topic {
                            if let question = oneQuestion["question"] as? String,
                                let answers = oneQuestion["answers"] as? [String],
                                let rightAnswerIndex = oneQuestion["rightAnswerIndex"] as? Int {
                                questionAndAnswers = QuestionsAndAnswers(question: question, answers: answers, rightAnswerIndex: rightAnswerIndex)
                                
                                answerStructList.append(questionAndAnswers)
                                DispatchQueue.main.async {
                                    self.iterationQuestions(array: answerStructList)
                                    print ("load from Plist")
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func getDataFromJson(url: String, topicChosen: String) {
        var questionAndAnswers: QuestionsAndAnswers = QuestionsAndAnswers(question: "", answers: [""], rightAnswerIndex: 0)
        var answerStructList = [QuestionsAndAnswers]()
        let url = URL(string: url)!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                
                print("ERROR!!!  error: \(String(describing: error))")
                NotificationCenter.default.post(name: Notification.Name("load from plist"), object: nil)
                print ("load from plist")
                return
            }
            
            guard let data = data else {
                self.expectation.isHidden = false
                self.expectation.play()
                self.expectation.loopMode = .autoReverse
                print("ERROR!!!  data == nil")
                return
            }
            
            do {
                if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyObject] {
                    for item in arrayOfJsonObjects {
                        if let topic = item[topicChosen] as? [[String: Any]] {
                            for oneQuestion in topic {
                                if let question = oneQuestion["question"] as? String,
                                    let answers = oneQuestion["answers"] as? [String],
                                    let rightAnswerIndex = oneQuestion["rightAnswerIndex"] as? Int {
                                    questionAndAnswers = QuestionsAndAnswers(question: question, answers: answers, rightAnswerIndex: rightAnswerIndex)
                                    answerStructList.append(questionAndAnswers)
                                    DispatchQueue.main.async {
                                        self.iterationQuestions(array: answerStructList)
                                        print ("load from Json")
                                    }
                                }
                            }
                        }
                    }
                }
                else {
                    print("json == nil")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
        
    }
}

