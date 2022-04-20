//
//  ViewController.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import UIKit

class CryptoVC: UIViewController {
    
    var presenter: CryptoPresenterProtocol?
    var cryptosList: [CryptoModel] = []
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cellId")
        
        return tableView
    }()
    
    
    var currencyLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "MANA USDT"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        setupViews()
    }
    
    private func setupViews(){
        [tableView, currencyLabel].forEach{ view.addSubview($0)}
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }

}


//MARK: - Fill data
extension CryptoVC: CryptoViewProtocol {
   
    
    func update(with cryptos: [CryptoModel]) {
        DispatchQueue.main.async {
            print(cryptos)
            self.cryptosList = cryptos
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
    }
    
    
}


//MARK: - Delegate,DataSource
extension CryptoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.cryptosList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = self.cryptosList[indexPath.row].currency
       
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

