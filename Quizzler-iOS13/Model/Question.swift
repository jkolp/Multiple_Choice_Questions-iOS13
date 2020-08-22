//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Projects on 8/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let choices : [String]
    let correctAnswer : String
    
    init(q: String, c: [String], ca: String){
        text = q
        choices = c
        correctAnswer = ca
    }
}


