//
//  Review.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/12/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class Review {
    
    var userInitial: String {
        get {
            if userName.count > 0 {
                return userName.first!.uppercased()
            } else {
                return ""
            }
        }
    }
    var userName = String()
    var color = UIColor()
    var rating = Double()
    var time = String()
    var desc = String()
    
    private var calculatedHeight: CGFloat?
    func descNeededHeight(width: CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = desc

        label.sizeToFit()
        return label.frame.height
    }
    
    init() {
        
    }
    
    init(userName: String, color: UIColor, rating: Double, time: String, desc: String) {
        self.userName = userName
        self.color = color
        self.rating = rating
        self.time = time
        self.desc = desc
    }
    
}
