//
//  LNMScrollView.swift
//  LoopNewMediaGMBH
//
//  Created by Benyamin Mokhtarpour on 9/21/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class LNMScrollView : UIScrollView {
    var shouldScrollToEnd : Bool = false {
        didSet {
            scrollManager(ScrollToEnd: shouldScrollToEnd)
        }
    }
    var shouldScrollToTop : Bool = false {
        didSet {
            scrollManager(ScrollToEnd: shouldScrollToTop)
        }
    }
    var contentView : UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        print("CONTENT SIZE IS:",self.contentSize)
        initVew()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initVew() {
        addContentView()

    }
    func changeBG(color : UIColor) {
        self.backgroundColor = color
        
    }

    func changeContentSize(height : CGFloat,width : CGFloat) {
        contentSize = CGSize(width: width, height: height)
        self.layoutIfNeeded()

    }
    private func addContentView() {
        self.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    private func scrollManager(ScrollToEnd: Bool = false,ScrollToTop: Bool = false) {
        if ScrollToEnd {
            let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
            self.setContentOffset(bottomOffset, animated: true)
        }
        if ScrollToTop {
            self.setContentOffset(.zero, animated: true)
        }
    }
    
}
