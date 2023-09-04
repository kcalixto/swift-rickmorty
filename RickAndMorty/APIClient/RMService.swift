//
//  RMService.swift
//  RickAndMorty
//
//  Created by Kaua Calixto on 03/09/23.
//

import Foundation

// primary api to get rick morty api data
final class RMService {
//    forcing singleton instance
    static let shared = RMService()
    private init(){}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
//    send rick and morty api call
//    completion = callback
//    using generics :)
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<String, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
//            decode response
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
//
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
//    MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}


