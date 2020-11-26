//
//  VerticalCellCV.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/8/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class middleCVView: BaseCellCV, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var items = [Item]()
    
    var delegate : DidSelectDelegate?
    
    private let middlecvIdentifier = "middlecvIdentifier"
    
    init() {
        super.init(title: "DISCOVER TEHRAN")
        items = MockDataSource.mockVerticalItems
        translatesAutoresizingMaskIntoConstraints = false
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initView() {
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(ImageCell.self, forCellWithReuseIdentifier: middlecvIdentifier)
        super.initView()
        btnShowAll.addTapGestureRecognizer {[weak self] in
            guard let sSelf = self else { return }
            print("TAPPED ON MIDDLE SHOW ALL")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: middlecvIdentifier, for: indexPath) as! ImageCell
        cell.imageView.image = items[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 0.7, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.row].index = indexPath
        items[indexPath.row].containerCollection = collectionView
        delegate?.didSelect(collection: collectionView, index: indexPath, item: items[indexPath.row])
    }
    
}
