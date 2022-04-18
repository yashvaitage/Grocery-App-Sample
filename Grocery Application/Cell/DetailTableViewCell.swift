//
//  DetailTableViewCell.swift
//  Grocery Application
//
//  Created by Admin on 04/03/22.
//

import UIKit

@objc protocol productListTableViewCellDelegate: AnyObject{
    func addToCart()
    func removeFromCart() 
}

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var addProductBtn: UIButton!
    @IBOutlet weak var minusProductBtn: UIButton!
    @IBOutlet weak var numProductLabel: UILabel!
    
    
    weak var delegate: productListTableViewCellDelegate?
    var cartInfo = ["userInfo": ["cartNumber": 1, "userName": "Nishant"]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addProductBtnPressed(_ sender: Any) {
        delegate?.addToCart()
    }
    @IBAction func minusProductBtnPressed(_ sender: Any) {
        delegate?.removeFromCart()
    }
    
}
