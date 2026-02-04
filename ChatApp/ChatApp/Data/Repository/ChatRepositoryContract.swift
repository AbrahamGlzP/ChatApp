//
//  ChatRepositoryContract.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 30/01/26.
//

import Foundation

protocol ChatAppRepositoryContract {
    func getChatMessage() -> Data
}
