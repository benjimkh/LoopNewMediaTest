//
//  ReviewVC.swift
//  LoopNewMedia
//
//  Created by Benyamin Mokhtarpour on 9/19/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.

import UIKit

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var reviews = [Review]()
    
    private let btnClose: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "plus"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.alpha = 0.6
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.alpha = 0.6
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Reviews (1458)"
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    static let tableCellID = "tableCellID"
    private let tbl: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviews = MockDataSource.mockReviews
        initView()
    }
    
    private func initView() {
        
        view.backgroundColor = .white
        
        view.addSubview(btnClose)
        view.addSubview(lblTitle)
        
        tbl.register(ReviewCell.self, forCellReuseIdentifier: ReviewViewController.tableCellID)
        tbl.delegate = self
        tbl.dataSource = self
        view.addSubview(tbl)
        
        btnClose.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        btnClose.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        btnClose.widthAnchor.constraint(equalToConstant: 20).isActive = true
        btnClose.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        lblTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: btnClose.leftAnchor, constant: -8).isActive = true
        lblTitle.topAnchor.constraint(equalTo: btnClose.topAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalTo: btnClose.heightAnchor).isActive = true
        
        tbl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tbl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tbl.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 8).isActive = true
        tbl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
        btnClose.transform = CGAffineTransform(rotationAngle: .pi/4)
        btnClose.addTarget(self, action: #selector(btnCloseAction), for: .touchUpInside)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewViewController.tableCellID, for: indexPath) as! ReviewCell
        cell.commentCalculatedHeight = 90 + reviews[indexPath.row].descNeededHeight(width: tableView.frame.width - 16)
        cell.review = reviews[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 90 + reviews[indexPath.row].descNeededHeight(width: tableView.frame.width - 16)
        return height
    }
    
    @objc private func btnCloseAction() {
        dismiss(animated: true, completion: nil)
    }
    
}
