//
//  bottomSectionView.swift
//  LoopNewMedia
//
//  Created by Benyamin Mokhtarpour on 9/19/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import UIKit

class HorizontalCellCV: BaseCellCV, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var items = [Item]()
    
    var delegate : DidSelectDelegate?
    
    private let horizontalCollectionCellIdentifier = "horizontalCollectionCellIdentifier"
    
    init() {
        super.init(title: "DISCOVER SHIRAZ")
        items = MockDataSource.mockHorizontalItems
        translatesAutoresizingMaskIntoConstraints = false
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initView() {
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(ImageCell.self, forCellWithReuseIdentifier: horizontalCollectionCellIdentifier)
        super.initView()
        btnShowAll.addTapGestureRecognizer {[weak self] in
            guard let sSelf = self else { return }
            print("TAPPED ON BOTTOM SHOW ALL")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizontalCollectionCellIdentifier, for: indexPath) as! ImageCell
        cell.imageView.image = items[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 1.7, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.row].index = indexPath
        items[indexPath.row].containerCollection = collectionView
        delegate?.didSelect(collection: collectionView, index: indexPath, item: items[indexPath.row])
    }
    
}
