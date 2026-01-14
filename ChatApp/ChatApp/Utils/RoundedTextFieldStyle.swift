//
//  RoundedTextFieldStyle.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) var colorScheme
    
    private var appColor: AppColor {
        AppColor(colorScheme: colorScheme)
    }
    
    private var backgroundColor: Color {
        appColor.accent
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                Color(backgroundColor)
            )
            .clipShape(Capsule(style: .continuous))
    }
}
