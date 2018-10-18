//
//  ViewController.swift
//  Sizes
//
//  Created by git on 09/19/2018.
//  Copyright (c) 2018 git. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func presentTapped(_ sender: UIButton) {
        let v = UIViewController()
        v.view.backgroundColor = .red
        DispatchQueue.main.async {
            self.present(v, animated: true, completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                    v.dismiss(animated: true)
                })
            })
        }
    }
}
