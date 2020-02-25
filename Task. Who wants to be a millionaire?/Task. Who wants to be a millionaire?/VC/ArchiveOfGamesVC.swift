//
//  ArchiveOfGames.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class ArchiveOfGamesVC: UITableViewController {
    
    let logic = Logic.GlobalVariable.self
    
    var array : [Any] = []
    
    var arrayArchiveOfGame = [ArchiveOfQuestionsAndAnswers]()
    var itemArrayArchiveOfGame: ArchiveOfQuestionsAndAnswers = ArchiveOfQuestionsAndAnswers(question: [""], rightAnswer: [""], userAnswer: [""], userAnswerCheck: [false], sum: 0, date: "", countOfGames: 0, result: false)
    
    var pasteBoard = UIPasteboard.general
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
            navigationItem.rightBarButtonItem = editButtonItem
        navigationController?.navigationBar.topItem?.title = "Back"
            arrayArchiveOfGame = loadFromPlistQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        self.navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 22, green: 54, blue: 184, alpha: 1)
    }
    
    func loadFromPlistQuestions() -> [ArchiveOfQuestionsAndAnswers]  {
        
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let customPlistURL = docsBaseURL.appendingPathComponent("userAnswers.plist")
        if let userAnswers = NSArray(contentsOf: customPlistURL) as? [[String: Any]] {
            for item in userAnswers {
                if let userAnswerCheck = item["userAnswerCheck"] as? [Bool], let date = item["date"] as? String, let userAnswer = item["userAnswer"] as? [String], let rightAnswer = item["rightAnswer"] as? [String], let sum = item["sum"] as? Int, let question = item["question"] as? [String], let countOfGames = item ["countOfGames"] as? Int, let result = item["result"] as? Bool  {
                    itemArrayArchiveOfGame = ArchiveOfQuestionsAndAnswers(question: question, rightAnswer: rightAnswer, userAnswer: userAnswer, userAnswerCheck: userAnswerCheck, sum: sum, date: date, countOfGames: countOfGames, result: result)
                    arrayArchiveOfGame.append (itemArrayArchiveOfGame)
                    
                }
            }
        }
        
        tableView.reloadData()
        return arrayArchiveOfGame
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return arrayArchiveOfGame.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ArchiveOfGamesTableViewCell
        
        let title = arrayArchiveOfGame[indexPath.row]
        if title.result == true {
            cell.textLabel?.text = "\(title.sum) грн - количество ответов (\(title.userAnswer.count))"
            cell.detailTextLabel?.text = title.date
        }
        else {
            cell.textLabel?.text = "Проигрыш 0 грн - количество ответов (\(title.userAnswer.count))"
            cell.detailTextLabel?.text = title.date
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.green
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        //header.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "История игры"
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "ArchiveGameDetailVC_id") as? ArchiveGameDetailVC {
            let itemArray = arrayArchiveOfGame[indexPath.row]
            
            if itemArray.result {
                
                viewController.textIncomeLabel  = String("Выигрыш \(itemArray.sum) грн")
                viewController.result = true
            }
            else {
                
                viewController.textIncomeLabel  = String("Проигрыш")
                viewController.result = false
                
            }
            var label = "Ответы: \n"
            var textQuestion = ""
            
            
            var count = 0
            for (index, value) in itemArray.question.enumerated() {
                var text = ""
                count += 1
                textQuestion += "\(count). \(itemArray.question[index])."
                text += " \(itemArray.userAnswer[index])\r"
                textQuestion += text
            }
            
            label += textQuestion
            
            viewController.textDetailDataLabel = label
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayArchiveOfGame.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
   
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrayArchiveOfGame[sourceIndexPath.row]
        arrayArchiveOfGame.remove(at: sourceIndexPath.row)
        arrayArchiveOfGame.insert(item, at: destinationIndexPath.row)
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if (action == #selector(UIResponderStandardEditActions.copy(_:))) {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        let cell = tableView.cellForRow(at: indexPath)
        pasteBoard.string = cell!.textLabel?.text
    }
}



