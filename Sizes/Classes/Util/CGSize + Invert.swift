//
//  CGSize + Invert.swift
//  Sizes
//
//  Created by Marcos Griselli on 30/09/2018.
//

import UIKit

extension CGSize {

    var inverted: CGSize {
        return CGSize(width: height, height: width)
    }
}
