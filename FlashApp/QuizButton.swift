//
//  QuizButton.swift
//  FlashApp
//
//  Created by Audrey Welch on 4/2/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit

class QuizButton: UIControl {
    
    enum ButtonState: String {
        case waiting
        case chosenCorrect
        case chosenIncorrect
        case notChosen
        case notChosenCorrect
    }
    
    var buttonState: ButtonState = .waiting {
        didSet {
            updateButtonState()
        }
    }
    
    let defaultTintColors: [ButtonState: UIColor] = [
        .waiting: UIColor(named: "QuizButtonTintColor")!,
        .chosenCorrect: UIColor(named: "QuizButtonTintColor")!,
        .chosenIncorrect: UIColor(named: "QuizButtonIncorrectTintColor")!,
        .notChosen: UIColor(named: "QuizButtonTintColor")!,
        .notChosenCorrect: UIColor(named: "QuizButtonTintColor")!
    ]
    
    let tintColors: [ButtonState: UIColor] = [:]
    
    func updateButtonState() {
        statusIconView.image = nil
        statusIconView.tintColor = defaultTintColors[buttonState]
         
        switch buttonState {
        case .waiting:
            if isHighlighted {
                backgroundView.image = UIImage(named: "QuizButtonHighlighted")
            } else {
                backgroundView.image = UIImage(named: "QuizButtonNormal")
            }
        case .chosenCorrect:
            backgroundView.image = UIImage(named: "QuizButtonChosenCorrect")
            statusIconView.image = UIImage(named: "QuizButtonIconCorrectOption")
        case .chosenIncorrect:
            backgroundView.image = UIImage(named: "QuizButtonChosenIncorrect")
            statusIconView.image = UIImage(named: "QuizButtonIconIncorrectOption")
        case .notChosen:
            backgroundView.image = UIImage(named: "QuizButtonNotChosen")
        case .notChosenCorrect:
            backgroundView.image = UIImage(named: "QuizButtonNotChosenCorrect")
            statusIconView.image = UIImage(named: "QuizButtonIconCorrectOption")
        }
    }

    lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure
        self.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -1).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 1).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -1).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
        
        return imageView
    }()
    
    lazy var statusIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure
        self.addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        return imageView
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
        
        backgroundView.image = UIImage(named: "QuizButtonNormal")
        statusIconView.image = nil
        
        self.addTarget(self, action: #selector(triggerPrimaryAction(_:)), for: .touchUpInside)
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateButtonState()
        }
    }
    
    @IBAction func triggerPrimaryAction(_ sender: QuizButton) {
        
        // Make sure that the button state is waiting if we want to go further into the function
        guard buttonState == .waiting else { return }
        self.sendActions(for: .primaryActionTriggered)
    }

}
