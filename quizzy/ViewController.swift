//
//  ViewController.swift
//  quizzy
//
//  Created by Vahram Tadevosian on 6/10/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let questionCount = 15
    var currentQuiz = [Question]()
    var currentQuestionNo = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonsUI()
        setUpProgressViewUI()
        currentQuiz = Question.generateRandomQuiz(questionCount: questionCount)
        nextQuestion()
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let answeredCorrectly = sender.titleLabel?.text == currentQuiz[currentQuestionNo - 1].answer
        sender.backgroundColor = answeredCorrectly ? #colorLiteral(red: 0, green: 0.6110293865, blue: 0.1098476723, alpha: 1) : #colorLiteral(red: 1, green: 0, blue: 0.1511215568, alpha: 1)
        currentQuestionNo += 1
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(nextQuestion), userInfo: nil, repeats: false)
        
    }
    
    private func setUpButtonsUI() {
        answerButtons.forEach { button in
            print(button.frame.size.width)
            button.layer.cornerRadius = button.frame.size.height / 3.5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    private func setUpProgressViewUI() {
        progressView.clipsToBounds = true
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
        progressView.setCorner(with: 8)
    }
    
    @objc private func nextQuestion() {
        if currentQuestionNo <= questionCount {
            questionLabel.text = currentQuiz[currentQuestionNo - 1].text
            questionNoLabel.text = "Question \(currentQuestionNo)/\(questionCount):"
            answerButtons.forEach { button in
                button.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1333333333, blue: 0.2666666667, alpha: 1)
            }
        } else {
            answerButtons.forEach { button in
                button.isEnabled = false
            }
        }
    }
}
