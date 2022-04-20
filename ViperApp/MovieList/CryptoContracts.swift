//
//  MovieContracts.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation


//MARK: - View
protocol CryptoViewProtocol {
    
}


//MARK: - Interactor
protocol CryptoInteractorProtocol {
    
}



//MARK: - Presenter
protocol CryptoPresenterProtocol {
    
    // 1- V,I,R protocolleri tipinde, değişken olarak tanımla.
    var view: CryptoViewProtocol? { get set}
    var interactor: CryptoInteractorProtocol? { get set}
    var router: CryptoRouterProtocol? { get set }
   
    
    
    // 2- Interactor'dan gelen API verisi ile, View'ı update etmesini söyle.
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>)
}




//MARK: - Router
protocol CryptoRouterProtocol {
    static func startExecution() -> CryptoRouterProtocol
}


