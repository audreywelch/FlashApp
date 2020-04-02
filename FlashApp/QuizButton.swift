//
//  QuizButton.swift
//  FlashApp
//
//  Created by Audrey Welch on 4/2/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

import UIKit

class QuizButton: UIControl {

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
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        let _ = backgroundView // Create the backgroundView and add it
        backgroundView.backgroundColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 0.2)
    }

}
