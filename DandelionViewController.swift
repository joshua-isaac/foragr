//
//  DandelionViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-09.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct DandelionCellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class DandelionViewController: UITableViewController {
    
    var nature = [DandelionCellData]()
    var consumption = [DandelionCellData]()
    var sensory = [DandelionCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white

        menuBar.tableView = tableView
        
        self.navigationItem.title = "Dandelion"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Dandelion"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        nature = [DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "Dandelions are the most common broadleaf weed in most lawns. It is found in virtually every kind of habitat, from openings in deep woods to cultivated fields, from rocky hillsides to fertile gardens and lawns."), DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "Flowering peaks in early summer with a second flush of flowers from mid-September to early October. Some plants may flower any time during the growing season."), DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-5"), contentTitle: "FORAGING GUIDELINES", content: "Everything, from the flower all the way down to the roots, is edible. And, dandelions also happen to be delicious. The taste of dandelion resembles a slightly bitter green like arugula. You can eat them fresh in salads, or cook them on the stove. However, Prostrate spurge (Euphorbia supina) and spotted spurge (E. maculata), which grow close to the ground and have opposite leaves, look a little like chickweed, and they can grow side by side with chickweed. But spurge exudes an acrid, white, milky sap when cut.")]
        
        consumption = [DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-6"), contentTitle: "PREPERATION", content: "The whole plant, except the roots, is delicious. Eaten raw, it tastes like corn-on-the-cob, or like cornsilk. Cooked, it's more like spinach. Always chop the entire plant, except the roots, into bite-sized pieces before using it. A salad vegetable and pot herb par excellence, it's also great in sandwiches. Use it like sprouts or in Middle Eastern recipes, with hummus in pita bread. It's wonderful steamed or added to soups, stews and casseroles. You can also sauté it. It cooks in about 5 minutes. Take care not to overcook it."), DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "An infusion of the above-ground parts has been used as a safe, gentle diuretic, and the chopped plant has been applied topically to various skin sores and irritations for hundreds of years (you'd think after all that time, the sores would finally heal!)"), DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "Rinse well, wrap in a damp paper towel and place in a plastic bag and Refrigerate. If the towel is kept moist, greens can last up to one week.")]
        
        sensory = [DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "Pear Fragrance Oil begins with the slightly bitter aroma of dandelion and wildflowers, perfectly mellowed out with tart fresh pear, green tea leaves, and cool aloe vera. This is a refreshing and clean scent that is uplifting in any application!"), DandelionCellData.init(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "Greens and earthy, nutty and pleasingly bitter, similar to the taste of endive or radicchio. It recommends pairing dandelion greens with bacon, goat cheese, nuts and lemon to complement the taste.")]
        
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


