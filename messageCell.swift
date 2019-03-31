//
//  messageCell.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-09.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit
import Foundation

class BaseCell: UICollectionViewCell {
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

class messageCell: UITableViewCell {
    
    
    var contentImage: UIImage?
    var contentTitle: String?
    var content: String?
    
    var contentImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var messageTitleView: UITextView = {
        var titleView = UITextView()
        titleView.textAlignment = NSTextAlignment.center
        titleView.isScrollEnabled = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = UIFont.boldSystemFont(ofSize: 20)
        titleView.isEditable = false
        return titleView
    }()
    
    var messageView: UITextView = {
        var textView = UITextView()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        return textView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        self.addSubview(contentImageView)
        self.addSubview(messageTitleView)
        self.addSubview(messageView)
        
        contentImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        contentImageView.widthAnchor.constraint(equalToConstant: 84).isActive = true
        contentImageView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: messageTitleView.topAnchor, constant: -10).isActive = true
        
        messageTitleView.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: -10).isActive = true
        messageTitleView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        messageTitleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageTitleView.bottomAnchor.constraint(equalTo: messageView.topAnchor, constant: -5).isActive = true
        
        messageView.topAnchor.constraint(equalTo: messageTitleView.bottomAnchor, constant: -5).isActive = true
        messageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        if let content = content {
            messageView.text = content
        }
        if let title = contentTitle {
            messageTitleView.text = title
        }
        if let image = contentImage {
            contentImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
