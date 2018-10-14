//
//  Button+Style.swift
//  Sizes
//
//  Created by Marcos Griselli on 14/10/2018.
//

import UIKit

internal extension Button {
    
    struct Style {
        let textColor: UIColor
        let backgroundColor: UIColor
        let borderColor: UIColor
        let borderWidth: CGFloat
        let cornerRadius: CGFloat = 4.0
        let font: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
        let insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        fileprivate init(textColor: UIColor, backgroundColor: UIColor, borderColor: UIColor, borderWidth: CGFloat) {
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
        }
    }
    
    func set(style: Button.Style) {
        backgroundColor = style.backgroundColor
        setTitleColor(style.textColor, for: .normal)
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor.cgColor
        layer.cornerRadius = style.cornerRadius
        titleLabel?.font = style.font
        contentEdgeInsets = style.insets
    }
}

extension Button.Style {
    static let selected = Button.Style(textColor: .white, backgroundColor: .purple, borderColor: .purple, borderWidth: 0)
    static let normal = Button.Style(textColor: .purple, backgroundColor: .white, borderColor: .purple, borderWidth: 1)
}
