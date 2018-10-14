//
//  UIStackView + Util.swift
//  Sizes
//
//  Created by Marcos Griselli on 14/10/2018.
//

import UIKit

internal extension UIStackView {

    func removeArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
