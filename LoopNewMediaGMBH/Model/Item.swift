//
//  Item.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/8/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit


class Item {
    
    var image = UIImage()
    var title = String()
    var subtitle = String()
    var desc = String()
    var rate = Double()
    
    var frame = CGRect()
    var index = IndexPath()
    var containerCollection: UICollectionView?
    
    init() {
    }
    
    init(image: UIImage, title: String, subtitle: String, desc: String, rate: Double) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.rate = rate
    }
    
    init(imageName: String, title: String, subtitle: String, desc: String, rate: Double) {
        self.image = UIImage(named: imageName) ?? UIImage()
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.rate = rate
    }
    
}
