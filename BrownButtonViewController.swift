//
//  BrownButtonViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-10.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct BrownButtonCellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class BrownButtonViewController: UITableViewController {
    
    var nature = [BrownButtonCellData]()
    var consumption = [BrownButtonCellData]()
    var sensory = [BrownButtonCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        menuBar.tableView = tableView
        
        self.navigationItem.title = "Brown Button"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Brown Button"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        nature = [BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "The Brown Button, AKA Agaricus bisporus is an edible basidiomycete mushroom native to grasslands in Europe and North America. It has two color states while immature—white and brown—both of which have various names. When mature, it is known as portobello mushroom."), BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "Morels are one of the first great edible mushrooms of spring. They usually fruit in April and May, but can linger into June."), BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-5"), contentTitle: "FORAGING GUIDELINES", content: "Only pick morels that have firm, springy flesh and nice, white stems. By the end of their season, morels tend to be infested with larvae, beetles, and other small creatures, but unwelcome guests may be hiding in their intricate surface and hollow interior regardless of when they’re picked. Be thorough, then, when brushing and washing them—but also be careful not to oversoak them as morels are extremely porous. Harvest the mushroom by carefully twisting it loose or cutting it at its base. Check the cut to see if the mushroom is infested with vermin and if the flesh is even.")]
        
        consumption = [BrownButtonCellData(image: #imageLiteral(resourceName: "Uses"), contentTitle: "PREPERATION", content: "A bisporus is thought of as the universal mushroom. It may be substituted for almost any recipe in this or any other cookbook. This is one of the few mushrooms that can be eaten raw in a salad or for dips. Thickly sliced pieces, when sautéed, may be savored as delicate hor d' oeuvres. Added to vegetarian casseroles or stews, they may simulate hunks of meat."), BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "These health benefits, along with great taste, make cremini mushrooms a welcome addition to many meals. Use them with eggs, meats, or vegetable dishes. They're also excellent in soups, gravies, and stir-fries. Another aspect that makes them great for cooking is that they're very common in grocery stores. You won't have to spend a day in the woods to have them for dinner, although I admit that is part of the fun!"), BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "You may store fresh Agaricus in the refrigerator for a week in an open bowl covered with waxed paper, but avoid plastic. They may also be sautéed in butter and frozen. They are surprisingly good when cut into 1/2- to 3/4-inch slices and dried at home for later rehydration. Buttons may be pickled, spiced, or canned. Use a pressure cooker, applying fully adequate time, heat, and pressure, when canning them. Botulism is a serious risk when mushrooms are canned at home.")]
        
        sensory = [BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "A fresh Brown Button Mmushroom should smell earthy."), BrownButtonCellData(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "Woodsy flavour becomes stronger with cooking.")]
        
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


