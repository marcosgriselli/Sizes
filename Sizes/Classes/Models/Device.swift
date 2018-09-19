//
//  Device.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import Foundation

internal enum Device {
    case `default`
    case phone3_5inch
    case phone4inch
    case phone4_7inch
    case phone5_5inch
    case phone5_8inch
    case pad
    case pad12_9inch
    
    static let allCases: [Device] = [.default, .phone3_5inch, .phone4inch, .phone4_7inch, .phone5_5inch, .phone5_8inch, .pad, .pad12_9inch]
}
