//
//  DetailsViewedViewController.swift
//  Test!
//
//  Created by mac on 22.11.2022.
//

import Foundation
import UIKit
import WebKit

class DetailsViewedViewController: UIViewController {
    var ditailsView: DetailsViewedView { view as! DetailsViewedView }
    var webView: WKWebView!
    let article: Article
    
    init(article: Article) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: article.url) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension DetailsViewedViewController: WKNavigationDelegate {
    
}
