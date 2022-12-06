//
//  MostEmailedViewModel.swift
//  Test!
//
//  Created by mac on 19.11.2022.
//

import Foundation
import UIKit
import Alamofire


class MostEmailedViewModel{
    
    var networkProvider: NetworkProvider = NetworkProvider()

    func loadRequest(completion: @escaping([Article]) -> Void){
        let networkProvider = NetworkProvider()
        networkProvider.loadArticles(for: .emailed) { result in
            switch result {
            case .success(let models):
                completion(models)
            case .failure(let error):
                print(error)
            }
        }
    }
}

