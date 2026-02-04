//
//  ChatView.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 12/01/26.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var viewModel: ChatViewModel
    
    var appColor: AppColor {
        AppColor(colorScheme: colorScheme)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                messagesListView
                if viewModel.loading {
                    HStack {
                        MessageLoadingView()
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .transition(
                        .move(edge: .bottom)
                        .combined(with: .opacity)
                    )
                }
                MessageBoxTextField(text: $viewModel.messageToSend, placeholderText: viewModel.placeholder) {
                    viewModel.sendMessage()
                }
                .animation(
                    .easeInOut(duration: 0.6),
                    value: viewModel.loading
                )
                .onAppear {
                    viewModel.appendMockMessages()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        toolBarView
                    }
                }
                .toolbarBackground(appColor.background, for: .navigationBar) // Set the background color
                .toolbarBackground(.visible, for: .navigationBar)   // Make it always visible
                .toolbarColorScheme(colorScheme, for: .navigationBar)
            }
        }
    }
    
    var toolBarView: some View {
        HStack(spacing: 12) {
            AsyncImage(url: Constants.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text("Chat app")
                .font(.headline)
        }
    }
    
    var messagesListView: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.vertical)  {
                VStack(alignment: .leading) {
                    ForEach(viewModel.messagesList, id: \.id)  { message in
                        if message.source == .outgoing { Spacer() }
                        BubbleMessageView(message: message)
                        if message.source == .incoming { Spacer() }
                    }
                    Color.clear
                        .frame(height: 10)
                        .id("bottom")
                }
                .padding()
            }
            .padding(.bottom, 8)
            .onChange(of: viewModel.messagesList.count) {
                withAnimation {
                    scrollProxy.scrollTo("bottom", anchor: .bottom)
                }
            }
        }
        
    }
    
    struct Constants {
        static let imageURL = URL(string: "https://tgmskateboards.com/cdn/shop/files/S1057.jpg?v=1747654812")!
        struct Icon {
            static let paperplane = "paperplane"
        }
    }
}

#Preview {
    ChatView(viewModel: ChatViewModel(remoteDataSource: YesNoAPI()))
}
