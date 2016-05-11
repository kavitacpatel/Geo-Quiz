//
//  Questions.swift
//  Geo
//
//  Created by kavita patel on 5/10/16.
//  Copyright © 2016 kavita patel. All rights reserved.
//

import Foundation

class Questions
{
        var question: String
        var answers: Array<String>
        var correctAnswerIndex: Int
        
        init(question: String,answers:Array<String>,correctAnswerIndex: Int)
        {
            self.question = question
            self.answers = answers
            self.correctAnswerIndex = correctAnswerIndex
        }
        
        func isGuessCorrect(guessNumber: Int) -> Bool
        {
            
            return correctAnswerIndex == Int(guessNumber-1)
            
        }
}