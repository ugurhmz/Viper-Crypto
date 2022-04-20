//
//  MovieListRouter.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation



class CryptoRouter: CryptoRouterProtocol {
    
    static func startExecution() -> CryptoRouterProtocol {
        
        let router = CryptoRouter()
        return router
    }
    
    
}
