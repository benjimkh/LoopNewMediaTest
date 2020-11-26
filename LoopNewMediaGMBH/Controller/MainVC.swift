//
//  MainVC.swift
//  LoopNewMediaGMBH
//
//  Created by BenyaminMokhtarpour on 9/20/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class MainVC : UIViewController {
    lazy var image : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "bluredbg")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        image.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}
