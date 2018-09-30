//
//  CombinationFactory.swift
//  Pods-Sizes_Example
//
//  Created by Marcos Griselli on 29/09/2018.
//

import UIKit

internal class LayoutFactory: NSObject {
    
    internal static func configurationFor(device: Device, orientation: Orientation, contentSizeCategory category: UIContentSizeCategory) -> Layout {
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
        return Layout(size: size, traits: .init(traitsFrom: traits))
    }
}
