//
//  BubbleMessageView.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import SwiftUI

struct BubbleMessageView: View  {
    @Environment(\.colorScheme) var colorScheme
    var message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var appColors: AppColor {
        AppColor(colorScheme: colorScheme)
    }
    
    var bubbleBackgroundColor: Color {
        message.source == .outgoing ? appColors.bubbleOwn : appColors.bubbleOther
    }
    
    var body: some View {
        Text(message.text)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(bubbleBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(15)))
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}
