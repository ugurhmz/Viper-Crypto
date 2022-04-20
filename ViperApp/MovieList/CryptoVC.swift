//
//  ViewController.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import UIKit

class CryptoVC: UIViewController {
    
    var presenter: CryptoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }

}


//MARK: -
extension CryptoVC: CryptoViewProtocol {
   
    
    func update(with cryptos: [CryptoModel]) {
        DispatchQueue.main.async {
            print(cryptos)
        }
    }
    
    func update(with error: String) {
        print(error)
    }
    
    
}

