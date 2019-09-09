//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by Muhammad Ashary on 09/09/19.
//  Copyright © 2019 M. Ashary. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet var memeImage: UIImageView!
    @IBOutlet var memeTitle: UILabel!
    @IBOutlet var memeTopText: UILabel!
    @IBOutlet var memeBottomText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
