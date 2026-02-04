//
//  OpenAIChatResponseDTO.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 15/01/26.
//

struct OpenAIChatResponseDTO: Decodable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}
