//
//  Logic.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 2/24/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import Foundation

class Logic {
    
    struct GlobalVariable {
        static var countOfGames = 0
        
        //value changes in TopicTableVC
        static var topicChosen = ""
        
        static var date = ""
        static var income = 0
        static var result = false
        static var numberOfQuestion = 0
        static var countOfQuestions = 0
        static var index = ""
        static var answers = ["" : ""]
        
        static var arrayArchiveOfGame: [Any] = []
        static var itemArrayArchiveOfGame: [String: Any] = [:]
        static var askedQuestions: [String] = [""]
        static var receivedAnswers: [String] = [""]
        static var rightAnswers: [String] = [""]
        static var userAnswersCheck: [Bool] = [false]
        
        static var url = "https://raw.githubusercontent.com/anastassyya/github/master/Resources%20for%20Millionaire/questions.json"
        
    }
}


