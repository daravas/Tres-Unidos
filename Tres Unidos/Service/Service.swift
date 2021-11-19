//
//  Service.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 17/11/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

//class Service {
//    static let shared = Service()
//
//    private let baseAPIURL = "https://api.themoviedb.org/3/movie"
//    private let urlSession = URLSession.shared
//
//    func fetchMovies(completion: @escaping (MovieList?, Error?) -> Void) {
//        let api = URL(string: "\(baseAPIURL)/now_playing?api_key=\(apiKey)")
//       urlSession.dataTask(with: api!) { data, response, error in
//            if error != nil {
//                print(error?.localizedDescription)
//                return
//            }
//            do {
//                let result = try JSONDecoder().decode(MovieList.self, from: data!)
//                DispatchQueue.main.async {
//                    completion(result, nil)
//                }
//            } catch {
//                print("Error during JSON serialization: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}
