//
//  Structs.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

struct QuestionsAndAnswers {
    var question : String?
    var answers : [String]?
    var rightAnswerIndex : Int?
    
    init (question : String? = nil, answers : [String]? = nil, rightAnswerIndex : Int? = nil) {
        self.question = question
        self.answers = answers
        self.rightAnswerIndex = rightAnswerIndex
        
    }

}

struct ArchiveOfQuestionsAndAnswers {
    var question : String?
    var rightAnswer : String?
    var userAnswer : String?
    var userAnswerCheck: Bool?
    
    
    init (question : String? = nil, rightAnswer : String? = nil, userAnswer: String? = nil, userAnswerCheck: Bool? = nil) {
        self.question = question
        self.rightAnswer = rightAnswer
        self.userAnswer = userAnswer
        self.userAnswerCheck = userAnswerCheck
        
        
    }
    
}



