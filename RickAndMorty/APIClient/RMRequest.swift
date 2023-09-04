//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Kaua Calixto on 03/09/23.
//

import Foundation

// object to simplify api calls
final class RMRequest{
    
//    api call consts
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
//    desired endpoint
    private let endpoint: RMEndpoint
//
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
//    construct url for api call
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        if !queryParameters.isEmpty {
            string += "?"
                let argumentString = queryParameters.compactMap({
                    guard let value = $0.value else {return nil}
                    return "\($0.name)=\(value)"
                }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
//    computed & constructed api url
    public var url: URL? {
        return URL(string: urlString)
    }
    
//    in this api all requests are get :P
    public let httpMethod = "GET"
    
//    MARK: - Public
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
