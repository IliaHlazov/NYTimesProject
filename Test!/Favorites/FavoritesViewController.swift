//
//  FavoritesViewController.swift
//  Test!
//
//  Created by mac on 22.11.2022.
//

import Foundation
import UIKit

class FavoritesViewController:UIViewController{
    
    var favorit = FavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favorit.tableView.dataSource = self
        setuoView()
    }
    
    func setuoView(){
        favorit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favorit)
        
        NSLayoutConstraint.activate([
            favorit.topAnchor.constraint(equalTo: view.topAnchor),
            favorit.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favorit.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favorit.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }    
}

extension FavoritesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favorit") else { return UITableViewCell() }
        cell.textLabel?.text = ""
        return cell
    }
}
