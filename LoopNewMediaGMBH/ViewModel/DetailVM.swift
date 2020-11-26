//
//  DetailVM.swift
//  LoopNewMediaGMBH
//
//  Created by Benyamin Mokhtarpour on 9/20/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import UIKit

class DetailVM : NSObject {
    weak var vc: DetailVC?

    init(viewController: DetailVC) {
        self.vc = viewController
    }
    func handleTapOnShowMore() {
        vc?.imgHC.constant = vc!.hasShownMore ? (vc?.oldImgHeight)! : ((UIScreen.main.bounds.height) / 3)
        vc?.hasShownMore = !vc!.hasShownMore
        vc?.bViewWC.constant += vc!.hasShownMore ? 50 : -50
        vc?.bViewBCprimary.isActive = vc!.hasShownMore ? false : true
        vc?.bViewBCsecondary.isActive = vc!.hasShownMore ? true : false
//        vc?.IVBC.isActive = vc!.hasShownMore ? true : false
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.vc?.view.layoutIfNeeded()
            self.vc?.btnShowMore.setImage(self.vc!.hasShownMore ? UIImage(named: "downArrow") : UIImage(named: "upArrow") , for: .normal)
        }, completion: nil)
    }
    func animateFadeIn() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {[weak self] in
            guard let sSelf = self else { return }
            sSelf.vc!.lblDescOne.alpha = 1.0
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {[weak self] in
                guard let sSelf = self else { return }
                sSelf.vc!.btnShowMore.alpha = 1.0
            }, completion: { [weak self](finished: Bool) in
                guard let sSelf = self else { return }
                sSelf.vc!.btnShowMore.hoveraAnimation()
            })
        })
    }
    private func showView(vi: UIView, completion: @escaping ((Bool)->Void)) {
        UIView.animate(withDuration: 0.3, animations: {
            vi.alpha = 1
        }, completion: completion)
    }


    func showMoreDetails() {
        print("showMoreDetails")
        vc?.ivTop.lef
        UIView.animate(withDuration: 0.3, animations: {
            vi.alpha = 1
        }, completion: completion)

    }

}
