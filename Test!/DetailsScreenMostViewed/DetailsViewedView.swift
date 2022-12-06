//
//  DetailsViewedView.swift
//  Test!
//
//  Created by mac on 02.12.2022.
//

import Foundation
import UIKit

class DetailsViewedView :UIView{
    
    var view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuoUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuoUI(){
        let view = UIView(frame: .zero)
        backgroundColor = .red
        addSubview(view)
    }
    
    func setupeConstraints(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
