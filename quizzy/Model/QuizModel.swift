//
//  QuizModel.swift
//  quizzy
//
//  Created by Vahram Tadevosian on 6/10/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

struct QuizModel {
    private var questionCount: Int
    private var currentQuiz = [Question]()
    private var currentQuestionNo = 0
    private var score = 0
    private var _isFinished = false
    
    var isFinished: Bool {
        return _isFinished
    }
    
    init(questionCount: Int = 15) {
        self.questionCount = questionCount
    }

    private let questionList: [Question] = [
        Question(text: "Tomatoes are vegetables.",
                 answer: "FALSE"),
        Question(text: "There are McDonald's on every continent except one.",
                 answer: "TRUE"),
        Question(text: "America is the world's most populous country.",
                 answer: "FALSE"),
        Question(text: "Sonic the Hedgehog has an actual name.",
                 answer: "TRUE"),
        Question(text: "In Japan they grow triangular watermelons.",
                 answer: "FALSE"),
        Question(text: "Dinosaurs in \"Jurrasic Park\" have feathers.",
                 answer: "FALSE"),
        Question(text: "Both Nicolas Cage and Michael Jackson were married to the same woman.",
                 answer: "TRUE"),
        Question(text: "Most of the world's countries have used atomic weapons in war.",
                 answer: "FALSE"),
        Question(text: "Bananas are the most widely sold items in Walmart.",
                 answer: "TRUE"),
        Question(text: "Humans are the only animals that bury their dead.",
                 answer: "FALSE"),
        Question(text: "A large chunk of Iceland's population believes in elves.",
                 answer: "TRUE"),
        Question(text: "There are 115 bridges over the Amazon River.",
                 answer: "FALSE"),
        Question(text: "Vietnamese is an official language in Canada.",
                 answer: "FALSE"),
        Question(text: "Dogs are banned from an entire continent.",
                 answer: "TRUE"),
        Question(text: "All tigers have unique stripes.",
                 answer: "TRUE"),
        Question(text: "Stars are just bright planets.",
                 answer: "FALSE"),
        Question(text: "Brains have no fat in them.",
                 answer: "FALSE"),
        Question(text: "The film \"Titanic\" was directed by Quentin Tarantino.",
                 answer: "FALSE"),
        Question(text: "Pennies cost more to make than they are worth.",
                 answer: "TRUE"),
        Question(text: "Cheese filled with live maggots is a Mediterranean delicacy.",
                 answer: "TRUE"),
        Question(text: "Puerto Rico is a U.S. state.",
                 answer: "FALSE"),
        Question(text: "People have danced themselves to death.",
                 answer: "TRUE"),
        Question(text: "The darker your skin, the less damage the sun can do to your skin.",
                 answer: "FALSE"),
        Question(text: "Ancient Romans used to use urine to whiten their teeth.",
                 answer: "TRUE"),
        Question(text: "If you took all of the blood vessels out of the human body they could stretch around the world.",
                 answer: "TRUE"),
        Question(text: "Humans are the only animals that can laugh.",
                 answer: "TRUE"),
        Question(text: "Lemons can cure cancer.",
                 answer: "FALSE"),
        Question(text: "Ants live longer than most dogs.",
                 answer: "TRUE"),
        Question(text: "All rivers flow west.",
                 answer: "FALSE"),
        Question(text: "The show \"Breaking Bad\" was initially turned down.",
                 answer: "TRUE"),
        Question(text: "Octopuses are intelligent creatures.",
                 answer: "TRUE"),
        Question(text: "Russia's area is larger than Pluto.",
                 answer: "TRUE"),
        Question(text: "Octopuses are intelligent creatures.",
                 answer: "TRUE"),
        Question(text: "All babies are born totally blind.",
                 answer: "FALSE"),
        Question(text: "A slug's blood is green.",
                 answer: "TRUE"),
        Question(text: "Approximately one quarter of human bones are in the feet.",
                 answer: "TRUE"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.",
                 answer: "TRUE"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
                 answer: "TRUE"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
                 answer: "FALSE"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.",
                 answer: "TRUE"),
        Question(text: "You can lead a cow down stairs but not up stairs.",
                 answer: "FALSE"),
        Question(text: "Google was originally called 'Backrub'.",
                 answer: "TRUE"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.",
                 answer: "TRUE"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
                 answer: "FALSE"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.",
                 answer: "FALSE"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
                 answer: "TRUE")
    ]
    
    mutating func generate() {
        guard questionCount > 0 && questionCount < questionList.count else { return }
        
        currentQuiz = Array(questionList.shuffled().suffix(questionCount))
    }
    
    mutating func nextQuestion() {
        currentQuestionNo += 1
        _isFinished = currentQuestionNo > questionCount
    }
    
    mutating func answeredCorrectly(_ userAnswer: String?) -> Bool {
        guard let userAnswer = userAnswer else { return false }
        let answeredCorrectly = currentQuiz[currentQuestionNo - 1].answer == userAnswer
        score += answeredCorrectly ? 1 : 0
        return answeredCorrectly
    }
    
    func getCurrentQuestionNoText() -> String {
        return "Question \(currentQuestionNo)/\(questionCount):"
    }
    
    func getCurrentQuestionText() -> String {
        return currentQuiz[currentQuestionNo - 1].text
    }
    
    func getProgressStep() -> Float {
        return 1 / Float(questionCount)
    }
    
    func getScore() -> String {
        return "Score: \(score)"
    }
    
}
