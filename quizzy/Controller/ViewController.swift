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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quiz = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonsUI()
        setUpProgressViewUI()
        quiz.generate()
        updateUI()
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let answeredCorrectly = quiz.answeredCorrectly(sender.titleLabel?.text)
        sender.backgroundColor = answeredCorrectly ? #colorLiteral(red: 0, green: 0.6110293865, blue: 0.1098476723, alpha: 1) : #colorLiteral(red: 1, green: 0, blue: 0.1511215568, alpha: 1)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
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
        progressView.progress = 0
    }
    
    @objc private func updateUI() {
        quiz.nextQuestion()

        if quiz.isFinished {
            let percentage = quiz.getPercentage()
            let alertTitleGreeting: String = percentage == 100.0 ? "Excellent!" : (percentage > 70.0 ? "Not bad!" : (percentage > 30.0 ? "You could have done better." : "Too bad..."))
            let alertTitle = alertTitleGreeting + " Your total score is \(percentage)%."
            let alert = UIAlertController(title: alertTitle, message: "What would you wanna do next?", preferredStyle: .alert)

            let repeatQuiz = UIAlertAction(title: "Repeat", style: .default, handler: { _ in
                self.quiz.reset()
                self.progressView.progress = 0
                self.updateUI()
            })
            alert.addAction(repeatQuiz)
            
            let newQuiz = UIAlertAction(title: "Start a new quiz", style: .default, handler: { _ in
                self.quiz.generate()
                self.progressView.progress = 0
                self.updateUI()
            })
            alert.addAction(newQuiz)
            
            let goBackAction = UIAlertAction(title: "Go back", style: .cancel, handler: { _ in
                alert.dismiss(animated: true)
            })
            alert.addAction(goBackAction)
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            questionLabel.text = quiz.getCurrentQuestionText()
            questionNoLabel.text = quiz.getCurrentQuestionNoText()
            progressView.progress += Float(quiz.getProgressStep())
            scoreLabel.text = quiz.getScore()
        }
        
        answerButtons.forEach { button in
            button.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1333333333, blue: 0.2666666667, alpha: 1)
        }
    }
}
