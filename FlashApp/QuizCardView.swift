//
//  QuizCardView.swift
//  FlashApp
//
//  Created by Audrey Welch on 4/3/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit

class QuizCardView: UIView {

    lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
            
        self.addSubview(imageView)
            
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -2).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -2).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
            
        return imageView
    }()
    
    lazy var fogView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
            
        self.addSubview(imageView)
            
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -2).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -2).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2).isActive = true
            
        return imageView
        
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 28)
        label.textColor = UIColor(white: 1, alpha: 0.75)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.baselineAdjustment = .alignCenters
        label.numberOfLines = 5
        
        self.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        
        let topLayoutGuide = UILayoutGuide()
        self.addLayoutGuide(topLayoutGuide)
        
        topLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topLayoutGuide.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topLayoutGuide.bottomAnchor.constraint(equalTo: buttons.first!.topAnchor).isActive = true
        
        label.centerYAnchor.constraint(equalTo: topLayoutGuide.centerYAnchor).isActive = true

        return label
    }()
    
    lazy var buttons: [QuizButton] = {
        
        // Button 1
        let button1 = QuizButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.text = "Button 1"
        self.addSubview(button1)
        
        button1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        button1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        // Button 2
        let button2 = QuizButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.text = "Button 2"
        self.addSubview(button2)
        
        button2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        button2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        // Button 3
        let button3 = QuizButton()
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.text = "Button 3"
        self.addSubview(button3)
        
        button3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        button3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        button3.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        button2.bottomAnchor.constraint(equalTo: button3.topAnchor, constant: -18).isActive = true
        button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -18).isActive = true
        

        return [button1, button2, button3]
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
        
    func createSubviews() {
            
        backgroundView.image = UIImage(named: "QuizCardBackground")
        questionLabel.text = "Which of the following are reference types?"
        buttons[0].text = "Array"
        buttons[1].text = "Data"
        buttons[2].text = "NSString"
        
        
        fogView.image = UIImage(named: "QuizCardMask")
        fogView.tintColor = .white
        fogView.isUserInteractionEnabled = false
        fogView.alpha = 0
    }


}
