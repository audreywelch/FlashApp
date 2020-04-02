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
        
        // Configure the button
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(testTheButton(_:)), for: .primaryActionTriggered)
        
        button.setBackgroundImage(#imageLiteral(resourceName: "QuizButtonHighlighted"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "QuizButtonNotChosen"), for: .highlighted)
        
        // Add to superview
        rootView.addSubview(button)

        // Constraints
        button.widthAnchor.constraint(equalToConstant: 296).isActive = true
        button.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        button.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        
        let quizButton = QuizButton()
        quizButton.translatesAutoresizingMaskIntoConstraints = false
        quizButton.addTarget(self, action: #selector(testTheQuizButton(_:)), for: .primaryActionTriggered)
        rootView.addSubview(quizButton)
        
        quizButton.widthAnchor.constraint(equalToConstant: 294).isActive = true
        quizButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        quizButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        quizButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 18).isActive = true
        
        // Assign the view we are creating to the view controller
        self.view = rootView
    }
    
    @IBAction func testTheButton(_ sender: UIButton) {
        print("The button was actually tapped")
    }
    
    @IBAction func testTheQuizButton(_ sender: QuizButton) {
        print("The quiz button was actually tapped")
        
        sender.buttonState = .chosenIncorrect
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
