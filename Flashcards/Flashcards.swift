//
//  Flashcards.swift
//  Flashcards
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    var answer : String
    var answers : [String]
    init(question : String, answers : [String]) {
        self.question = question
        self.answer = answers[0]
        self.answers = answers
    }
}

class CardCollection {
    public static var instance : CardCollection = CardCollection()
    public private(set) var cards : [Flashcard]
    public private(set) var currentIndex : Int
    public var currentCard : Flashcard {
        get {return cards[currentIndex]}
    }
    private init() {
        cards = [Flashcard(question: "What is 1 + 1?", answers: ["2", "3", "4", "5"])]
            currentIndex = 0;
    }
    func nextQuestion() {
        currentIndex += 1
        if currentIndex >= cards.count {
            currentIndex = 0
        }
    }
    func checkAnswer(selectedAnswer : Int) -> Bool {
        return currentCard.answers[selectedAnswer] == currentCard.answer
    }
}
