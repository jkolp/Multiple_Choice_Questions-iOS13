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


