//
//  NetworkProvider.swift
//  Test!
//
//  Created by mac on 24.11.2022.
//

import Foundation
import Alamofire

class NetworkProvider {
    enum Endpoint {
        case emailed
        case viewed
        case shared
        
        var path: String {
            switch self {
            case .emailed:
                return "/svc/mostpopular/v2/emailed/"
            case .viewed:
                return  "/svc/mostpopular/v2/viewed/"
            case .shared:
                return "/svc/mostpopular/v2/shared/"
            }
        }
    }
    
    let apiKey = "j1DghbK8ztHXJ6orsm2eRhVvyZBWv0LB"
    
    func loadArticles(for endpoind: Endpoint , completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = buildURL(for: endpoind) else { return }
        AF.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(NYTResponse.self, from: data)
                completion(.success(response.results))
            } catch (let error) {
                print(error)
                completion(.failure(error))
            }
        }
    }
    
    func buildURL(for endpoint: Endpoint) -> URL? {
        let period = String(format: "%d.json", 30)
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com"
        components.path = endpoint.path + period
        components.queryItems = [
            URLQueryItem(name: "api-key", value: "j1DghbK8ztHXJ6orsm2eRhVvyZBWv0LB"),
        ]
        
        return components.url ?? nil
    }
}

struct NYTResponse: Decodable {
    let status: String
    let results: [Article]
}

struct Article: Decodable {
    let title: String
    let id: Double
    let url: String
    let published_date: String
}


