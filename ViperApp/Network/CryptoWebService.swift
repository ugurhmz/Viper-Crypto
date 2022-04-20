//
//  CryptoWebService.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation
import Alamofire

class CryptoWebService {
    
    static let shared = CryptoWebService()
    
    public func getTrendingMovies(completion: @escaping (Result<[CryptoModel], Error>) -> Void) {
     
          
          let urlString = "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json"
          
          AF.request(urlString).responseData { (response) in
              
              switch response.result {
              case .success(let data):
                  let decoder = Decoders.plainDateDecoder
                  
                  do {
                      let response = try decoder.decode([CryptoModel].self, from: data)
                     
                      completion(.success(response))
                  } catch {
                      completion(.failure(APIError.serializationError(internal: error)))
                  }
                  
              case .failure(let error):
                  completion(.failure(APIError.networkError(internal: error)))
              }
          }
      }
}

