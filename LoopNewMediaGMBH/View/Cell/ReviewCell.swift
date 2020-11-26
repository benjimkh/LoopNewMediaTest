//
//  ReviewCell.swift
//  Agentur LOOP New Media
//
//  Created by ahmad mohammadi on 9/12/20.
//  Copyright © 2020 AhmadMohammadi. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    private let viewAvatar: AvatarView = {
        let vi = AvatarView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        return vi
    }()
    
    private let lblName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .darkGray
        return lbl
    }()
    
    private let rateView: CosmosView = {
        let vi = CosmosView()
        vi.translatesAutoresizingMaskIntoConstraints = false
        vi.settings.starSize = 14
        vi.settings.starMargin = 2
        vi.settings.fillMode = .precise
        return vi
    }()
    
    private let lblTime: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .thin)
        return lbl
    }()
    
    private let lblComment: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .gray
        return lbl
    }()
    
    private var commentHeightConstraint: NSLayoutConstraint?
    
    var commentCalculatedHeight: CGFloat = 100 {
        didSet {
            if commentHeightConstraint != nil {
                //                commentHeightConstraint!.constant = commentCalculatedHeight
                //                layoutIfNeeded()
            }
        }
    }
    
    var review = Review() {
        didSet {
            viewAvatar.backColor = review.color
            viewAvatar.initial = review.userInitial
            lblName.text = review.userName
            lblTime.text = review.time
            lblComment.text = review.desc
            rateView.rating = review.rating
            layoutIfNeeded()
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        lblComment.removeFromSuperview()
    //    }
    
    private func initView() {
        
        addSubview(viewAvatar)
        addSubview(lblName)
        addSubview(rateView)
        addSubview(lblTime)
        addSubview(lblComment)
        
        viewAvatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        viewAvatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        viewAvatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        
        lblName.leftAnchor.constraint(equalTo: viewAvatar.rightAnchor, constant: 12).isActive = true
        lblName.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        lblName.bottomAnchor.constraint(equalTo: viewAvatar.centerYAnchor, constant: 0).isActive = true
        lblName.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        rateView.leftAnchor.constraint(equalTo: lblName.leftAnchor).isActive = true
        rateView.topAnchor.constraint(equalTo: viewAvatar.centerYAnchor, constant: 3).isActive = true
        rateView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        rateView.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        lblTime.leftAnchor.constraint(equalTo: rateView.rightAnchor, constant: 4).isActive = true
        lblTime.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        lblTime.centerYAnchor.constraint(equalTo: rateView.centerYAnchor).isActive = true
        lblTime.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        lblComment.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        lblComment.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        lblComment.topAnchor.constraint(equalTo: viewAvatar.bottomAnchor, constant: 8).isActive = true
        lblComment.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
                
    }
    
}
