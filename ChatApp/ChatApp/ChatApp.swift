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
            let remoteDataSource: ChatRemoteDataSourceContract = YesNoAPI()
            let viewModel: ChatViewModel = ChatViewModel(remoteDataSource: remoteDataSource)
            ChatView(viewModel: viewModel)
        }
    }
}
