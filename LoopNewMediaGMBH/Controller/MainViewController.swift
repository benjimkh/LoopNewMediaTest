//
//  MainVC.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/8/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit


protocol DidSelectDelegate {
    func didSelect(collection: UICollectionView, index: IndexPath, item: Item)
    func didSelect(item: Item)
}
class MainViewController: MainVC, DidSelectDelegate{
    func didSelect(item: Item) {}
    
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        return sv
    }()
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
    
    private var topViewMaxHeight: CGFloat = 34
    var topViewHeightConstraint: NSLayoutConstraint!
    lazy var viewTopBar: TopBarView = {
        let vi = TopBarView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        return vi
    }()
    
    
    private let collectionV = "collectionV"
    private let cvContainer: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    let topCV = topCVView()
    let middleCV = middleCVView()
    let bottomView = HorizontalCellCV()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func initView() {
        
        view.backgroundColor = .white
        
            // Title Label Setup
        view.addSubview(viewTopBar)
        viewTopBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewTopBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewTopBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        topViewHeightConstraint = viewTopBar.heightAnchor.constraint(equalToConstant: 30)
        topViewHeightConstraint.isActive = true
        
            // Collection Setup
        cvContainer.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionV)
        cvContainer.delegate = self
        cvContainer.dataSource = self
        view.addSubview(cvContainer)
        cvContainer.topAnchor.constraint(equalTo: viewTopBar.bottomAnchor, constant: 10).isActive = true
        cvContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cvContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cvContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true


        topCV.delegate = self
        middleCV.delegate = self
        bottomView.delegate = self
        
    }
 
    @objc private func navBarButtonAction() {}
    
}

    // MARK:- Collection Delegate & DataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionV, for: indexPath)
        switch indexPath.item {
        case 0:
            if !cell.contentView.subviews.contains(topCV) {
                cell.contentView.subviews.forEach { (vi) in
                    vi.removeFromSuperview()
                }
                cell.contentView.addSubview(topCV)
                topCV.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
                topCV.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
                topCV.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
                topCV.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true

            }
            return cell
        case 1:
            if !cell.contentView.subviews.contains(middleCV) {
                cell.contentView.subviews.forEach { (vi) in
                    vi.removeFromSuperview()
                }
                cell.contentView.addSubview(middleCV)
                middleCV.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
                middleCV.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
                middleCV.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
                middleCV.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true

            }
            return cell
        case 2:
        if !cell.contentView.subviews.contains(bottomView) {
            cell.contentView.subviews.forEach { (vi) in
                vi.removeFromSuperview()
            }
            cell.contentView.addSubview(bottomView)
            bottomView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            bottomView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        }
        return cell
        default:
            return cell
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 180)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 200)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 160)
        default:
            return CGSize(width: collectionView.frame.width, height: 200)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = topViewMaxHeight - scrollView.contentOffset.y
        print(offset)
        if CGFloat(0) <= offset && offset <= topViewMaxHeight {
            topViewHeightConstraint.constant = offset
            UIView.animate(withDuration: 0.3) {[weak self] in
                guard let sSelf = self else {
                    return
                }
                sSelf.view.layoutIfNeeded()
            }
        } else if offset < 0 {
            topViewHeightConstraint.constant = 0
            UIView.animate(withDuration: 0.08) {[weak self] in
                guard let sSelf = self else {
                    return
                }
                sSelf.view.layoutIfNeeded()
            }
        } else if offset > topViewMaxHeight {
            topViewHeightConstraint.constant = topViewMaxHeight
            UIView.animate(withDuration: 0.3) {[weak self] in
                guard let sSelf = self else {
                    return
                }
                sSelf.view.layoutIfNeeded()
            }
        }
        
    }
    
    func didSelect(collection: UICollectionView, index: IndexPath, item: Item) {
        let cell = collection.cellForItem(at: index)
        let loc = cell!.convert(cell!.bounds, to: view)
        
        MainViewController.fakeBackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(MainViewController.fakeBackView)
        
        MainViewController.fakeBackView.alpha = 0
        MainViewController.fakeView.layer.cornerRadius = 10
        MainViewController.fakeView.image = item.image
        MainViewController.fakeView.contentMode = .scaleAspectFill
        MainViewController.fakeView.clipsToBounds = true
        MainViewController.fakeView.frame = loc
        view.addSubview(MainViewController.fakeView)
        
        
        let closeBtnLoc = viewTopBar.btnPlus.convert(viewTopBar.btnPlus.bounds, to: view)
        MainViewController.fakeCloseBtn.frame = closeBtnLoc
        let itm = item
        itm.frame = cell!.convert(cell!.bounds, to: UIApplication.shared.keyWindow)
        performSegue(item: itm, closeBtnFrame: closeBtnLoc)
    }
    
    private func performSegue(item:Item, closeBtnFrame: CGRect) {
        
        let segue = DetailSegue(identifier: nil, source: self, destination: DetailVC(item: item, closeBtnFrame: closeBtnFrame))
        segue.isInner = false
        segue.perform()
        
    }
    
}
    // MARK:- Top View Delegate
extension MainViewController: TopBarViewDelegate {
    func didTapOnSearchBtn() {
        print("Search Btn Tapped")
    }
    
    func didTapOnPlusBtn() {
        print("Plus Btn Tapped")
    }
    
    
}
