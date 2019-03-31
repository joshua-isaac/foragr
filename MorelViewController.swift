//
//  MorelViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-09.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct CellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class MorelViewController: UITableViewController {

    var nature = [CellData]()
    var consumption = [CellData]()
    var sensory = [CellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white

        menuBar.tableView = tableView

        self.navigationItem.title = "Morel Mushroom"
        navigationController?.navigationBar.isTranslucent = false

        let titleLabel = UILabel()
        titleLabel.text = "Morel Mushroom"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel

   nature = [CellData.init(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "You'll find edible morel in rich soil that's full of nutrients—in parks, gardens, and open deciduous forests. They can also pop up in cemeteries and ramparts, often where wood chips have been laid down. They're a relatively rare find, so keep an eye on the forest floor."), CellData.init(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "Morels are one of the first great edible mushrooms of spring. They usually fruit in April and May, but can linger into June."), CellData.init(image: #imageLiteral(resourceName: "Asset 1-5"), contentTitle: "FORAGING GUIDELINES", content: "Only pick morels that have firm, springy flesh and nice, white stems. By the end of their season, morels tend to be infested with larvae, beetles, and other small creatures, but unwelcome guests may be hiding in their intricate surface and hollow interior regardless of when they’re picked. Be thorough, then, when brushing and washing them—but also be careful not to oversoak them as morels are extremely porous. Harvest the mushroom by carefully twisting it loose or cutting it at its base. Check the cut to see if the mushroom is infested with vermin and if the flesh is even.")]

        consumption = [CellData.init(image: #imageLiteral(resourceName: "Asset 1-6"), contentTitle: "PREPERATION", content: "Common morels must be cooked thoroughly before they're suitable for consumption. They can also be dried or frozen, but you should cook them—perhaps by poaching them in butter— before freezing. Use thawed morels only in stews, as their flesh has a tendency to toughen up. Rehydrate dried morels in cold water for a couple of hours and rinse them thoroughly before use."), CellData.init(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "LUse morels in sauces, soups, and stews or as a garnish; they marry beautifully, for example, with veal when cooked in butter, port wine, and cream, or with foie gras, garlic, and saffron. A chanterelle soup topped with butter-fried morels is delicious, as are morels sautéed with other spring vegetables. They also make a lovely filling for quiches; larger specimens can be stuffed and baked. Because their flavor is strong, you rarely need more than a few morels to perfume a dish with their unique flavor."), CellData.init(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "Frozen morels will keep for up to three months. Store fresh morels in the refrigerator in a loosely-closed bag, where they will keep for up to one week.")]

        sensory = [CellData.init(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "The best specimens have a musky mushroom scent—much like that of truffles."), CellData.init(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "Morels taste of wood and the forest floor. Their flesh is very porous and crisp.")]

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

