//
//  ChatView.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 12/01/26.
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

struct ChatView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var viewModel: ChatViewModel = ChatViewModel()
    
    var appColor: AppColor {
        AppColor(colorScheme: colorScheme)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                messagesListView
                MessageBoxTextField(text: $viewModel.messageToSend, placeholderText: viewModel.placeholder) {
                    viewModel.sendMessage()
                }
            }
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
    
    var toolBarView: some View {
        HStack(spacing: 12) {
            AsyncImage(url: Constants.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text("Muscle")
                .font(.headline)
        }
    }
    
    var messagesListView: some View {
        ScrollView(.vertical)  {
            VStack(alignment: .leading) {
                ForEach(viewModel.messagesList, id: \.id)  { message in
                    HStack {
                        if message.source == .outgoing { Spacer() }
                        BubbleMessageView(message: message)
                        if message.source == .incoming { Spacer() }
                    }
                }
            }
            .padding()
        }
    }
    
    struct Constants {
        static let imageURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOvNFsKB0hGic3rN6c48xhpjrphsNLoLMZg&s")!
        struct Icon {
            static let paperplane = "paperplane"
        }
    }
}

#Preview {
    ChatView()
}
