//
//  CGSize + Invert.swift
//  Sizes
//
//  Created by Marcos Griselli on 30/09/2018.
//

import UIKit

internal extension CGSize {

    /// New CGSize with swapped width and height
    var inverted: CGSize {
        return CGSize(width: height, height: width)
    }
    
    /// Generates a CGSize which fits into the passed size parameter
    ///
    /// - Parameter size: CGSize to use as bounds to resize
    /// - Returns: scaled to fit CGSize
    func scaleToFit(size: CGSize) -> CGSize {
        let aspectWidth = size.width / width
        let aspectHeight = size.height / height
        let aspectRatio = min(aspectWidth, aspectHeight)
        
        var scaledSize = CGSize.zero
        scaledSize.width = width * aspectRatio
        scaledSize.height = height * aspectRatio
        return scaledSize
    }
    
    /// Evaluates if width and height go beyond the parameter width and height
    ///
    /// - Parameter size: size to evaluate against
    /// - Returns: Bool determining if it exceeds
    func exceeds(size: CGSize) -> Bool {
        return width > size.width || height > size.height
    }
}
