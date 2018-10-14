//
//  UIApplication + Orientations.swift
//  Pods-Sizes_Example
//
//  Created by Marcos Griselli on 06/10/2018.
//

import UIKit

extension UIApplication {

    /// Evaluates if the current application supports both portait and landscape
    var supportsPortraitAndLandscape: Bool {
        let orientations = supportedInterfaceOrientations(for: windows.first)
        let hasPortrait = orientations.contains(.portrait) || orientations.contains(.portraitUpsideDown)
        let hasLandscape = orientations.contains(.landscapeLeft) || orientations.contains(.landscapeRight)
        return hasPortrait && hasLandscape
    }
}
