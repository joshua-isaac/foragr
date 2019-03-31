//
//  MenuBar.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-09.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 17/255, green: 153/255, blue: 142/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    
    let cellId = "cellID"
    let menuNames = ["NATURE", "CONSUMPTION", "SENSORY"]
    
    var currentIndex = 0
    
    weak var tableView: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(menuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstrainsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        _ = collectionView.selectItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, animated: false, scrollPosition: [])
        
        setupHorizontalBar()
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.white
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath.item
        tableView?.reloadData()
        
        print(indexPath.item)
        if indexPath.item == 1 {
            print("Consumption tab")
            
        } else if indexPath.item == 2 {
            print("Sensory tab")
            
        } else {
            print("Nature tab")
        }
        let x = CGFloat(indexPath.item) * frame.width / 3
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! menuCell
        
        cell.buttonTitle.text = menuNames[indexPath.item]
        cell.tintColor = UIColor(red: 17/255, green: 153/255, blue: 142/255, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class menuCell: BaseCell {
    
    let buttonTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.tintColor = UIColor(red: 13/255, green: 86/255, blue: 48/255, alpha: 1)
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            buttonTitle.textColor = isHighlighted ? UIColor.white: UIColor(red: 13/255, green: 86/255, blue: 48/255, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            buttonTitle.textColor = isSelected ? UIColor.white: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(buttonTitle)
        
        addConstrainsWithFormat(format: "H:|[v0]|", views: buttonTitle)
        addConstrainsWithFormat(format: "V:|[v0]|", views: buttonTitle)
        
        addConstraint(NSLayoutConstraint(item: buttonTitle, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: buttonTitle, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
