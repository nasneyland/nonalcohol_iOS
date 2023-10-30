//
//  Color+Extension.swift
//  nonalcohol
//
//  Created by najin shin on 10/30/23.
//

import SwiftUI

extension Color {
    
    // hex 코드로 Color 생성하는 생성자
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    // MARK: Color Palete
    
    // Common
    
    static let _mainColor = Color.yellow
    
    // Button
    
    static let _activeButtonColor = _mainColor
    static let _inactiveButtonColor = Color.gray
}
