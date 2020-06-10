//
//  UIView+setCorner.swift
//  quizzy
//
//  Created by Vahram Tadevosian on 6/10/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import UIKit

extension UIView{
    func setCorner(with radius:Int, borderWidth:Int = 0, color: UIColor = .clear){
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        self.clipsToBounds = true
    }
}
