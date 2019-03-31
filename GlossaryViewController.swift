//
//  GlossaryViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit

class GlossaryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var glossContent: [GlossaryContent] = {
        
        var morelContent = GlossaryContent()
        morelContent.contentName = "Morel Mushroom"
        morelContent.thumbnailImageName = "morel"
        
        var dandelionContent = GlossaryContent()
        dandelionContent.contentName = "Dandelion"
        dandelionContent.thumbnailImageName = "dandy"
        
        var echinaceaContent = GlossaryContent()
        echinaceaContent.contentName = "Echinacea"
        echinaceaContent.thumbnailImageName = "coneflower"
        
        var ChanterelleContent = GlossaryContent()
        ChanterelleContent.contentName = "Chanterelle"
        ChanterelleContent.thumbnailImageName = "chanterelle"
        
        var brownButtonContent = GlossaryContent()
        brownButtonContent.contentName = "Brown Button"
        brownButtonContent.thumbnailImageName = "cremini"
        
        var deathCapContent = GlossaryContent()
        deathCapContent.contentName = "Death Cap"
        deathCapContent.thumbnailImageName = "whitemush"
        
        return [morelContent, dandelionContent, echinaceaContent, ChanterelleContent, brownButtonContent, deathCapContent]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let titleLabel = UILabel()
        titleLabel.text = "Glossary"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor(red: 17/255, green: 153/255, blue: 142/255, alpha: 1)
        
        
        collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    // Number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return glossContent.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ContentCell
        
        cell.content = glossContent[indexPath.item]
        
        cell.backgroundColor = UIColor.white
        
        
        return cell
    }
    
    
    // Cell index path
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        if indexPath.item == 0 {
            let newVc = MorelViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 1 {
            let newVc = DandelionViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 2 {
            let newVc = EchinaceaViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 3 {
            let newVc = ChanterelleViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 4 {
            let newVc = BrownButtonViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 5 {
            let newVc = DeathCapViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        
    }
    
    // Sizing for cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // Line Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
}
