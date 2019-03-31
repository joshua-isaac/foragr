//
//  ChanterelleViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct ChanterelleCellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class ChanterelleViewController: UITableViewController {
    
    var nature = [ChanterelleCellData]()
    var consumption = [ChanterelleCellData]()
    var sensory = [ChanterelleCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        menuBar.tableView = tableView
        
        self.navigationItem.title = "Chanterelle"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Chanterelle"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        nature = [ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "The common chanterelle is a superb eating mushroom that can be picked even in winter, when there’s not much else available to mushroom foragers.  "), ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "If there's been sufficient rain, chanterelles will pop up in large numbers as early as the beginning of summer, but common chanterelles normally fruit in August."), ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-5"), contentTitle: "FORAGING GUIDELINES", content: "Common chanterelles can be confused with pale chanterelles and false chanterelles, which don't have theit characteristic apricot smell. Pale chanterelles are also stronger and paler in color than common chanterelles, while false chanterelles have softer, thinner stems and are dark brown near their feet. False chanterelles aren't toxic, but are rather watery and boring in taste. A more unfortunate mix-up would be with the toxic brown roll-rim, which also grows under trees, but has a pronounced inrolled rim along the cap.")]
        
        consumption = [ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-6"), contentTitle: "PREPERATION", content: "It may be necessary to carefully rinse your chantarelles—especially if you've picked them in spruce plantations and if there's a lot of forest residue on the mushrooms that can't be brushed off. Don’t eat them raw, but fry or blanch them for a few minutes in water or white wine. Sauté chantarelles on relatively high heat for a few minutes for juicy, crisp results, or for 15 minutes if prefer them more caramelized. Lower heat will turn the mushrooms into a brown, watery mush.!"), ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "Chanterelles are delicious fried in goose fat, butter, or olive oil. They pair well with apricots, herbs, ginger, and pepper. Fold them into a risotto, or spread them on good bread with a crystallized cheese and smoked ham. Roasted chanterelles make a great filling for mushroom quiches and are well suited to soups, sauces, and braises. You can also fry them with garlic and cream or make ice cream from chanterelles."), ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "Store the chanterelles in an airtight plastic container inside the crisper drawer of your refrigerator, where they will keep for up to a week. Freeze, salt, or pickle the mushrooms that you don't use right away to extend their shelf life. If you freeze the chanterelles, fry them first, as otherwise they might become bitter. You can also wash and store them in olive oil with some herbs such as marjoram or thyme, but this will shorten their shelf life.")]
        
        sensory = [ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "Common chanterelles have a distinctive apricot scent."), ChanterelleCellData(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "Common chanterelles have a sharp peppery and somewhat bitter flavor that disappears after cooking. Their flesh is firm and fibrous.")]
        
        self.tableView.separatorStyle = .none
        self.tableView.register(messageCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 700
        self.tableView.allowsSelection = false
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        view.addConstrainsWithFormat(format: "H:|[v0(375)]|", views: menuBar)
        view.addConstrainsWithFormat(format: "V:|-[v0(50)]-|", views: menuBar)
    }
    
    // NEEDS TO CHANGE ON MenuBar INDEXPATH CHANGE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! messageCell
        let currentIndex = menuBar.currentIndex
        let row = indexPath.row
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.contentView.layoutMargins.top = 500
        
        cell.contentImage = nature[row].image
        cell.contentTitle = nature[row].contentTitle
        cell.content = nature[row].content
        cell.layoutSubviews()
        
        if currentIndex == 1 {
            cell.contentImage = consumption[row].image
            cell.contentTitle = consumption[row].contentTitle
            cell.content = consumption[row].content
            cell.layoutSubviews()
            
            return cell
        } else if currentIndex == 2 {
            cell.contentImage = sensory[row].image
            cell.contentTitle = sensory[row].contentTitle
            cell.content = sensory[row].content
            cell.layoutSubviews()
            
            return cell
        }
        
        return cell
    }
    
    // NEEDS TO CHANGE ON MenuBar INDEXPATH CHANGE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentIndex = menuBar.currentIndex
        if currentIndex == 1 {
            return consumption.count
        } else if currentIndex == 2 {
            return sensory.count
        } else {
            return nature.count
        }
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}


