//
//  MovieListRouter.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation



class CryptoRouter: CryptoRouterProtocol {
    
    var entry: EntryPoint?
    
    
    static func startExecution() -> CryptoRouterProtocol {
        
        let router = CryptoRouter()
        
        // V,I,P  nesneleri init et.
        var view: CryptoViewProtocol = CryptoVC()
        var presenter: CryptoPresenterProtocol = CryptoPresenter()
        var interactor: CryptoInteractorProtocol = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
