//
//  EchinaceaViewController.swift
//  foragr
//
//  Created by joshua isaac on 2018-12-09.
//  Copyright © 2018 joshua isaac. All rights reserved.
//

struct EchinaceaCellData {
    let image: UIImage?
    let contentTitle: String?
    let content: String?
}

import UIKit



class EchinaceaViewController: UITableViewController {
    
    var nature = [EchinaceaCellData]()
    var consumption = [EchinaceaCellData]()
    var sensory = [EchinaceaCellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        menuBar.tableView = tableView
        
        self.navigationItem.title = "Echinacea"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Echinacea"
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        nature = [EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 2"), contentTitle: "WHERE TO FIND", content: "Echinacea purpurea (eastern purple coneflower, hedgehog coneflower, or purple coneflower) is a North American species of flowering plant in the sunflower family. It is native to eastern North America and present to some extent in the wild in much of the eastern, southeastern and midwestern United States as well as in the Canadian Province of Ontario. It is most common in the Ozarks and in the Mississippi/Ohio Valley"), EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-3"), contentTitle: "WHEN TO FIND", content: "Once your Echinacea is at least three years old, you can begin harvesting some of the roots for medicinal purposes. I do this after cutting back the Echinacea and harvesting the seeds and before I mulch in the fall. Harvest the roots by using a garden fork to gently lift the roots out of the soil."), EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-4"), contentTitle: "FORAGING GUIDELINES", content: "Some side effects have been reported such as fever, nausea, vomiting, bad taste, stomach pain, diarrhea, sore throat, dry mouth, headache, numbness of the tongue, dizziness, difficulty sleeping, a disoriented feeling, and joint and muscle aches. In rare cases, echinacea has been reported to cause inflammation of the liver.")]
        
        consumption = [EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-6"), contentTitle: "PREPERATION", content: "Steep in boiling water for fifteen to twenty minutes. For a decoction, use two teaspoons of dried root and simmer in one cup of water for twenty to thirty minutes. Strain out the leaves, petals, and roots before drinking the tea. You can also combine echinacea with other herbal tea elements!"), EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-7"), contentTitle: "USES", content: "Promoters of echinacea say that the herb encourages the immune system and reduces many of the symptoms of colds, flu and some other illnesses, infections, and conditions. Echinacea is a perennial plant, meaning it lasts for many years. It is approximately 1-2 feet (30-60 centimeters) tall when mature."), EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-8"), contentTitle: "STORAGE", content: "Roots usually dry in two to four days under optimum conditions without artificial heat or drying. If using forced air dryers, avoid temperatures exceeding 110ºF. Drying can be done on racks, screens, or boards. Weight loss is estimated at approximately 75% during drying. Roots must be dry before storage to avoid fungal and bacterial problems. Dry storage in heavy-gauge poly bags in fiberboard-closed barrels has been successful. Protect stored plant material from rodent and insect infestation. Maximum storage time is one year.")]
        
        sensory = [EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-10"), contentTitle: "SMELLS LIKE", content: "Slightly fatty and deeply sweet scent "), EchinaceaCellData(image: #imageLiteral(resourceName: "Asset 1-9"), contentTitle: "TASTES LIKE", content: "often described as tongue-tingling. In fact, some herbal product makers regard this quality as evidence of the herb's effectiveness. Echinacea is commonly combined with mint or with other ingredients such as lemongrass to make a more pleasant-tasting tea.")]
        
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

