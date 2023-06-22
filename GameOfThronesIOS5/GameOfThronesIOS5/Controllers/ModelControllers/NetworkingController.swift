//
//  NetworkingController.swift
//  GameOfThronesIOS5
//
//  Created by Colton Brenneman on 6/22/23.
//

import Foundation

struct NetworkingController {
    
    // https://thronesapi.com/api/v2/Characters
    func fetchCharacters(with searchTerm: String, completion: @escaping(Result<Character, ResultError>) -> Void) {
        guard let baseURL = URL(string: "https://thronesapi.com/api/v2/Characters") else { completion(.failure(.invalidURL)) ; return }
        
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.url?.append(path: searchTerm)
        print(urlRequest.url)
        
        URLSession.shared.dataTask(with: urlRequest) { characterData, characterResponse, error in
            if let error {
                completion(.failure(.thrownError(error))) ; return
            } // End of error
            if characterResponse == nil {
                completion(.failure(.noResponse))
            } // End of response
            guard let characterData else { completion(.failure(.noData)) ; return }
            do {
                let topLevelDictionary = try JSONDecoder().decode(Character.self, from: characterData)
                completion(.success(topLevelDictionary))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }.resume() // End of dataTask
    } // End of fetchCharacters
    
    // https://thronesapi.com/assets/images/daenerys.jpg
    func fetchImage() {
        
    } // End of fetchImage
} // End of struct
