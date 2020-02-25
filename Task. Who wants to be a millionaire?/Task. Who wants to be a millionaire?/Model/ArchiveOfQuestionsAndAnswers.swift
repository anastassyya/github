//
//  File.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 2/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

struct ArchiveOfQuestionsAndAnswers {
    var question : [String] = []
    var rightAnswer : [String] = []
    var userAnswer : [String] = []
    var userAnswerCheck: [Bool] = [false]
    var sum: Int = 0
    var date: String = ""
    var countOfGames: Int = 0
    var result: Bool = false
    
    init (question : [String], rightAnswer : [String], userAnswer: [String], userAnswerCheck: [Bool], sum: Int, date: String, countOfGames: Int, result: Bool) {
        self.question = question
        self.rightAnswer = rightAnswer
        self.userAnswer = userAnswer
        self.userAnswerCheck = userAnswerCheck
        self.sum = sum
        self.date = date
        self.countOfGames = countOfGames
        self.result = result
        
    }
    
    
    
    //    var nsDictionary: NSDictionary {
    //        return dictionary as NSDictionary
    //
    //    }
    
}
