//
//  MostSharedViewController.swift
//  Test!
//
//  Created by mac on 19.11.2022.
//

import Foundation
import UIKit

class MostSharedViewController:UIViewController {
    
    var sharedView = MostSharedView()
    var viewModel = MostSharedViewModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedView.tableView.dataSource = self
        sharedView.tableView.delegate = self
        setupView()
        navigationBar()
        viewModel.loadRequest { models in
            self.articles = models
            self.sharedView.tableView.reloadData()
        }
    }
    
    func setupView(){
        sharedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sharedView)
        
        NSLayoutConstraint.activate([
            sharedView.topAnchor.constraint(equalTo: view.topAnchor),
            sharedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sharedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sharedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MostSharedViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shared") else { return UITableViewCell() }
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

extension MostSharedViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsSharedViewController(article: articles[indexPath.row])
        navigationController?.pushViewController(details, animated: true)
        print(indexPath)
    }
    
    func navigationBar(){
        navigationItem.backButtonTitle = "Back"
    }
}

