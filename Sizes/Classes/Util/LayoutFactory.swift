//
//  LayoutFactory.swift
//  Pods-Sizes_Example
//
//  Created by Marcos Griselli on 29/09/2018.
//

import UIKit

/// Factory for creating a Layout objects based on a set of parameters
internal class LayoutFactory: NSObject {
    
    /// Creates a Layout object
    ///
    /// - Parameters:
    ///   - device: device to set the layout size and traits
    ///   - orientation: orientation to ajust the device size and traits
    ///   - category: font size UIContentSizeCategory
    /// - Returns: a Layout object 
    internal static func layoutFor(device: Device, orientation: Orientation, contentSizeCategory category: UIContentSizeCategory) -> Layout {
        var traits: [UITraitCollection]
        switch (device, orientation) {
        case (.phone3_5inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone3_5inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact)
            ]
        case (.phone4inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone4inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact)
            ]
        case (.phone4_7inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone4_7inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact)
            ]
        case (.phone5_5inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone5_5inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .compact)
            ]
        case (.phone5_8inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone5_8inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact)
            ]
        case (.phone6_5inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular)
            ]
        case (.phone6_5inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact)
            ]
        case (.pad, .portrait):
            traits = [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular)
            ]
        case (.pad, .landscape):
            traits = [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular)
            ]
        case (.pad12_9inch, .portrait):
            traits = [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular)
            ]
        case (.pad12_9inch, .landscape):
            traits = [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular)
            ]
        }
        
        let size = orientation == .portrait ? device.size : device.size.inverted
        traits.append(.init(userInterfaceIdiom: device.interfaceIdiom))
        traits.append(.init(preferredContentSizeCategory: category))
        traits.append(.init(displayScale: device.deviceScale))
        return Layout(size: size, traits: .init(traitsFrom: traits))
    }
}
