//
//  RatingView.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/12/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    var rating: Double = 0 {
        didSet {
            rateView.rating = rating
            lblRate.text = String(rating)
        }
    }
    
    private let rateView: CosmosView = {
        let vi = CosmosView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.settings.starSize = 18
        vi.settings.starMargin = 3
        vi.settings.fillMode = .precise
        return vi
    }()
    
    private let lblRate: UILabel = {
        let lbl =  UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.textColor = UIColor(white: 0.3, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    init(rate: Double? = nil) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rating = rate ?? 0
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        layer.cornerRadius = 3
        clipsToBounds = true
        
        addSubview(rateView)
        addSubview(lblRate)
        
        lblRate.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        lblRate.widthAnchor.constraint(equalToConstant: 40).isActive = true
        lblRate.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblRate.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        rateView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        rateView.rightAnchor.constraint(equalTo: lblRate.leftAnchor, constant: -4).isActive = true
        rateView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rateView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor).isActive = true

    }
    
}
