//
//  MessageLoadingView 2.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 24/01/26.
//


import SDWebImageSwiftUI
import SwiftUI

struct MessageLoadingView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var isAnimating = false
    
    init() {}
    
    private var appColor: AppColor  {
        AppColor(colorScheme: colorScheme)
    }
    
    private var bubbleBackgroundColor: Color {
        appColor.accent
    }
    
    var body: some View {
        HStack {
            WebImage(url: Constants.imageURL)
                .resizable()
                .frame(width: 30, height: 30)
                .clipped()
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.15))
                .frame(width: 80, height: 30)
                .overlay {
                    HStack {
                        ForEach(0..<3) { index in
                            LoadingDotView(animationDelay: Double(index) * 0.2)
                        }
                    }
                }
        }
        .frame(width: 120)
    }
}

extension MessageLoadingView {
    private struct Constants {
        static let imageURL = URL(string: "https://tgmskateboards.com/cdn/shop/files/S1057.jpg?v=1747654812")!
    }
}

#Preview {
    MessageLoadingView()
}
