//
//  BaseCellCV.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/9/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class BaseCellCV: UIView {
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var btnShowAll: UIButton = {
        let btn = UIButton()
        btn.setTitle("SHOW ALL", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 15
        btn.backgroundColor = .black
        return btn
    }()
    
    let cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        lblTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        
        addSubview(lblTitle)
        addSubview(btnShowAll)
        addSubview(cv)
        

        btnShowAll.topAnchor.constraint(equalTo: topAnchor).isActive = true
        btnShowAll.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        btnShowAll.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btnShowAll.heightAnchor.constraint(equalToConstant: 30).isActive = true

        lblTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lblTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: btnShowAll.leftAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true

        cv.topAnchor.constraint(equalTo: lblTitle.bottomAnchor,constant: 20).isActive = true
        cv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cv.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cv.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
}
