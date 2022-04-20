//
//  MovieListInteractor.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation
import Alamofire

public enum APIError: Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}



class CryptoInteractor: CryptoInteractorProtocol {
    
    var presenter: CryptoPresenterProtocol?
    
    func downloadCryptos() {
        let urlString = "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json"
        
        
        AF.request(urlString).responseData {  (response) in
            switch response.result {
                
                       case .success(let data):
                           let decoder = Decoders.plainDateDecoder
                           
                           do {
                               let response = try decoder.decode([CryptoModel].self, from: data)
                               self.presenter?.interactorDidDownloadCrypto(result: .success(response))
                              
                           } catch {
                               self.presenter?.interactorDidDownloadCrypto(result: .failure(APIError.serializationError(internal: error)))
                           }
                           
                       case .failure(let error):
                        self.presenter?.interactorDidDownloadCrypto(result: .failure(APIError.networkError(internal: error)))
               }
          }
        }
        
}
    
    

