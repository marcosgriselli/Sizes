//
//  Button.swift
//  Sizes
//
//  Created by Marcos Griselli on 06/10/2018.
//

import UIKit

@IBDesignable
internal class Button: UIButton {
    
    override var isSelected: Bool {
        didSet { set(selected: isSelected) }
    }
    
    init(style: Button.Style) {
        super.init(frame: CGRect.zero)
        set(style: style)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        set(selected: isSelected)
    }
    
    private func set(selected: Bool) {
        let style: Style = selected ? .selected : .normal
        set(style: style)
    }
}
