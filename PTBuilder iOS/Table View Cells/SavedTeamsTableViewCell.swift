//
//  SavedTeamsTableViewCell.swift
//  PTBuilder iOS
//
//  Created by Hugh Broome on 11/5/18.
//  Copyright © 2018 Hugh Broome. All rights reserved.
//

import UIKit

class SavedTeamsTableViewCell: UITableViewCell {

	
	@IBOutlet weak var savedTeamName: UILabel!
	
	
	@IBOutlet weak var mon1Image: UIImageView!
	@IBOutlet weak var mon2Image: UIImageView!
	@IBOutlet weak var mon3Image: UIImageView!
	@IBOutlet weak var mon4Image: UIImageView!
	@IBOutlet weak var mon5Image: UIImageView!
	@IBOutlet weak var mon6Image: UIImageView!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
