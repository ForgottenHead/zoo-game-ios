//
//  ApiManager.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import Foundation


enum ApiError: Error {
    case badURL, badResponse, errorDecodingData, InvalidUrl
}

protocol ApiProtocol {
    func fetchData() async throws -> Animals
}


class ApiManager : ApiProtocol {
    
    func fetchData() async throws -> Animals {
        let url = URL(string: "https://zoogame-21735-default-rtdb.europe-west1.firebasedatabase.app/.json")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error 🏳️")
            throw ApiError.badResponse
        }
        
        guard let animals = try? JSONDecoder().decode(Animals.self, from: data) else {
            print("decoding error")
            throw ApiError.errorDecodingData
        }
        
        
        //print(animals)
        return animals
    }
    

    
}

