//
//  AppColor.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 12/01/26.
//
import SwiftUI


struct AppColor {
    let colorScheme: ColorScheme
    
    var background: Color {
        colorScheme == .dark ? Color(hex: 0x121212) : Color(hex: 0xFAFAFA)
    }
    
    var bubbleOwn: Color {
        colorScheme == .dark ? Color(hex: 0x2A3F5F) : Color(hex: 0xE3EDFF)
    }
    
    var bubbleOther: Color {
        colorScheme == .dark ? Color(hex: 0x2C2C2C) : Color(hex: 0xE8E8E8)
    }
    
    var textPrimary: Color {
        colorScheme == .dark ? Color(hex: 0xE8E8E8) : Color(hex: 0x1A1A1A)
    }
    
    var textSecondary: Color {
        colorScheme == .dark ? Color(hex: 0x9A9A9A) : Color(hex: 0x6B6B6B)
    }
    
    var accent: Color {
        colorScheme == .dark ? Color(hex: 0x6BA3EB) : Color(hex: 0x4A90D9)
    }
}

private extension Color {
    init(hex: Int) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0
        )
    }
}
