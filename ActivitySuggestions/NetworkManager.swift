//
//  NetworkManager.swift
//  ActivitySuggestions
//
//  Created by Aleksandr on 12.04.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    func fetchActivity(from url: String, completion: @escaping(Result<Activity, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no description")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(activity))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchAlamofireActivity(_ url: String, completion: @escaping(Result<Activity, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let activity = Activity.getActivity(from: value)
                    completion(.success(activity))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
        }
    }
    
    
}

