//
//  ViewController.swift
//  Task 22
//
//  Created by Анастасия Вишневская on 1/7/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var emojis: [Emojis] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = createArray()
        
        // Do any additional setup after loading the view.
    }

    func createArray () -> [Emojis] {
        
        
        let emoji1 = Emojis(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness")
        let emoji2 = Emojis(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure")
        let emoji3 = Emojis(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive")
        let emoji4 = Emojis(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")
        let emoji5 = Emojis(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow")
        let emoji6 = Emojis(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory")
        let emoji7 = Emojis(symbol: "🍝", name: "Spaghetti",
                            description: "A plate of spaghetti.", usage: "spaghetti")
        let emoji8 = Emojis(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game")
        let emoji9 = Emojis(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
        let emoji10 = Emojis(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")
        let emoji11 = Emojis(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness")
        let emoji12 = Emojis(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness")
        let emoji13 = Emojis(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
        return [emoji1, emoji2, emoji3, emoji4, emoji5, emoji6, emoji7, emoji8, emoji9, emoji10, emoji11, emoji12, emoji13]
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.symbol
        cell.detailTextLabel?.text = emoji.name
        print (#function)
        return cell

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedTrail = emojis[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController_id") as? SecondViewController {
            viewController.tempDescription = selectedTrail.description!
            viewController.tempUsage = selectedTrail.usage!
            viewController.tempSymbol = selectedTrail.symbol!
 navigationController?.pushViewController(viewController, animated: true)
        }
   
                    }
                }
