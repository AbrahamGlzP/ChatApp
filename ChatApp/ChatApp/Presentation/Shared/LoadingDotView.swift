//
//  LoadingDotView.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 24/01/26.
//

import SwiftUI

struct LoadingDotView: View {
    
    @State private var isAnimating: Bool = false
    private var animationDelay: Double = .zero
    
    init(animationDelay: Double) {
        self.animationDelay = animationDelay
    }
    
    var body: some View {
        Circle()
            .fill(Color.gray.opacity(0.4))
            .frame(width: 9, height: 9)
            .offset(y: isAnimating ? -5 : .zero)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.3)
                    .repeatForever(autoreverses: true)
                    .delay(animationDelay)
                )  {
                    isAnimating = true
                }
            }
    }
}

#Preview {
    LoadingDotView(animationDelay: 0.2)
}
