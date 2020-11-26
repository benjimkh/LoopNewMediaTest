//
//  AvatarView.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/12/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    
    var initial = String() {
        didSet {
            lblInitial.text = initial
        }
    }
    
    var backColor = UIColor.brown {
        didSet {
            backgroundColor = backColor
        }
    }
    
    private let lblInitial: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    init(initial: String = "", backColor: UIColor = UIColor.brown) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backgroundColor = backColor
        lblInitial.text = initial
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        addSubview(lblInitial)
        lblInitial.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblInitial.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblInitial.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lblInitial.heightAnchor.constraint(equalToConstant: 30).isActive = true
        layer.cornerRadius = 60/2
        clipsToBounds = true
    }
    
}
