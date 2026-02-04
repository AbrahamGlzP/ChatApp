//
//  YesNoAPI.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 22/01/26.
//

import Foundation

class YesNoAPI: ChatRemoteDataSourceContract {
    private let urlString = "https://yesno.wtf/api"
    func sendMessage(message: String) async throws(NetworkError) -> Data {
        
        guard let url: URL = URL (string: urlString) else {
            throw .badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                throw NetworkError.invalidResponse
            }
            return data
        } catch {
            throw .responseProblem
        }
    }
}
