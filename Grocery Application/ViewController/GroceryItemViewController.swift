//  GroceryItemViewController.swift
//  Grocery Application
//  Created by Admin on 16/02/22.

import Foundation
import UIKit

class GroceryItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
/*-------------------------------------------- Array Declearation --------------------------------------------------*/
    var groceryItems = [[String:Any]]()
    var vegetable = [[String:Array<String>]]()
    var pullControl = UIRefreshControl()
    
    @IBOutlet weak var GroceryItemTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tabBarController?.tabBar.layer.zPosition = 0
        
        let vegitableData = ["Vegetable": ["Tomato", "Onion", "Cauliflower", "Lemon", "Chilli", "Capsicum", "Carrot"]] as [String:Array<String>]
        self.vegetable.append(vegitableData)
        
        let groceryData1 = ["Name":"Vegetables","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Vegetables" )!] as [String : Any]
        self.groceryItems.append(groceryData1)
        let groceryData2 = ["Name":"Cooking Essentials","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Cooking Essentials" )!] as [String : Any]
        self.groceryItems.append(groceryData2)
        let groceryData3 = ["Name":"Beverges","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Beverages" )!] as [String : Any]
        self.groceryItems.append(groceryData3)
        let groceryData4 = ["Name":"Dairy","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Dairy" )!] as [String : Any]
        self.groceryItems.append(groceryData4)
        let groceryData5 = ["Name":"Instant food","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Instant food" )!] as [String : Any]
        self.groceryItems.append(groceryData5)
        let groceryData6 = ["Name":"Ice Cream","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Ice Cream" )!] as [String : Any]
        self.groceryItems.append(groceryData6)
        let groceryData7 = ["Name":"Meat & Eggs","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Meat & Eggs" )!] as [String : Any]
        self.groceryItems.append(groceryData7)
        let groceryData8 = ["Name":"Chocolates","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Chocolates" )!] as [String : Any]
        self.groceryItems.append(groceryData8)
        let groceryData9 = ["Name":"Home & Cleaning","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Home & Cleaning" )!] as [String : Any]
        self.groceryItems.append(groceryData9)
        let groceryData10 = ["Name":"Biscuits","Category":["Tomato, Onion, Cauliflower, Lemon, Chilli, Capsicum, Carrot"], "Image": UIImage(named: "Biscuits" )!] as [String : Any]
        self.groceryItems.append(groceryData10)
/*-------------------------------------------- Navigation Bar --------------------------------------------------*/
        
        let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
        barAppearance.backgroundColor = .systemMint //Set navBar color to systemMint
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        GroceryItemTableView.delegate = self
        GroceryItemTableView.dataSource = self
        
//        NotificationCenter.default.addObserver(self, selector: #selector (updateMyCartNumber(_:)), name: NSNotification.Name("com.magneto.cart.number"), object: nil)
        
        //let categoryData1 = ["Name":"Vegetables","Artist":"David Guetta","Image":UIImage(named: "Vegetables" ) ?? ""] as [String : Any]
        
        if #available(iOS 15.0, *) //Micros explicitly set for iOS 15.0
        {
            self.GroceryItemTableView.sectionHeaderTopPadding = 0 //Set tableView Header padding to 0
        }
        
        pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        pullControl.addTarget(self, action: #selector(refeshListData(_:)), for: .valueChanged)
        self.GroceryItemTableView.refreshControl = pullControl
    }
    
//    @objc func updateMyCartNumber(_ notification: Notification){
//        print(notification.userInfo?["cartItemNumber"] as? [String:Any] ?? [:])
//    }
    
    @objc func refeshListData(_ sender:Any){
        self.pullControl.endRefreshing()
        //API Call Here
    }
    /*-------------------------------------------- For tableView Cell --------------------------------------------------*/
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
            if let dicData = self.groceryItems[indexPath.row] as? NSDictionary {
                cell?.lbl.text = dicData.value(forKey: "Name") as? String
                cell?.img.image = dicData.value(forKey: "Image")  as? UIImage
            }
            return cell!
        }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        2
//    }
    
    /*-------------------------------------------- For Table Header --------------------------------------------------*/
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             120
         }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
        {
            50 // set tableView header height to 50px
        }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
        {
            let headerView = UITableView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: self.GroceryItemTableView.frame.width,
                                                       height: 50))
            
        
            headerView.backgroundColor = .black
            
            let headerLabel = UILabel()
            headerLabel.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width, height: headerView.frame.height)
            
            headerLabel.text = "Grocery"
            headerLabel.font = .systemFont(ofSize: 22)
            headerLabel.font = .boldSystemFont(ofSize: 20)
            headerLabel.textColor = .white
            
            headerView.addSubview(headerLabel) //move label on header (below to above)
            
            return headerView // return headerView to tableView
        }
        
    /*-------------------------------------------- For Table Footer --------------------------------------------------*/
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
        {
            2 // set tableView footer height to 50px
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
        {
            let footerView = UITableView (frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: self.GroceryItemTableView.frame.width,
                                                        height: 2))
            footerView.backgroundColor = .black // set footer background color to colorName : black
            return footerView // return footerView to tableView
        }
        
    /*----------------------------------- Delegate & DataSource Methods -----------------------------------------*/
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        if let dicData = self.groceryItems[indexPath.row] as? NSDictionary {
            vc?.groceryItemName = dicData.value(forKey: "Name") as? String ?? ""
//            vc?.groceryItemCategory = dicData.value(forKey: "Category") as? String ?? ""
            navigationController?.pushViewController(vc!, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
             
    }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return groceryItems.count
    }
    
}

