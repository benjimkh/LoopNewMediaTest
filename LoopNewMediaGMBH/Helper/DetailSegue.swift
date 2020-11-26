//
//  DetailSegue.swift
//  LoopNewMedia
//
//  Created by Benyamin Mokhtarpour on 9/19/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.

import UIKit

class DetailSegue: UIStoryboardSegue {
    var isInner : Bool = false
    override func perform() {
        
        scaleHandler()
    }
    
    private func scaleHandler() {
        let toViewControlelr = self.destination as! DetailVC
        let fromViewController = self.source as! MainViewController
        
        let containerView = fromViewController.view.superview
        
        toViewControlelr.view.alpha = 0
        toViewControlelr.ivTop.alpha = 0
        containerView?.addSubview(toViewControlelr.view)
        
        MainViewController.fakeBackView.addSubview(MainViewController.fakeCloseBtn)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            let midX = ((UIScreen.main.bounds.width) * 0.5) - ((UIScreen.main.bounds.width * 0.6) * 0.5)
            MainViewController.fakeView.frame = CGRect(x: midX, y: fromViewController.topViewHeightConstraint.constant + 80, width: UIScreen.main.bounds.width * 0.6, height: (UIScreen.main.bounds.height) * 0.7 )
            fromViewController.viewTopBar.btnPlus.transform = CGAffineTransform(rotationAngle: .pi/4)
            MainViewController.fakeCloseBtn.transform = CGAffineTransform(rotationAngle: .pi/4)
            MainViewController.fakeBackView.alpha = 1
            MainViewController.fakeView.layoutIfNeeded()
            for vi in fromViewController.view.subviews {
                if vi is UIImageView {
                    
                } else {
                    vi.alpha = 0.0

                }
            }
        }) { (done) in

            fromViewController.navigationController?.pushViewController(toViewControlelr, animated: false)
            
            toViewControlelr.view.alpha = 1
            toViewControlelr.ivTop.alpha = 1
            toViewControlelr.btnClose.alpha = 0.6
            MainViewController.fakeCloseBtn.removeFromSuperview()
            MainViewController.fakeBackView.removeFromSuperview()
            MainViewController.fakeView.removeFromSuperview()
            fromViewController.viewTopBar.btnPlus.transform = CGAffineTransform.identity
            for vi in fromViewController.view.subviews {
                    vi.alpha = 1.0
            }

        }
        
    }
}


class DetailUnwindSegueHandler: UIStoryboardSegue {
    var isInner : Bool = false

    override func perform() {
        if isInner {
            
        } else {
            scaleHandler()
        }
    }
    
    private func scaleHandler() {
        let fromViewController = self.source as! DetailVC
        let toViewController = self.destination as! MainViewController
        
        let window = UIApplication.shared.keyWindow
        
        let containerView = fromViewController.view.superview
        
        toViewController.view.alpha = 0
        toViewController.view.frame.origin.y += window?.safeAreaInsets.top ?? 0
        containerView?.addSubview(toViewController.view)
        
        guard let selectedCell = fromViewController.item.containerCollection?.cellForItem(at: fromViewController.item.index) else {
            fromViewController.navigationController?.popViewController(animated: false)
            return
        }
        selectedCell.alpha = 0
        
        let  destFrame = fromViewController.item.frame
        var destFrameNoTopInset = destFrame
        destFrameNoTopInset.origin.y -= (window?.safeAreaInsets.top ?? 0)
        
        let whiteView = UIView(frame: destFrameNoTopInset)
        whiteView.backgroundColor = .clear
        toViewController.view.addSubview(whiteView)
        
        let fakeImage = UIImageView(image: fromViewController.item.image)
        fakeImage.layer.cornerRadius = 10
        fakeImage.frame = fromViewController.ivTop.frame
        fakeImage.contentMode = .scaleAspectFill
        fakeImage.clipsToBounds = true
        window?.addSubview(fakeImage)
        
        fromViewController.ivTop.alpha = 0
//        toVC.viewTopBar.alpha = 0
        toViewController.viewTopBar.btnPlus.transform = CGAffineTransform(rotationAngle: .pi/4)
        fromViewController.btnClose.transform = CGAffineTransform(rotationAngle: .pi/4)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            fakeImage.frame = destFrame
            toViewController.view.alpha = 1
            fromViewController.btnClose.transform = CGAffineTransform.identity
            toViewController.viewTopBar.btnPlus.transform = CGAffineTransform.identity
            for vi in toViewController.view.subviews {
                    vi.alpha = 1.0
            }

        }) { (_) in
            
            fromViewController.navigationController?.popViewController(animated: false)
            selectedCell.alpha = 1
            fakeImage.removeFromSuperview()
            whiteView.removeFromSuperview()
            
            
        }
        
        
    }
}
