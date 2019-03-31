//
//  MoreGlossaryViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

import UIKit

class MoreGlossaryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var MoreGlossContent: [MoreContent] = {
        var gettingStarted = MoreContent()
        gettingStarted.contentName = "Getting Started"
        
        
        var foragingRules = MoreContent()
        foragingRules.contentName = "Foraging Rules"
        
        
        var healthSafe = MoreContent()
        healthSafe.contentName = "Health & Safety"
        
        var aboutForagr = MoreContent()
        aboutForagr.contentName = "About Foragr"
        
        
        return [gettingStarted, foragingRules, healthSafe, aboutForagr]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(red: 17/255, green: 153/255, blue: 142/255, alpha: 1)
        
        collectionView?.register(MoreContentCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
    }
    
    // Number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MoreGlossContent.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MoreContentCell
        
        cell.contentMore = MoreGlossContent[indexPath.item]
        
        return cell
    }
    
    // Cell index path
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        if indexPath.item == 0 {
            let newVc = GettingStartedViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 1 {
            let newVc = ForagingRulesViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else if indexPath.item == 2 {
            let newVc = HealthSafetyViewController()
            navigationController?.pushViewController(newVc, animated: true)
        } else {
            let newVc = AboutForagrViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
        
        // NEW PAGE
        //        let newVc = TestViewController()
        //        navigationController?.pushViewController(newVc, animated: true)
    }
    
    // Sizing for cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // Line Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}









