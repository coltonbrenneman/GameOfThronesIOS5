//
//  NetworkingController.swift
//  GameOfThronesIOS5
//
//  Created by Colton Brenneman on 6/22/23.
//

import UIKit.UIImage

struct NetworkingController {
    
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
    func fetchImage(with imagePath: String, completion: @escaping(Result<UIImage, ResultError>) -> Void) {
        guard let baseURL = URL(string: "https://thronesapi.com/assets/images/daenerys.jpg") else { completion(.failure(.invalidURL)) ; return }
        
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.url?.append(path: imagePath)
        print(urlRequest.url)
        
        URLSession.shared.dataTask(with: urlRequest) { imageData, _, error in
            if let error {
                completion(.failure(.thrownError(error))) ; return
            } // End of error
            guard let imageData else { completion(.failure(.noData)) ; return }
            
            guard let characterImage = UIImage(data: imageData) else { return }
            completion(.success(characterImage))
        }.resume() // End of dataTask
    } // End of fetchImage
} // End of struct
