//
//  CoffeeListTableViewCell.swift
//  CoffeeApp
//
//  Created by Mac-OBS-18 on 17/01/23.
//

import UIKit

class CoffeeListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
