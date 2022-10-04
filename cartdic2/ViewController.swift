//
//  ViewController.swift
//  cartdic2
//
//  Created by Coding Hands on 20/09/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var itemTable: UITableView!
    
    
    var productDetails = [["name":"Chair","image":"Chair","price":2000,"qnty":1],["name":"Table","image":"Table","price":15000,"qnty":1],["name":"Fan","image":"Fan","price":4000,"qnty":1]]  // array of dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTable.dataSource = self
        itemTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell") as! cartTableViewCell
        
        cell.delegate = self
        cell.index = indexPath
        
        let data = productDetails[indexPath.row]
        
        if let priceValue = data["price"] as? Int {
            cell.priceCell.text = "\(priceValue)"
            
        }
        if let quantity = data["qnty"] as? Int{
            cell.quantitycell.text = "\(quantity)"
            cell.numOfItems = quantity
        }
        
        if let imageAdd = data["image"] as? String {
            cell.imagecell.image = UIImage(named: "\(imageAdd)")
        }
    
        return cell
    }
}
extension ViewController : cartTableViewCellDelegate {
    func QntyUpdated(num: Int, index: IndexPath?) {
        if index == index {
            productDetails[index!.row]["qnty"] = num
            itemTable.reloadData()
        }
        totalAmount.text = "\(totalAmt())"
        
    }
    func totalAmt() -> Int{
        var sum = 0
        for product in productDetails {
            if let p = product["price"] as? Int, let q = product["qnty"] as? Int {
                sum += p * q
            }
        }
        return sum
    }
    
}
