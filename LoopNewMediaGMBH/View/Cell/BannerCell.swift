//
//  BannerCell.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/9/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    private let shadowView: UIView = {
        let vi = UIView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.layer.shadowColor = UIColor.black.cgColor
        vi.layer.shadowOffset = CGSize(width: 1, height: 1)
        vi.layer.shadowRadius = 3
        vi.layer.shadowOpacity = 0.3
        return vi
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        
        addSubview(shadowView)
        addSubview(imageView)
        
        shadowView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        shadowView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shadowView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        shadowView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true

        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: shadowView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: shadowView.heightAnchor).isActive = true

        
        
        layoutIfNeeded()
        
        imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: 4).cgPath
        
    }
    
}
