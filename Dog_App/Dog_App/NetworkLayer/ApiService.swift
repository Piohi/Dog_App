//
//  ApiService.swift
//  Dog_App
//
//  Created by Anton Godunov on 03.08.2023.
//

import Foundation



protocol APIServiceProtocol {
    
    ///метод принимает страну или координаты, или город, а так же клоужер который возвращает либо ошибку либо модель с погодой
    func getImage(
        completionHandler: @escaping(Result<DogPicModel, APIError>) -> ())
}




    final class APIService: APIServiceProtocol {
        
        private let baseURL = "https://dog.ceo/api/breeds/image/random"
        //    private let apiKey = "352b4afdba374bb7b5a102209232507"
        
        func getImage(completionHandler: @escaping (Result<DogPicModel, APIError>) -> ()
        ) {
            guard let url = URL(string: "\(baseURL)") else {
                completionHandler(.failure(.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = APIMethod.get.rawValue
            
            DispatchQueue.global(qos: .background).async {
                URLSession.shared.dataTask(with: request) { data, responce, error in
                    if error != nil {
                        completionHandler(.failure(.badRequest))
                    }
                    guard let data else {
                        completionHandler(.failure(.noData))
                        return
                    }
                    
                    //                print(JSON(data))
                    
                    do{
                        let object = try JSONDecoder().decode(DogPicModel.self, from: data)
                        completionHandler(.success(object))
                    } catch let error {
                        completionHandler(.failure(.decodingError(error.localizedDescription)))
                    }
                    
                }
                .resume()
                
                
            }
            
        }
    
    
}
