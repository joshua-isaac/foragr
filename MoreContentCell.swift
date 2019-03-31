//
//  MoreContentCell.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit

class MoreBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Custom cell items
class MoreContentCell: MoreBaseCell {
    
    var contentMore: MoreContent? {
        didSet {
            contentLabel.text = contentMore?.contentName
        }
    }
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Morel Mushroom"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        
        addSubview(contentLabel)
        
        addConstrainsWithFormat(format: "V:|-35-[v0(30)]-35-|", views: contentLabel)
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: contentLabel)
    }
}
