//
//  Device.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

/// Available iOS devices with unique sizing.
public enum Device: CaseIterable {
    case phone3_5inch
    case phone4inch
    case phone4_7inch
    case phone5_5inch
    case phone5_8inch
    case phone6_5inch
    case pad
    case pad12_9inch
    
    /// Init based on the device screen size we want.
    ///
    /// - Parameter size: device UIScreen size.
    internal init?(size: CGSize) {
        guard let device = Device.allCases.first(where: { $0.size == size }) else {
            return nil
        }
        self = device
    }
    
    /// Portrait size
    internal var size: CGSize {
        switch self {
        case .phone3_5inch:
            return CGSize(width: 320, height: 480)
        case .phone4inch:
            return CGSize(width: 320, height: 568)
        case .phone4_7inch:
            return CGSize(width: 375, height: 667)
        case .phone5_5inch:
            return CGSize(width: 414, height: 736)
        case .phone5_8inch:
            return CGSize(width: 375, height: 812)
        case .phone6_5inch:
            return CGSize(width: 414, height: 896)
        case .pad:
            return CGSize(width: 768, height: 1024)
        case .pad12_9inch:
            return CGSize(width: 1024, height: 1366)
        }
    }
    
    /// InterfaceIdiom to filter between iPhones and iPads
    public var interfaceIdiom: UIUserInterfaceIdiom {
        switch self {
        case .phone3_5inch, .phone4inch, .phone4_7inch, .phone5_5inch, .phone5_8inch, .phone6_5inch:
            return .phone
        case .pad, .pad12_9inch:
            return .pad
        }
    }
    
    /// Common name for each device
    internal var name: String {
        switch self {
        case .phone3_5inch:
            return "iPhone 4s"
        case .phone4inch:
            return "iPhone 5s"
        case .phone4_7inch:
            return "iPhone 8"
        case .phone5_5inch:
            return "iPhone 8+"
        case .phone5_8inch:
            return "iPhone XS"
        case .phone6_5inch:
            return "iPhone XS Max"
        case .pad:
            return "iPad 10.5"
        case .pad12_9inch:
            return "iPad 12.9"
        }
    }
    
    internal var deviceScale: CGFloat {
        switch self {
        case .phone3_5inch, .phone4inch, .phone4_7inch, .pad, .pad12_9inch:
            return 2.0
            case .phone5_5inch, .phone5_8inch, .phone6_5inch:
            return 3.0
        }
    }
    
    /// MARK: - Public
    
    /// Filteres all the posibe devices and returns the ones that match the idiom input
    ///
    /// - Parameter idiom: idiom to filter devices
    /// - Returns: array of devices with passed idiom
    public static func valuesForIdiom(_ idiom: UIUserInterfaceIdiom) -> [Device] {
        return allCases.filter { $0.interfaceIdiom == idiom }
    }
}
