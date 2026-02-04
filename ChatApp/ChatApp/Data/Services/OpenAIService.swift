//
//  OpenAIService.swift
//  ChatApp
//
//  Created by Abraham Gonzalez Puga on 14/01/26.
//

import Foundation


protocol ChatRemoteDataSourceContract {
    func sendMessage(message: String) async throws(NetworkError) -> Data
}

class OpenAIService {
    let baseURL: String = "https://api.openai.com/v1/chat/completions"
}

private extension OpenAIService {
    struct Constants {
        static let chatGPTModel: String = "gpt-4.1"
    }
}

extension OpenAIService: ChatRemoteDataSourceContract {
    func sendMessage(message: String) async throws(NetworkError) -> Data {
        
        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL
        }
        
        let messageToSend: OpenAIChatMessage = OpenAIChatMessage(role: .user, content: message)
        let body = OpenAIChatBody(model: Constants.chatGPTModel, messages: [messageToSend])
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            throw NetworkError.endcodingProblem
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = (response as? HTTPURLResponse) {
                print("Status code",httpResponse.statusCode)
            }
            
            return data
            
        } catch {
            throw NetworkError.responseProblem
        }
    }
}

enum NetworkError: Error {
    case badURL
    case endcodingProblem
    case decodingProblem
    case invalidResponse
    case responseProblem
}
