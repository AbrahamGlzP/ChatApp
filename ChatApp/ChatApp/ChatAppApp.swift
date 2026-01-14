//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 12/01/26.
//

import SwiftUI

@main
struct ChatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ChatView(viewModel: ChatViewModel())
        }
    }
}
