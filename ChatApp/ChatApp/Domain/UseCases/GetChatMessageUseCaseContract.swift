//
//  GetChatMessageUseCaseContract.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 30/01/26.
//

protocol GetChatMessageUseCaseContract {
    func execute() async -> Message
}
