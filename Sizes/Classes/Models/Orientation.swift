//
//  Orientation.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

internal enum Orientation {
    case portrait
    case landscape
    
    init(current: UIInterfaceOrientation) {
        switch current {
        case .portrait, .portraitUpsideDown, .unknown:
            self = Orientation.portrait
        case .landscapeLeft, .landscapeRight:
            self = Orientation.landscape
        }
    }
}
