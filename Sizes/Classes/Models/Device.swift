//
//  Device.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

internal enum Device: CaseIterable {
    case phone3_5inch
    case phone4inch
    case phone4_7inch
    case phone5_5inch
    case phone5_8inch
    case pad
    case pad12_9inch
    
    /// Portrait size
    var size: CGSize {
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
        case .pad:
            return CGSize(width: 768, height: 1024)
        case .pad12_9inch:
            return CGSize(width: 1024, height: 1366)
        }
    }
    
    internal var interfaceIdiom: UIUserInterfaceIdiom {
        switch self {
        case .phone3_5inch, .phone4inch, .phone4_7inch, .phone5_5inch, .phone5_8inch:
            return .phone
        case .pad, .pad12_9inch:
            return .pad
        }
    }
}
