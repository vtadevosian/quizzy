//
//  UIAlertController+setCustomAlert.swift.swift
//  quizzy
//
//  Created by Vahram Tadevosian on 6/10/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

extension UIAlertController {
    func setCustomAlert() {
        
        let repeatQuiz = UIAlertAction(title: "Try again", style: .default, handler: { action in
            
        })
        self.addAction(repeatQuiz)
        
        let newQuiz = UIAlertAction(title: "Start new quiz", style: .default, handler: { action in
            
        })
        self.addAction(newQuiz)
        
        let goBackAction = UIAlertAction(title: "Go back", style: .cancel, handler: { action in
            self.dismiss(animated: true)
        })
        self.addAction(goBackAction)
    }
}
