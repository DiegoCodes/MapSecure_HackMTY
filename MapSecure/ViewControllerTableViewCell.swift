//
//  ViewControllerTableViewCell.swift
//  TermoAppAlpha
//
//  Created by Diego Perez on 11/22/17.
//  Copyright © 2017 DiegoCodes. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var SubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
