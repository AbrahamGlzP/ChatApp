//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import SwiftUI

@Observable
class ChatViewModel {
    
    var messagesList: [Message] = []
    var messageToSend: String = ""
    @ObservationIgnored
    var placeholder: String = "Escribe un mensaje"
}

extension ChatViewModel {
    func sendMessage() {
        guard !messageToSend.isEmpty else { return }
        messagesList.append(Message(text: messageToSend, source: .outgoing))
        messageToSend = ""
    }
    
    func appendMockMessages() {
        messagesList.append(contentsOf: [
            Message(text: "Hola amor, ya llegaste del trabajo?", source: .outgoing),
            Message(text: "Ya llegué corazaooo", source: .incoming),
            Message(text: "A poco si mi toda tibia", source: .outgoing),
            Message(text: "Tsss a huevoo mi perro, que pasa si agreagamos más texto a esta piece of shit", source: .incoming)
        ])
    }
}
