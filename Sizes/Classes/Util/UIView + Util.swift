//
//  UIView + Util.swift
//  Pods-Sizes_Example
//
//  Created by Gabriel Trunso on 21/10/2018.
//

import UIKit

extension UIView {
    
    /// Generates a UIImage from a UIView
    ///
    /// - Parameter traits: traits to take into account for the UIGraphicsImageRendererFormat
    /// - Returns: UIImage of the view
    func asImage(traits: UITraitCollection) -> UIImage {
        let renderer: UIGraphicsImageRenderer
        if #available(iOS 11.0, *) {
            let format = UIGraphicsImageRendererFormat(for: traits)
            renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
        } else {
            /// TODO: - Fallback to another way of generating the images with the correct size depending on the displayScale.
            renderer = UIGraphicsImageRenderer(bounds: bounds)
        }
        
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
