//
//  BannerCV.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/8/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class topCVView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var items = [Item]()
    
    var delegate : DidSelectDelegate?
    
    private let topCV = "topCV"
    let cv: UICollectionView = {
        let layout = AnimatedCollectionViewLayout()
        layout.animator = LinearCardAttributesAnimator()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.backgroundColor = .clear
        return cv
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        items = MockDataSource.mockBannerItems
        translatesAutoresizingMaskIntoConstraints = false
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        cv.register(BannerCell.self, forCellWithReuseIdentifier: topCV)
        cv.delegate = self
        cv.dataSource = self
        addSubview(cv)
        cv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cv.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        cv.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCV, for: indexPath) as? BannerCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = items[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.row].index = indexPath
        items[indexPath.row].containerCollection = collectionView
        delegate?.didSelect(collection: collectionView, index: indexPath, item: items[indexPath.row])
    }
    
}
