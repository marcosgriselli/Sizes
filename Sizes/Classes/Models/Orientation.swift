//
//  Orientation.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

/// Orientation of the device. We're not supporting all the orientations for now.
internal enum Orientation: Int, CaseIterable {
    case portrait
    case landscape
    
    /// Init based on all the posible orientations into our supported ones
    ///
    /// - Parameter current: current device orientation
    init(current: UIInterfaceOrientation) {
        switch current {
        case .portrait, .portraitUpsideDown, .unknown:
            self = Orientation.portrait
        case .landscapeLeft, .landscapeRight:
            self = Orientation.landscape
        }
    }
}
