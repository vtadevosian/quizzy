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
            answerButtons.forEach { button in
                button.isEnabled = false
            }
            return
        }
        
        questionLabel.text = quiz.getCurrentQuestionText()
        questionNoLabel.text = quiz.getCurrentQuestionNoText()
        progressView.progress += quiz.getProgressStep()
        scoreLabel.text = quiz.getScore()
        
        answerButtons.forEach { button in
            button.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1333333333, blue: 0.2666666667, alpha: 1)
        }
    }
}
