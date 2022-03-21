//
//  DetailsViewController.swift
//  Grocery Application
//
//  Created by Admin on 18/02/22.
//
import Foundation
import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, productListTableViewCellDelegate{

    var vegetableArray = ["Tomato", "Onion", "Cauliflower", "Lemon", "Chilli", "Capsicum", "Carrot"]
    var vegitableItemDescription = ["500g 18₹", "1kg 32₹", "1piece 32₹", "200g 13₹", "100g 12₹", "3piece 16₹", "500g 20₹"]
    var groceryItemName = ""
    var groceryItemNameCategory = ""
    let cartInfo = ["cartNumber" : ["cartItemNumber": 1, "User Name": "John"]]
    var counter: Int = 0
    
    @IBOutlet weak var ProductDetailTableView: UITableView!
    static var updateNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barAppearance = UINavigationBarAppearance() // create property for navigationBar appearance
        barAppearance.backgroundColor = .systemMint //Set navBar color to systemMint
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        ProductDetailTableView.delegate = self
        ProductDetailTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {       
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? DetailTableViewCell
        cell?.productLabel.text = "\(vegetableArray[indexPath.row])"
        cell?.productImage.image = UIImage(named: vegetableArray[indexPath.row])
        cell?.productDetailLabel.text = "\(vegitableItemDescription[indexPath.row])"
        cell?.numProductLabel.text = "\(DetailsViewController.updateNum)"
        cell?.delegate = self
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = storyboard?.instantiateViewController(withIdentifier: "CartVC") as? ProductViewController
           
           vc?.image = UIImage(named: vegetableArray[indexPath.row])!
           vc?.productName = vegetableArray[indexPath.row]
           vc?.descriptionProduct = vegitableItemDescription[indexPath.row]
        vc?.counta = DetailsViewController.updateNum
           navigationController?.pushViewController(vc!, animated: true)
        
           tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == .delete
        {
            tableView.beginUpdates()
            vegetableArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

    
    func addToCart(){
        counter += 1
        DetailsViewController.updateNum = counter
        print("I'm adding \(DetailsViewController.updateNum) items to the cart")
    }
    
    
    func removeFromCart() {
        counter = counter - 2
        DetailsViewController.updateNum = counter
        print("I'm removing \(DetailsViewController.updateNum) items to the cart")
    }

//        NotificationCenter.default.post(name: NSNotification.Name("com.magneto.cart.number"), object: nil, userInfo: cartInfo)
}

