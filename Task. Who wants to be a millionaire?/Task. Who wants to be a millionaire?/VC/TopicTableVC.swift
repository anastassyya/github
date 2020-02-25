//
//  TopicTableViewController.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 2/11/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TopicTableVC: UITableViewController {
    
    let logic = Logic.GlobalVariable.self
    
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
        logic.index = ""
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TopicTableViewCell
        
        let topic = topicNameArray[indexPath.row]
        
        cell.titleTopicLabel?.text = topic
        
        let link = topicUrlArray[indexPath.row]
        
        if let url = URL(string: link) {
            downloadImage(from: url, image: cell.topicImageView)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedTrail = topicNameArray[indexPath.row]
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Questions_id") as? QuestionsVC {
            
            logic.topicChosen = selectedTrail
            navigationController?.pushViewController(viewController, animated: true)
            
        }
    }
    
    //download image
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, image: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                image.image = UIImage(data: data)
                
            }
            
        }
    }
}
