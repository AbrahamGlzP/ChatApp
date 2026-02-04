//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import SwiftUI

protocol ChatViewModelContract {

}

@Observable
class ChatViewModel {
    var messagesList: [Message] = []
    var messageToSend: String = ""
    @ObservationIgnored
    var placeholder: String = "Escribe un mensaje"
    @ObservationIgnored
    var remoteDataSource: ChatRemoteDataSourceContract
    
    var loading: Bool = false
    
    init(remoteDataSource: ChatRemoteDataSourceContract) {
        self.remoteDataSource = remoteDataSource
    }
}

extension ChatViewModel {
    func sendMessage() {
        guard !messageToSend.isEmpty else { return }
        Task {
            await MainActor.run {
                messagesList.append(Message(text: messageToSend, source: .outgoing))
                messageToSend = ""
            }
        }
        recieveMessage()
    }
    
    func recieveMessage()  {
        let messageToSend = messagesList.last(where: { $0.source == .outgoing})
        let messageText: String = messageToSend?.text ?? ""
        loading = true
        
        Task  {
            try? await Task.sleep(for: .seconds(5))
            do {
                let messageData = try await remoteDataSource.sendMessage(message: messageText)
                
                do {
                    let yesNoModelDTO = try JSONDecoder().decode(YesNoResponseDTO.self, from: messageData)
                    let messageDomain = yesNoModelDTO.toDomain()
                    await MainActor.run {
                        messagesList.append(messageDomain)
                        loading = false
                    }
                } catch {
                    handleError(error: .decodingProblem)
                }
                
            } catch {
                handleError(error: NetworkError.responseProblem)
            }
           
        }
    }
    
    func handleError(error: NetworkError) {
        switch error {
        default:
            print("An error has ocurred \(error)")
        }
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
