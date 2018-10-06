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
    
    func scaleToFit(size: CGSize) -> CGSize {
        let aspectWidth = size.width / width
        let aspectHeight = size.height / height
        let aspectRatio = min(aspectWidth, aspectHeight)
        
        var scaledSize = CGSize.zero
        scaledSize.width = width * aspectRatio
        scaledSize.height = height * aspectRatio
        return scaledSize
    }
    
    func exceeds(size: CGSize) -> Bool {
        return width > size.width || height > size.height
    }
}
