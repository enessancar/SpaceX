//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Enes Sancar on 26.05.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func download(url: URL, completion: @escaping(Result<Data, CustomError>) -> Void) -> URLSessionDataTask
    func handleWithData<T: Decodable>(_ data: Data, type: T.Type) -> T?
    func handleWithError(_ error: Error)
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, CustomError>) -> Void) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
        return dataTask
    }
    
    func handleWithData<T>(_ data: Data, type: T.Type) -> T? where T : Decodable {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        }catch {
            print(CustomError.unableToParseFromJSON.rawValue)
            return nil
        }
    }
    
    func handleWithError(_ error: Error) {
        print(error)
    }
}
