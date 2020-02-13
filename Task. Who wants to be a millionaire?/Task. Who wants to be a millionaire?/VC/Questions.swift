//
//  Questions.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class Questions: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var array = [QuestionsAndAnswers]()
    var arrayButtonsTag: [UIButton] = []
    var arrayArchiveOfGame: [ArchiveOfQuestionsAndAnswers] = []
    var itemArrayArchiveOfGame: ArchiveOfQuestionsAndAnswers = ArchiveOfQuestionsAndAnswers()
    var numberOfQuestion = 0
    var rightAnswerIndex = 0
    var rightAnswerText = ""
    var income = 0
    var statusOfAnswer = false
    var topicChosen = ""
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answerFirstButton: UIButton!
    
    @IBOutlet weak var answerFourthButton: UIButton!
    
    @IBOutlet weak var answerThirdButton: UIButton!
    
    @IBOutlet weak var answerSecondButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print (#function)
        print ("topicchosen\(topicChosen)")
        array = readFromPlistQuestions()
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
        
        
        for (index, _) in arrayButtonsTag.enumerated() {
            if sender.tag == rightAnswerIndex {
                DispatchQueue.main.async {
                    sender.backgroundColor = .green
                    
                    print (self.income)
                    
                }
            }
            if index != rightAnswerIndex {
                DispatchQueue.main.async {
                    self.arrayButtonsTag[index].backgroundColor = .red
                    
                    
                }
            }
            else {
                arrayButtonsTag[index].backgroundColor = .green
            }
            
        
        }
        
        if sender.tag == rightAnswerIndex {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.numberOfQuestion += 1
                self.income += 500
                self.statusOfAnswer = true
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Win_id") as? Win
                vc?.tempNumberOfQuestion = self.numberOfQuestion
                vc?.tempIncome = self.income
                vc?.tempTopicChosen = self.topicChosen
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Losing_id") as? Losing
                
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            itemArrayArchiveOfGame = ArchiveOfQuestionsAndAnswers(question: questionLabel.text, rightAnswer: rightAnswerText, userAnswer: sender.currentTitle, userAnswerCheck: statusOfAnswer)
            arrayArchiveOfGame.append(itemArrayArchiveOfGame)
            
            
        }
    
//
//        //получение папки Documents
//        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        //получение полного пути файла
//        let customPlistURL = docsBaseURL.appendingPathComponent("custom.plist")
//        //сохранение customDict в файл customPlistURL
//        NSDictionary(dictionary: customDict).write(to: customPlistURL, atomically: true)
    }
    
    
    
    
    
    
    func iterationQuestions () {
        for (index, value) in array.enumerated()  {
            if numberOfQuestion == index {
                questionLabel.text = value.question
                answerFirstButton.setTitle (value.answers![0], for: .normal)
                answerSecondButton.setTitle (value.answers![1], for: .normal)
                answerThirdButton.setTitle (value.answers![2], for: .normal)
                answerFourthButton.setTitle (value.answers![3], for: .normal)
                rightAnswerIndex = value.rightAnswerIndex!
                rightAnswerText = value.answers![rightAnswerIndex]
                print (index)
            }
        }
    }
    
    
    func readFromPlistQuestions() -> [QuestionsAndAnswers]  {
        
        var questionAndAnswers: QuestionsAndAnswers = QuestionsAndAnswers()
        var answerStructList = [QuestionsAndAnswers]()
        
        if let path = Bundle.main.path(forResource: "questions", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path),
                let questions = dict ["questions"] as? [String: Any] {
                print (type(of: questions))
                if let topic = questions [topicChosen] as? [AnyObject] {
                    print ("====topic\(topic)")
                
                for oneQuestion in topic {
                    if let question = oneQuestion["question"] as? String,
                        let answers = oneQuestion["answers"] as? [String],
                        let rightAnswerIndex = oneQuestion["rightAnswerIndex"] as? Int {
                        questionAndAnswers = QuestionsAndAnswers(question: question, answers: answers, rightAnswerIndex: rightAnswerIndex)
                        
                        answerStructList.append(questionAndAnswers)
                        
                    }
                        
                    }
                    
                    
                }
            }
        }
        return answerStructList
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayButtonsTag = [answerFirstButton, answerSecondButton, answerThirdButton, answerFourthButton]
        print (#function)
        array = readFromPlistQuestions()
        iterationQuestions ()
        
            print("Begin of code")
            let url = URL(string: "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/cvety-gory-pejzazh-priroda-rasteniya-41477.jpg")!
//            downloadImage(from: url)
            print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")

        
        //        numberOfQuestion += 1
        
        // Do any additional setup after loading the view.
        
    }

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

//func downloadImage(from url: URL) {
//    print("Download Started")
//    getData(from: url) { data, response, error in
//        guard let data = data, error == nil else { return }
//        print(response?.suggestedFilename ?? url.lastPathComponent)
//        print("Download Finished")
//        DispatchQueue.main.async() {
//            self.imageView.image = UIImage(data: data)
//            print (data)
//        }
//    }
//}
    
//
//    if let url = imageURL {
//        spinner?.startAnimating()
//        DispatchQueue.global(qos: .userInitiated).async {
//            let contentsOfURL = try? Data(contentsOf: url)
//            DispatchQueue.main.async {
//                if url == self.imageURL {
//                    if let imageData = contentsOfURL {
//                        self.tImage?.image = UIImage(data: imageData)
//                    }
//                    self.spinner?.stopAnimating()
//                }
//            }
//        }
//    }
//}
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


//@IBAction func saveToMyFilePlistAction(_ sender: Any) {
//
//    let customDict = ["Vasya": "Vasiliev",
//                      "Petya": "Petrov"]
//
//    //получение папки Documents
//    let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    //получение полного пути файла
//    let customPlistURL = docsBaseURL.appendingPathComponent("custom.plist")
//    //сохранение customDict в файл customPlistURL
//    NSDictionary(dictionary: customDict).write(to: customPlistURL, atomically: true)
//}
//
//@IBAction func loadFromMyFilePlist(_ sender: Any) {
//    let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    let customPlistURL = docsBaseURL.appendingPathComponent("custom.plist")
//    let customDict = NSDictionary(contentsOf: customPlistURL) as? [String : AnyObject]
//
//    plistReadWriteLabel.text = "customDict: \(customDict)"
//    print("customDict: \(customDict)")
//}
