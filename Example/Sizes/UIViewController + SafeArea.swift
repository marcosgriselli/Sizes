//
//  UIViewController + SafeArea.swift
//  DynamicAppResizer_Example
//
//  Created by Marcos Griselli on 31/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

/// source: https://gist.github.com/fedetrim/48c509722022a8367facdeb8dafee819
extension UIViewController {
    
    var ft_safeAreaLayoutGuide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide
        } else {
            let id = "ft_safeAreaLayoutGuide"
            
            if let layoutGuide = view.layoutGuides.filter({ $0.identifier == id }).first {
                return layoutGuide
            } else {
                let layoutGuide = UILayoutGuide()
                layoutGuide.identifier = id
                view.addLayoutGuide(layoutGuide)
                NSLayoutConstraint.activate([
                    layoutGuide.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                    layoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    layoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    layoutGuide.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
                    ])
                return layoutGuide
            }
        }
    }
}
