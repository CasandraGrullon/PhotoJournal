//
//  NetworkHelper.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation
import NetworkHelper

struct PixabayAPIClient {
    static func getPhotos(search: String, completion: @escaping (Result<[Photo], AppError >) -> () ) {
        let searchQuery = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "dog"
        let endpointURL = "https://pixabay.com/api/?q=\(searchQuery)&key=\(Secrets.key)"
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let apiError):
                completion(.failure(.networkClientError(apiError)))
            case .success(let data):
                do {
                    let pixabay = try JSONDecoder().decode(Pixabay.self, from: data)
                    completion(.success(pixabay.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
