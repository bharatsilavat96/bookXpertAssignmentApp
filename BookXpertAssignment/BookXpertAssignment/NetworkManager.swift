//
//  NetworkManager.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        guard let url = URL(string: "https://api.restful-api.dev/objects") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON response: (jsonString)")
            }
            
            do {
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(products))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
        
    }
}
