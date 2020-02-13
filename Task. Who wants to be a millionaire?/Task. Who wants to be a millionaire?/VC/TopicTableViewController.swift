//
//  TopicTableViewController.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 2/11/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TopicTableViewController: UITableViewController {
    

    
    var topicDictionary = ["Живопись" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/painting.jpg", "Кино, театр" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/cinema.jpg", "Химия" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/khemistry.jpg", "Вопросы для детей" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/children.jpg", "Русский язык" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/russian.jpg", "Математика" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/mathematics.jpg", "Музыка" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/music.jpg", "География" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/geography.jpg", "История" : "https://raw.githubusercontent.com/anastassyya/github/master/Pictures/history.jpg"]
    
    var topicNameArray: [String] = []
    
    var topicUrlArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for name in topicDictionary.keys {
            topicNameArray.append (name)
        }
        
        for url in topicDictionary.values {
            topicUrlArray.append (url)
        }
        
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print (#function)
//        var array = readFromPlistQuestions()
    }


    func readFromPlistQuestions(cell: String) -> [QuestionsAndAnswers]  {
        
        var questionAndAnswers: QuestionsAndAnswers = QuestionsAndAnswers()
        var answerStructList = [QuestionsAndAnswers]()
        if let path = Bundle.main.path(forResource: "questions", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path),
                let questions = dict ["questions"] as? [String: Any] {
                if let topic = questions [cell] as? [AnyObject] {
                
                
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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return topicDictionary.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print (topicDictionary)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TopicTableViewCell
        
        let topic = topicNameArray[indexPath.row]
        
        cell.titleTopicLabel?.text = topic
        
        let link = topicUrlArray[indexPath.row]
        
        if let url = URL(string: link) {
        downloadImage(from: url, image: cell.topicImageView)
        }
    
        
        return cell

    }
    
    
    
    
    //        numberOfQuestion += 1
    
    // Do any additional setup after loading the view.

   

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

    func downloadImage(from url: URL, image: UIImageView) {
    getData(from: url) { data, response, error in
        guard let data = data, error == nil else { return }
        print(response?.suggestedFilename ?? url.lastPathComponent)
        print("Download Finished")
        DispatchQueue.main.async() {
            image.image = UIImage(data: data)
        
    }

    }
    }
        
        
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            let selectedTrail = topicNameArray[indexPath.row]
            if let viewController = storyboard?.instantiateViewController(withIdentifier: "Questions_id") as? Questions {
//                viewController.tempDescription = selectedTrail.description!
//                viewController.tempUsage = selectedTrail.usage!
//                viewController.tempSymbol = selectedTrail.symbol!
                viewController.topicChosen = selectedTrail
            navigationController?.pushViewController(viewController, animated: true)
                
            }
            print("Pressed section: \(indexPath.section), row: \(indexPath.row)")

        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
