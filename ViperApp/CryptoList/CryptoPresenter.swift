//
//  MovieListPresenter.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation


class CryptoPresenter: CryptoPresenterProtocol  {
    
    var view: CryptoViewProtocol?
    var interactor: CryptoInteractorProtocol? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    var router: CryptoRouterProtocol?
    
  
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>) {
           switch result {
               case .success(let cryptos):
                   view?.update(with: cryptos)
               case .failure(_):
                   view?.update(with: "Try again later")
           }
       }
    
    
}
