//
//  OpenAIRequestDTO.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 16/01/26.
//

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}
