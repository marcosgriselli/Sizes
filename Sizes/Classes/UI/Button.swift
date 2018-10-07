//
//  Button.swift
//  Sizes
//
//  Created by Marcos Griselli on 06/10/2018.
//

import UIKit

internal class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    /// TODO: - Create a custom UI system.
    private func setup() {
        backgroundColor = .white
        setTitleColor(.purple, for: .normal)
        layer.borderWidth = 1
        layer.borderColor = UIColor.purple.cgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layer.cornerRadius = 4.0
    }
}
