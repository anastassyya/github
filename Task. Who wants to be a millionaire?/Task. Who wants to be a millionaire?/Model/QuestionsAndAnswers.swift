//
//  Structs.swift
//  Task. Who wants to be a millionaire?
//
//  Created by Анастасия Вишневская on 1/19/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

struct QuestionsAndAnswers {
    var question : String = ""
    var answers : [String] = [""]
    var rightAnswerIndex : Int = 0
    
    init (question : String, answers : [String], rightAnswerIndex : Int) {
        self.question = question
        self.answers = answers
        self.rightAnswerIndex = rightAnswerIndex
        
    }

}









