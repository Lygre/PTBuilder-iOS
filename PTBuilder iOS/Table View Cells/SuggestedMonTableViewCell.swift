//
//  SuggestedMonTableViewCell.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/3/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class SuggestedMonTableViewCell: UITableViewCell {

	
	@IBOutlet weak var suggestedMonImage: UIImageView!
	@IBOutlet weak var suggestedMonLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
