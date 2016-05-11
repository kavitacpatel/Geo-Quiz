//
//  Country.swift
//  Geo
//
//  Created by kavita patel on 5/10/16.
//  Copyright © 2016 kavita patel. All rights reserved.
// canada, germany india japan usa

import Foundation

class Country: AnyObject
{
    var questions: Array<Questions>
    init()
    {
        questions = []
        questions.append(Questions(question: "What country was the first to land a man on the moon?", answers:["India", "USA", "Japan"], correctAnswerIndex: 1))
        questions.append(Questions(question: " Adidas and Volkswagen are companies from what country?", answers:["Japan", "India", "Germany"], correctAnswerIndex: 2))
        questions.append(Questions(question: "What country has a maple leaf on their national flag?", answers:["Canada", "USA", "Germany"], correctAnswerIndex: 0))
        questions.append(Questions(question: "Mount Fuji is the highest mountain in what country?", answers:["India", "Canada", "Japan"], correctAnswerIndex: 2))
    }
}