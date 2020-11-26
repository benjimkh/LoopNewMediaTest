//
//  CustomButton.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/10/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

protocol CustomButtonDelegate {
    func didSelect()
}

class CustomButton: UIView {
    
    var delegate: CustomButtonDelegate?
    
    private let btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 4
        btn.clipsToBounds = true
        btn.setTitleColor(.orange, for: .normal)
        btn.setTitle("Reviews", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        btn.backgroundColor = .white
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        translatesAutoresizingMaskIntoConstraints = false
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.3
        
        addSubview(btn)
        btn.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        btn.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        layoutSubviews()
        layoutIfNeeded()
        
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        layer.shadowPath = UIBezierPath(roundedRect: btn.bounds, cornerRadius: 4).cgPath
    }
    
    @objc private func btnAction() {
        delegate?.didSelect()
    }
    
}
