//
//  UIView + Util.swift
//  Pods-Sizes_Example
//
//  Created by Gabriel Trunso on 21/10/2018.
//

import UIKit

extension UIView {
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage(traits: UITraitCollection) -> UIImage {
        let renderer: UIGraphicsImageRenderer
        if #available(iOS 11.0, *) {
            let format = UIGraphicsImageRendererFormat(for: traits)
            renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
        } else {
            renderer = UIGraphicsImageRenderer(bounds: bounds)
        }
        
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
