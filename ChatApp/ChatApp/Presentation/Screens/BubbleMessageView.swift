//
//  BubbleMessageView.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import SDWebImageSwiftUI
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
    
    private var horizontalAlignment: HorizontalAlignment {
        message.source == .incoming ? .leading : .trailing
    }
    
    private var vStackHorizontalAlignment: Alignment {
        message.source == .incoming ? .leading : .trailing
    }
    
    var body: some View {
        VStack(alignment: horizontalAlignment) {
            Text(message.text)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(bubbleBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: CGFloat(15)))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            if let image = message.image {
                AnimatedImage(url: URL(string: image)) {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width * 0.7,height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
        .frame(maxWidth: .infinity, alignment: vStackHorizontalAlignment)
    }
}

#Preview {
    BubbleMessageView(
        message: Message(
            text: "Hola",
            source: .incoming,
            image: "https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif"
        )
    )
}
