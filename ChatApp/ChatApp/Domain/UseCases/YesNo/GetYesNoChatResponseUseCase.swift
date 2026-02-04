//
//  GetYesNoChatResponseUseCase.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 30/01/26.
//

import  Foundation

class GetYesNoChatResponseUseCase: GetChatMessageUseCaseContract {
    func execute() async -> Message {
        return Message(text: "Mock message", source: .incoming, image: nil)
    }
}
