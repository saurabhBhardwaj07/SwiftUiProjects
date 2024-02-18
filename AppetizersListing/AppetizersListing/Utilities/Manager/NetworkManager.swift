//
//  NetworkManager.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 13/02/24.
//

import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private let imageCache = NSCache<NSString , UIImage>()
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerUrl = baseUrl + "appetizers"
    private init() {
        
    }
    
//    func getAppetizers(completed: @escaping (Result<[AppetizerModelClass] , ApiError>) -> Void ){
//        guard let url = URL(string: appetizerUrl) else {
//            completed(.failure(.invalidUrl))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
//            data, response , error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response  as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder( )
//                let decodedResponse = try decoder.decode(ApetizerApiResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//            
//        }
//        task.resume()
//    }
    
    
    func getAppetizers() async throws -> [AppetizerModelClass] {
        guard let url = URL(string: appetizerUrl) else {
            throw ApiError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(ApetizerApiResponse.self, from: data).request
        } catch{
            throw ApiError.invalidData
        }
    }
    
    func downloadImage(fromUrlString: String , completed: @escaping (UIImage?) -> Void ){

        let cachedKey = NSString(string: fromUrlString)
        if let image = imageCache.object(forKey: cachedKey){
            completed(image)
            return
        }
        guard let url  = URL(string: fromUrlString) else{
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url )){
            data , response , error in
            guard  let data = data , let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            self.imageCache.setObject(image, forKey: cachedKey)
        }
        task.resume()
    
    }
}
