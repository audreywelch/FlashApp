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
            updateBackgroundImage()
        }
    }
    
    func updateBackgroundImage() {
        if isHighlighted {
            backgroundView.image = UIImage(named: "QuizButtonHighlighted")
        } else {
            switch buttonState {
            case .waiting:
                backgroundView.image = UIImage(named: "QuizButtonNormal")
            case .chosenCorrect:
                backgroundView.image = UIImage(named: "QuizButtonChosenCorrect")
            case .chosenIncorrect:
                backgroundView.image = UIImage(named: "QuizButtonChosenIncorrect")
            case .notChosen:
                backgroundView.image = UIImage(named: "QuizButtonNotChosen")
            case .notChosenCorrect:
                backgroundView.image = UIImage(named: "QuizButtonNotChosenCorrect")
            }
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    func createSubviews() {
        
        let _ = backgroundView // Create the backgroundView and add it
        backgroundView.image = UIImage(named: "QuizButtonNormal")
        
        self.addTarget(self, action: #selector(triggerPrimaryAction(_:)), for: .touchUpInside)
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateBackgroundImage()
        }
    }
    
    @IBAction func triggerPrimaryAction(_ sender: QuizButton) {
        self.sendActions(for: .primaryActionTriggered)
    }

}
