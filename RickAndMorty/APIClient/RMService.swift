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
    
//    send rick and morty api call
//    completion = callback
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}


