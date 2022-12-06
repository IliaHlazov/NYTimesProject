//
//  MostEmailedViewController.swift
//  Test!
//
//  Created by mac on 19.11.2022.
//

import Foundation
import UIKit
//https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=yourkey


class MostEmailedViewController:UIViewController {
    var emailedView = MostEmailedView()
    var viewModel = MostEmailedViewModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailedView.tableView.delegate = self
        emailedView.tableView.dataSource = self
        setupView()
        navigationBar()
        viewModel.loadRequest { models in
            self.articles = models
            self.emailedView.tableView.reloadData()
        }
    }
    
    func setupView(){
        emailedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailedView)
        
        NSLayoutConstraint.activate([
            emailedView.topAnchor.constraint(equalTo: view.topAnchor),
            emailedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emailedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

extension MostEmailedViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "emailed") else { return UITableViewCell() }
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}

extension MostEmailedViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsEmailedViewController(article: articles[indexPath.row])
        navigationController?.pushViewController(details, animated: true)
        print(indexPath)
    }
    
    func navigationBar(){
        navigationItem.backButtonTitle = "Back"
    }
}


