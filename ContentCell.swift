//
//  ContentCell.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit

class ContentBaseCell: UICollectionViewCell {
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
class ContentCell: ContentBaseCell {
    
    var content: GlossaryContent? {
        didSet {
            
            contentLabel.text = content?.contentName
            
            thumbnailImgView.image = UIImage(named: (content?.thumbnailImageName)!)

            
        }
    }
    
    // MOREL Glossary thumbnail image
    let thumbnailImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "morel")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Morel Mushroom"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func setupViews() {
        addSubview(thumbnailImgView)

        addSubview(contentLabel)

        addConstrainsWithFormat(format: "H:|-16-[v0(80)]-16-|", views: thumbnailImgView)
        addConstrainsWithFormat(format:  "V:|-10-[v0(80)]-10-|", views: thumbnailImgView)
 
        
        addConstrainsWithFormat(format: "V:|-35-[v0(30)]-35-|", views: contentLabel)
        addConstrainsWithFormat(format: "H:|-112-[v0]-16-|", views: contentLabel)
        
    }
}

