//
//  CustomTableCell.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import UIKit

class CustomTableCell: UITableViewCell {

   static var identifier = "CustomTableCell"
    
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "MANA USDT"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    
    private let priceLabel : UILabel = {
         let label = UILabel()
         label.text = "Price Label"
         label.font = UIFont.systemFont(ofSize: 17)
         label.textColor = .black
         label.textAlignment = .center
         return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        [stackView].forEach{ contentView.addSubview($0)}
        [currencyLabel, priceLabel ].forEach { stackView.addArrangedSubview($0)}
        
        stackView.layer.borderColor = UIColor.systemGreen.cgColor
        stackView.layer.borderWidth = 0.5
      
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }

    
}


//MARK: - Fill to cell
extension CustomTableCell {
    
    func configure(with crypto: CryptoModel) {
        self.currencyLabel.text = crypto.currency
        self.priceLabel.text = crypto.price
    }
}
