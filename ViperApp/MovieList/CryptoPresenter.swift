//
//  MovieListPresenter.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation


class CryptoPresenter: CryptoPresenterProtocol  {
    
    var view: CryptoViewProtocol?
    var interactor: CryptoInteractorProtocol?
    var router: CryptoRouterProtocol?
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>) {
        
        switch result {
        case .success(let cryptoList):
            print("view.upadte" ,cryptoList)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    
}
