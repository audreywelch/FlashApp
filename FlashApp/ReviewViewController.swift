//
//  ReviewViewController.swift
//  FlashApp
//
//  Created by Audrey Welch on 4/2/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    override func loadView() {
        let rootView = UIView()
        rootView.backgroundColor = UIColor(named: "CardBackground")
        
        // Normal
        let quizButtonWaiting = QuizButton()
        quizButtonWaiting.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(quizButtonWaiting)

        quizButtonWaiting.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButtonWaiting.heightAnchor.constraint(equalToConstant: 64).isActive = true

        quizButtonWaiting.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        quizButtonWaiting.centerYAnchor.constraint(equalTo: rootView.centerYAnchor, constant: 18).isActive = true
        
        
        // Chosen Correct
        let quizButtonChosenCorrect = QuizButton()
        quizButtonChosenCorrect.buttonState = .chosenCorrect
        quizButtonChosenCorrect.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(quizButtonChosenCorrect)
        
        quizButtonChosenCorrect.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButtonChosenCorrect.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        quizButtonChosenCorrect.centerXAnchor.constraint(equalTo: quizButtonWaiting.centerXAnchor).isActive = true
        quizButtonChosenCorrect.topAnchor.constraint(equalTo: quizButtonWaiting.bottomAnchor, constant: 18).isActive = true
        
        
        // Chosen Incorrect
        let quizButtonChosenIncorrect = QuizButton()
        quizButtonChosenIncorrect.buttonState = .chosenIncorrect
        quizButtonChosenIncorrect.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(quizButtonChosenIncorrect)
        
        quizButtonChosenIncorrect.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButtonChosenIncorrect.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        quizButtonChosenIncorrect.centerXAnchor.constraint(equalTo: quizButtonChosenCorrect.centerXAnchor).isActive = true
        quizButtonChosenIncorrect.topAnchor.constraint(equalTo: quizButtonChosenCorrect.bottomAnchor, constant: 18).isActive = true
        
        
        // Not Chosen
        let quizButtonNotChosen = QuizButton()
        quizButtonNotChosen.buttonState = .notChosen
        quizButtonNotChosen.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(quizButtonNotChosen)
        
        quizButtonNotChosen.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButtonNotChosen.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        quizButtonNotChosen.centerXAnchor.constraint(equalTo: quizButtonChosenIncorrect.centerXAnchor).isActive = true
        quizButtonNotChosen.topAnchor.constraint(equalTo: quizButtonChosenIncorrect.bottomAnchor, constant: 18).isActive = true
        
        
        // Not Chosen Correct
        let quizButtonNotChosenCorrect = QuizButton()
        quizButtonNotChosenCorrect.buttonState = .notChosenCorrect
        quizButtonNotChosenCorrect.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(quizButtonNotChosenCorrect)
        
        quizButtonNotChosenCorrect.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButtonNotChosenCorrect.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        quizButtonNotChosenCorrect.centerXAnchor.constraint(equalTo: quizButtonNotChosen.centerXAnchor).isActive = true
        quizButtonNotChosenCorrect.topAnchor.constraint(equalTo: quizButtonNotChosen.bottomAnchor, constant: 18).isActive = true
        
        // Assign the view we are creating to the view controller
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< Updated upstream
        // Do any additional setup after loading the view.
=======
//        let xTilt = UIInterpolatingMotionEffect(keyPath: "parallaxCenter.x", type: .tiltAlongHorizontalAxis)
//        let yTilt = UIInterpolatingMotionEffect(keyPath: "parallaxCenter.y", type: .tiltAlongVerticalAxis)
//
//        xTilt.minimumRelativeValue = -50 as NSNumber
//        xTilt.maximumRelativeValue = 50 as NSNumber
//        yTilt.minimumRelativeValue = -50 as NSNumber
//        yTilt.maximumRelativeValue = 50 as NSNumber
//
//        let motionEffectGroup = UIMotionEffectGroup()
//        motionEffectGroup.motionEffects = [xTilt, yTilt]
//        self.view.addMotionEffect(motionEffectGroup)
//
//        self.becomeFirstResponder()
    }
    
    override func viewWillLayoutSubviews() {
        
        var cardFrame = CGRect(x: 20,
                               y: 120,
                               width: UIScreen.main.bounds.width - 20*2,
                               height: UIScreen.main.bounds.height - 120*2)
        
        var scaleFactor: CGFloat = 1
        
        for card in cards.reversed() {
            card.transform = .identity
            card.frame = cardFrame
            cardFrame.origin.y -= 85 * scaleFactor
            card.fogView.alpha = 1 - scaleFactor
            
            // Manipulate the center with the tilt of the device
//            cardFrame.origin.x += rootView.parallaxCenter.x
//            cardFrame.origin.y += rootView.parallaxCenter.y
            
            card.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
            
            scaleFactor *= 0.786
        }
        
    
        
        super.viewWillLayoutSubviews()
>>>>>>> Stashed changes
    }
    

}
