//
//  cartTableViewCell.swift
//  cartdic2
//
//  Created by Coding Hands on 20/09/22.

 protocol cartTableViewCellDelegate {
     func QntyUpdated(num:Int, index: IndexPath?)
  
}
import UIKit

class cartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagecell: UIImageView!
    
    @IBOutlet weak var priceCell: UILabel!
    
    @IBOutlet weak var quantitycell: UILabel!
    
    var delegate : cartTableViewCellDelegate?
    var index : IndexPath?
        
    var numOfItems = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func incrementButton(_ sender: Any) {
        delegate?.QntyUpdated(num: numOfItems + 1, index:index)
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        if numOfItems > 0 {
            delegate?.QntyUpdated(num: numOfItems - 1, index: index)
        
        }

    }
    
}
