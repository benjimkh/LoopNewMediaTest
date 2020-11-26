//
//  briefView.swift
//  LoopNewMediaGMBH
//
//  Created by Benyamin Mokhtarpour on 9/20/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import  UIKit

class briefView : UIView {
    var vc : UIViewController!
    lazy var lblInitial : UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var btnShowDetail : UIButton = {
        let btn = UIButton(type : .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Show Detail", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        btn.layer.cornerRadius = 15
        return btn
    }()
    init(vc : UIViewController? = nil,initial: String = "", backColor: UIColor = UIColor.brown) {
        self.vc = vc
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        layer.cornerRadius = 10
        backgroundColor = backColor
        lblInitial.text = initial
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {
        addSubview(btnShowDetail)
        btnShowDetail.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        btnShowDetail.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.4).isActive = true
        btnShowDetail.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnShowDetail.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true

        addSubview(lblInitial)
        lblInitial.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        lblInitial.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        lblInitial.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.5).isActive = true
        lblInitial.bottomAnchor.constraint(equalTo: btnShowDetail.topAnchor,constant: -10).isActive = true
        btnShowDetail.addTapGestureRecognizer(action: {[weak self] in
            guard let sSelf = self else { return }
            (sSelf.vc as! DetailVC).vm.showMoreDetails()
        })
    }
}
