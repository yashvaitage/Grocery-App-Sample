//  HistoryViewController.swift
//  Grocery Application
//  Created by Admin on 18/02/22.
import UIKit

class History{
    var date: String?
    var itemName: [String]?
    
    init(date: String, itemName: [String]){
        self.date = date
        self.itemName = itemName
    }
}

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var date = ["25 February 2022","27 February 2022","28 February 2022"]
    //var history = ["Vegetables : Onion, Garlic, Potato, \nBraveges : Coca-Cola, \nChocolates : Dairy Milk, Cherry, \nBiscuits : Tiger, Hide & Seek","Braveges : Milk", "Instant Food : Knor Sweet Corn Soup"]
    
    

    
    @IBOutlet weak var HistroyTableView: UITableView!
    
    var history = [History]() // Create Class Instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*-------------------------------------------- Navigation Bar --------------------------------------------------*/
                
                let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
                barAppearance.backgroundColor = .systemMint //Set navBar color to systemMint
                
                navigationItem.standardAppearance = barAppearance
                navigationItem.scrollEdgeAppearance = barAppearance
                
              
                if #available(iOS 15.0, *) //Micros explicitly set for iOS 15.0
                {
                    self.HistroyTableView.sectionHeaderTopPadding = 0 //Set tableView Header padding to 0
                }
        
        history.append(History.init(date: "25 February 2022", itemName: ["Vegetables : Onion, Garlic, Potato, \nBraveges : Coca-Cola, \nChocolates : Dairy Milk, Cherry, \nBiscuits : Tiger, Hide & Seek"]))
        history.append(History.init(date: "26 February 2022", itemName: ["Vegetables : Tomato, Cucumber, Carrot, Cauliflower, Lemon \nBraveges : Coca-Cola, Milk \nChocolates : Dark Chocolate, Mangobite"]))
        history.append(History.init(date: "28 February 2022", itemName: ["Braveges :  Milk, Coffee Powder, Khari"]))
            }
    func numberOfSections(in tableView: UITableView) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history[section].itemName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "historycell", for: indexPath) as? ProductHistoryTableViewCell
        cell?.hplbl?.text = history[indexPath.section].itemName?[indexPath.row]
            return cell!
    }
    
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
                                                       width: self.HistroyTableView.frame.width,
                                                       height: 50))
            
        
            headerView.backgroundColor = .black
            
            let headerLabel = UILabel()
            headerLabel.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width, height: headerView.frame.height)
            
            headerLabel.text = history[section].date
            headerLabel.font = .systemFont(ofSize: 22)
            headerLabel.font = .boldSystemFont(ofSize: 20)
            headerLabel.textColor = .white
            
            headerView.addSubview(headerLabel) //move label on header (below to above)
            
            return headerView // return headerView to tableView
        }

}



//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//}
    


