//
//  DeathCapViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct DeathCapCellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class DeathCapViewController: UITableViewController {
    
    var nature = [DeathCapCellData]()
    var consumption = [DeathCapCellData]()
    var sensory = [DeathCapCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        menuBar.tableView = tableView
        
        self.navigationItem.title = "Death Cap"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Death Cap"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        nature = [DeathCapCellData(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "The death cap is one of the most poisonous mushrooms in the northern hemisphere. It grows throughout the entire temperate zone of Europe, Asia and North Africa. It was carried (probably with tree seedlings) to North America and Australia."), DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "The poisonous fungus is usually found during autumn but wet weather will prompt its early arrival."), DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-5"), contentTitle: "FORAGING GUIDELINES", content: "Amanita phalloides is said to have a quite pleasant taste, but is one of the most deadly species of poisonous mushrooms. You can be poisoned by touching a poisonous mushroom. As deadly as some toxins may be, touching the mushroom is harmless. The harmful toxins in mushrooms must be consumed in order to harm you.")]
        
        consumption = [DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-6"), contentTitle: "PREPERATION", content: "DO NOT USE. Ingesting one death cap mushroom is enough to kill a healthy adult."), DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "The Death Cap Mushroom has NO beneficial uses."), DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "DO NOT STORE")]
        
        sensory = [DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "A Death Cap mushroom smells slightly like rose petals; this test can be used if you can't tell from its physical appearance whether the mushroom is a Death Cap or other variety."), DeathCapCellData(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "DO NOT INJEST.")]
        
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

