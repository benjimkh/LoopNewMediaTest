//
//  TopBarView.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/8/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

protocol TopBarViewDelegate {
    func didTapOnSearchBtn()
    func didTapOnPlusBtn()
}

class TopBarView: UIView {
    
    var delegate: TopBarViewDelegate?
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Discover"
        lbl.textAlignment = .center
        lbl.alpha = 0.7
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let btnSearch: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "search"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.alpha = 0.6
        return btn
    }()
    
    let btnPlus: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.alpha = 0.6
        return btn
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        
        btnSearch.addTarget(self, action: #selector(btnSearchAction), for: .touchUpInside)
        btnPlus.addTarget(self, action: #selector(btnPlusAction), for: .touchUpInside)
        
        addSubview(lblTitle)
        addSubview(btnSearch)
        addSubview(btnPlus)
        
        lblTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        lblTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        lblTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true

        
        btnSearch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        btnSearch.rightAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive = true
        btnSearch.widthAnchor.constraint(equalToConstant: 28).isActive = true
        btnSearch.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        btnPlus.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        btnPlus.leftAnchor.constraint(equalTo: lblTitle.rightAnchor).isActive = true
        btnPlus.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        btnPlus.widthAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    @objc private func btnSearchAction() {
        delegate?.didTapOnSearchBtn()
    }
    
    @objc private func btnPlusAction() {
        delegate?.didTapOnPlusBtn()
    }
    
    
}
