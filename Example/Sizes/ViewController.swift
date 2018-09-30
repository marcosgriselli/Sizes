//
//  ViewController.swift
//  Sizes
//
//  Created by git on 09/19/2018.
//  Copyright (c) 2018 git. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let label = UILabel()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(supportedInterfaceOrientations)
        title = "Hello!"
        view.backgroundColor = .white
        
        label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: traitCollection)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to Sizes 👋"
        label.numberOfLines = 0
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            label.topAnchor.constraint(equalTo: ft_safeAreaLayoutGuide.topAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
            ])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: label.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: label.rightAnchor),
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
            ])
        
        let s1 = UILabel()
        s1.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: traitCollection)
        s1.adjustsFontForContentSizeCategory = true
        s1.numberOfLines = 0
        s1.text = "📱 Resize your app to multiple devices"
        stackView.addArrangedSubview(s1)
        
        let s2 = UILabel()
        s2.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: traitCollection)
        s2.adjustsFontForContentSizeCategory = true
        s2.numberOfLines = 0
        s2.text = "📐 View different orientations"
        stackView.addArrangedSubview(s2)
        
        let s3 = UILabel()
        s3.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: traitCollection)
        s3.adjustsFontForContentSizeCategory = true
        s3.numberOfLines = 0
        s3.text = "🔠 Display different font sizes, including accessibility ones"
        stackView.addArrangedSubview(s3)
    }
}
