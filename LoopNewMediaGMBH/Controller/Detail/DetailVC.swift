//
//  DetailVC.swift
//  LoopNewMediaGMBH
//
//  Created by BenyaminMokhtarpour on 9/20/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import UIKit


class DetailVC: MainVC {
    
    static var fakeBackView : UIView = {
        let vi = UIView()
        vi.backgroundColor = .clear
        vi.alpha = 0
        return vi
    }()
    static var fakeView = UIImageView()
    
    static var fakeCloseBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.alpha = 0.6
        return btn
    }()
    var vm : DetailVM!
    var item: Item
    var ivTop: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    lazy var scrollView : LNMScrollView! = {
        let sc = LNMScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.alwaysBounceVertical = true
        return sc
    }()
    lazy var lblDescOne : UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        lbl.textColor = UIColor.darkGray
        lbl.text = "TEHRAN"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.alpha = 0.0
        return lbl
    }()
    
    let btnClose : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    let btnShowMore : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "upArrow"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.alpha = 0.0
        btn.layer.cornerRadius = 25
        return btn
    }()
    var ivTopWC : NSLayoutConstraint!
    var ivTopTC : NSLayoutConstraint!
    var imgHC : NSLayoutConstraint!
    var bViewWC : NSLayoutConstraint!
    var bViewBCsecondary : NSLayoutConstraint!
    var bViewBCprimary : NSLayoutConstraint!
    var hasShownMore: Bool = false
    var oldImgHeight : CGFloat = 0
    var bView : briefView!
    init(item: Item, closeBtnFrame: CGRect) {
        self.item = item
        self.item.rate = (String(format: "%.1f", self.item.rate) as NSString).doubleValue
        super.init(nibName: nil, bundle: nil)
        vm = DetailVM(viewController : self)
        view.backgroundColor = .white
        btnClose.frame = closeBtnFrame
        addContent()
        btnShowMore.addTapGestureRecognizer(action: {[weak self] in
            guard let sSelf = self else { return }
            sSelf.vm.handleTapOnShowMore()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initView()
    }
    private func addContent() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.addSubview(ivTop)

        ivTop.translatesAutoresizingMaskIntoConstraints = false
        ivTopWC = ivTop.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ivTopWC.isActive = true
        imgHC = ivTop.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height) * 0.7)
        imgHC.isActive = true
        oldImgHeight = imgHC.constant
        ivTop.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ivTopTC = ivTop.topAnchor.constraint(equalTo: view.topAnchor,constant: 110)
        ivTopTC.isActive = true

        view.addSubview(lblDescOne)

        lblDescOne.widthAnchor.constraint(equalTo: ivTop.widthAnchor, multiplier: 0.9).isActive = true
        lblDescOne.heightAnchor.constraint(equalTo: ivTop.widthAnchor, multiplier: 0.2).isActive = true
        lblDescOne.centerXAnchor.constraint(equalTo: ivTop.centerXAnchor).isActive = true
        lblDescOne.centerYAnchor.constraint(equalTo: ivTop.centerYAnchor).isActive = true

        view.addSubview(btnShowMore)

        btnShowMore.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btnShowMore.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnShowMore.bottomAnchor.constraint(equalTo: ivTop.bottomAnchor,constant: -20).isActive = true
        btnShowMore.centerXAnchor.constraint(equalTo: ivTop.centerXAnchor).isActive = true
        
        bView = briefView(vc: self,initial: "Tehran is the capital of Iran, in the north of the country. Its central Golestan Palace complex, with its ornate rooms and marble throne, was the seat of power of the Qajar dynasty. The National Jewelry Museum holds many of the Qajar monarchs’ jewels, while the National Museum of Iran has artifacts dating back to Paleolithic times. The Milad Tower offers panoramic views over the city", backColor: .white)
        bView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bView)
        bView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        bViewWC = bView.widthAnchor.constraint(equalTo: ivTop.widthAnchor)
        bViewWC.isActive = true
        bViewBCprimary = bView.bottomAnchor.constraint(equalTo: ivTop.bottomAnchor)
        bViewBCprimary.isActive = true
        bViewBCsecondary = bView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -80)
        bViewBCsecondary.isActive = false
        bView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.bringSubviewToFront(ivTop)
        view.bringSubviewToFront(lblDescOne)
        view.bringSubviewToFront(btnShowMore)

    }
    
    private func initView() {
        
        ivTop.image = item.image
        let colors = ivTop.image!.getColors()
        lblDescOne.textColor = colors?.secondary
        btnShowMore.setTitleColor(colors?.background, for: .normal)
        btnShowMore.backgroundColor = colors?.secondary
        btnClose.transform = CGAffineTransform(rotationAngle: .pi/4)
        view.addSubview(btnClose)
        btnClose.addTarget(self, action: #selector(closeBtnAction), for: .touchUpInside)
        vm.animateFadeIn()
        
    }
    
    
    @objc private func closeBtnAction() {
//        navigationControsller?.popViewController(animated: true)
        let segue = DetailUnwindSegueHandler(identifier: nil, source: self, destination: MainViewController())
        segue.perform()
    }


    
}
