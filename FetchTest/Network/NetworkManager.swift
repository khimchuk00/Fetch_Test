//
//  NetworkManager.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private lazy var networking: NetworkingType = Networking(callbackQueue: .main)
    
    private init() {}
    
    func getRecipies(completion: @escaping (Result<RecipeResponseModel, APIError>) -> Void) {
        let request = GetRecepiesRequest()
        
        networking.sendRequest(request) { response in
            switch response {
            case .success(let data):
                do {
                    completion(.success(try JSONDecoder().decode(RecipeResponseModel.self, from: data)))
                } catch {
                    completion(.failure(APIError(code: .decodingError, request: request)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
