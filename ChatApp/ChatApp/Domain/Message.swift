//
//  Message.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 12/01/26.
//

import SwiftUI

enum MessageSource {
    /// The message the user is sendig
    case outgoing
    /// The message the user is recieving
    case incoming
}

struct Message {
    var id: UUID
    var text: String
    var source: MessageSource
    
    init(text: String, source: MessageSource) {
        self.id = UUID()
        self.text = text
        self.source = source
    }
}
