//
//  MostViewedViewController.swift
//  Test!
//
//  Created by mac on 19.11.2022.
//

import Foundation
import UIKit

class MostViewedViewController:UIViewController{
    
    var viewedView = MostViewedView()
    var viewModel = MostViewedViewModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewedView.tableView.delegate = self
        viewedView.tableView.dataSource = self
        setupView()
        navigationBar()
        viewModel.loadRequest { models in
            self.articles = models
            self.viewedView.tableView.reloadData()
        }
    }
    
    func setupView(){
        viewedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewedView)
        
        NSLayoutConstraint.activate([
            viewedView.topAnchor.constraint(equalTo: view.topAnchor),
            viewedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MostViewedViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "viewed") else { return UITableViewCell() }
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

extension MostViewedViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsViewedViewController(article: articles[indexPath.row])
        navigationController?.pushViewController(details, animated: true)
        print(indexPath)
    }
    
    func navigationBar(){        
        navigationItem.backButtonTitle = "Back"
    }
}
