//
//  MessageBoxTextField.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 15/01/26.
//

import SwiftUI

struct MessageBoxTextField: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @Binding var text: String
    var placeholderText: String
    var buttonAction: (()->Void)
    
    private var appColor: AppColor {
        AppColor(colorScheme: colorScheme)
    }
    
    private var backgroundColor: Color {
        appColor.accent
    }
    
    var body: some View {
        HStack {
            TextField(
                placeholderText,
                text: $text,
                axis: .vertical
            )
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.leading, 20)
            
            Button(action: {
                buttonAction()
            }) {
                Image(systemName: Constants.Icon.paperplane)
                    .imageScale(.large)
                    .foregroundColor(appColor.textSecondary)
                    .rotationEffect(Angle(degrees: 45))
            }
            .padding(.leading,5)
            .padding(.trailing, 20)
        }
    }
    
    private struct Constants {
        static let imageURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOvNFsKB0hGic3rN6c48xhpjrphsNLoLMZg&s")!
        struct Icon {
            static let paperplane = "paperplane.fill"
        }
    }
}
