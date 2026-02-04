//
//  YesNoResponseDTO.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 22/01/26.
//

struct YesNoResponseDTO: Decodable {
    let answer: String
    let forced: Bool
    let image: String
    
    func toDomain() -> Message {
        Message(text: answer, source: .incoming, image: image)
    }
}
