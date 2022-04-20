//
//  MovieContracts.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation
import UIKit


//MARK: - View (4)
protocol CryptoViewProtocol {
    var presenter: CryptoPresenterProtocol? { get set }
    
    // presenter'dan güncelleme bilgisini alır.
    func update(with cryptos: [CryptoModel])
    func update(with error: String)
}


//MARK: - Interactor (3)
protocol CryptoInteractorProtocol {
    var presenter: CryptoPresenterProtocol? { get set }
    
    // api download
    func downloadCryptos()
}



//MARK: - Presenter (2)
protocol CryptoPresenterProtocol {
    var router: CryptoRouterProtocol? { get set }
    var interactor: CryptoInteractorProtocol? { get set}
    // 1- V,I,R protocolleri tipinde, değişken olarak tanımla.
    var view: CryptoViewProtocol? { get set}

  
   
    
    
    // 2- Interactor'dan gelen API verisi ile, View'ı update etmesini söyle.
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>)
}


typealias EntryPoint = CryptoViewProtocol & UIViewController


//MARK: - Router  (1)
protocol CryptoRouterProtocol {
    static func startExecution() -> CryptoRouterProtocol
    
    // (5)
    var entry: EntryPoint? { get }
}


