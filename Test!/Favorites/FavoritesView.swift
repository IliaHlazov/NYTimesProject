//
//  FavoritesView.swift
//  Test!
//
//  Created by mac on 29.11.2022.
//

import Foundation
import UIKit

class FavoritesView:UIView{
    
    var tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "favorit")
        tableView = table
        addSubview(table)
    }
    
    func setupeConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

