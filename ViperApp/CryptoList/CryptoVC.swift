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
        tableView.register(CustomTableCell.self,
                           forCellReuseIdentifier: CustomTableCell.identifier)
        
        return tableView
    }()
    
    private let messageLabel : UILabel = {
          let label = UILabel()
           label.isHidden = false
           label.text = "Downloading ..."
           label.font = UIFont.systemFont(ofSize: 20)
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
        [tableView].forEach{ view.addSubview($0)}
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds

        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
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
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: CustomTableCell.identifier,
                                                  for: indexPath) as! CustomTableCell
        
        cell.configure(with: cryptosList[indexPath.row])
        cell.backgroundColor = .systemGreen.withAlphaComponent(0.3)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let detailVC = DetailViewController()
            detailVC.currency = self.cryptosList[indexPath.row].currency
            detailVC.price = self.cryptosList[indexPath.row].price
            self.present(detailVC, animated: true, completion: nil)
       }
    
}


//MARK: - Detail VC
class DetailViewController : UIViewController {
    var presenter: CryptoPresenterProtocol?
    
    var currency : String = ""
    var price : String = ""
    
    private let currencyLabel : UILabel = {
       let label = UILabel()
        label.text = "Currency Label"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let priceLabel : UILabel = {
       let label = UILabel()
       
        label.text = "Price Label"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        view.addSubview(currencyLabel)
        view.addSubview(priceLabel)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        currencyLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
        priceLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 + 50, width: 200, height: 50)
        
        currencyLabel.text = currency
        priceLabel.text = price
    }
    
    

}
