//  CellTableViewCell.swift
//  Grocery Application
//  Created by Admin on 18/02/22.

import UIKit

class CellTableViewCell: UITableViewCell
{

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
